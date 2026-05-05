architecture rtl of riscv_core is

  
  type state_type is (S_FETCH, S_DECODE, S_EXECUTE, S_MEMORY, S_LOAD_WAIT, S_WRITEBACK);
  signal state_r, state_next : state_type;

    --- for program counter
  signal pc_r, pc_next : std_logic_vector(31 downto 0);

  
  signal instr_r : std_logic_vector(31 downto 0);

  --- instruction extraction
  signal opcode   : std_logic_vector(6 downto 0);
  signal rd_addr  : std_logic_vector(4 downto 0);
  signal funct3   : std_logic_vector(2 downto 0);
  signal rs1_addr : std_logic_vector(4 downto 0);
  signal rs2_addr : std_logic_vector(4 downto 0);
  signal funct7   : std_logic_vector(6 downto 0);
  signal ifmt     : fmt_type;

   --- control signals for decoder
  signal alu_src    : std_logic;
  signal reg_write  : std_logic;
  signal mem_read   : std_logic;
  signal mem_write  : std_logic;
  signal mem_to_reg : std_logic;
  signal branch     : std_logic;
  signal jump       : std_logic;
  signal alu_op     : alu_func_type;
  signal is_shift   : std_logic;
  signal lui_sel    : std_logic;
  signal auipc_sel  : std_log66666ic;

  --- for RegFile
  signal rf_wr_en  : std_logic;
  signal rf_wdata  : std_logic_vector(31 downto 0);
  signal rf_rdata1 : std_logic_vector(31 downto 0);
  signal rf_rdata2 : std_logic_vector(31 downto 0);

   --- alu signals
  signal alu_a        : std_logic_vector(31 downto 0);
  signal alu_b        : std_logic_vector(31 downto 0);
  signal alu_result   : std_logic_vector(31 downto 0);
  signal alu_result_r : std_logic_vector(31 downto 0);

   --- for shifter output
  signal shift_result : std_logic_vector(31 downto 0);

    --- value from immediate generator
  signal imm_val : std_logic_vector(31 downto 0);

  
  signal dmem_rdata_r : std_logic_vector(31 downto 0);

  
  signal load_aligned  : std_logic_vector(31 downto 0);
  signal store_aligned : std_logic_vector(31 downto 0);
  signal store_wr_en   : std_logic_vector(3 downto 0);

  
  signal branch_taken : std_logic;

begin

   --- instruction extraction
  opcode   <= instr_r(6 downto 0);
  rd_addr  <= instr_r(11 downto 7);
  funct3   <= instr_r(14 downto 12);
  rs1_addr <= instr_r(19 downto 15);
  rs2_addr <= instr_r(24 downto 20);
  funct7   <= instr_r(31 downto 25);

  

  reg_file_inst: entity work.regFile
    generic map (width => 32)
    port map (
      rst0      => rst0,
      clk       => clk,
      wrRegEn   => rf_wr_en,
      wrRegNum  => rd_addr,
      wdata     => rf_wdata,                 --- RegFile instantiation
      rdRegNum1 => rs1_addr,
      rdRegNum2 => rs2_addr,
      rdata1    => rf_rdata1,
      rdata2    => rf_rdata2
    );

  alu_inst: entity work.alu
    port map (
      a        => alu_a,
      b        => alu_b,                   --- alu instantiation
      alu_func => alu_op,
      result   => alu_result
    );

  shifter_inst: entity work.shifter
    port map (
      a        => rf_rdata1,
      shamt    => alu_b(4 downto 0),      --- shifter instantiation
      alu_func => alu_op,
      result   => shift_result
    );

  imm_gen_inst: entity work.immediate_generator
    port map (
      instr   => instr_r,                 --- immediate_generator  instantiation
      ifmt    => ifmt,
      imm_out => imm_val
    );

  
  alu_a <= rf_rdata1;
  alu_b <= imm_val when alu_src = '1' else rf_rdata2;

  
  instr_decode: process(opcode, funct3, funct7)
  begin
    
    alu_src    <= '0';
    reg_write  <= '0';
    mem_read   <= '0';
    mem_write  <= '0';
    mem_to_reg <= '0';
    branch     <= '0';
    jump       <= '0';
    alu_op     <= ALU_ADD;                     --- safe defualt values for instruction decoder
    ifmt       <= R_TYPE;
    is_shift   <= '0';
    lui_sel    <= '0';
    auipc_sel  <= '0';

    case opcode is
      when "0110011" =>   
        ifmt      <= R_TYPE;
        reg_write <= '1';
        case funct3 is
          when "000" =>
            if funct7(5) = '1' then alu_op <= ALU_SUB;
            else                    alu_op <= ALU_ADD;
            end if;
          when "001" => alu_op <= ALU_SLL;  is_shift <= '1';
          when "010" => alu_op <= ALU_SLT;
          when "011" => alu_op <= ALU_SLTU;
          when "100" => alu_op <= ALU_XOR;
          when "101" =>
            is_shift <= '1';
            if funct7(5) = '1' then alu_op <= ALU_SRA;
            else                    alu_op <= ALU_SRL;
            end if;
          when "110" => alu_op <= ALU_OR;
          when "111" => alu_op <= ALU_AND;
          when others => alu_op <= ALU_ADD;
        end case;

      when "0010011" =>   
        ifmt      <= I_TYPE;
        alu_src   <= '1';
        reg_write <= '1';
        case funct3 is
          when "000" => alu_op <= ALU_ADD;
          when "001" => alu_op <= ALU_SLL;  is_shift <= '1';
          when "010" => alu_op <= ALU_SLT;
          when "011" => alu_op <= ALU_SLTU;
          when "100" => alu_op <= ALU_XOR;
          when "101" =>
            is_shift <= '1';
            if funct7(5) = '1' then alu_op <= ALU_SRA;
            else                    alu_op <= ALU_SRL;
            end if;
          when "110" => alu_op <= ALU_OR;
          when "111" => alu_op <= ALU_AND;
          when others => alu_op <= ALU_ADD;
        end case;

      when "0000011" =>   
        ifmt       <= I_TYPE;
        alu_src    <= '1';
        reg_write  <= '1';
        mem_read   <= '1';
        mem_to_reg <= '1';
        alu_op     <= ALU_ADD;

      when "0100011" =>   
        ifmt      <= S_TYPE;
        alu_src   <= '1';
        mem_write <= '1';
        alu_op    <= ALU_ADD;

      when "1100011" =>   
        ifmt   <= SB_TYPE;
        branch <= '1';

      when "0110111" =>   
        ifmt      <= U_TYPE;
        reg_write <= '1';
        lui_sel   <= '1';

      when "0010111" =>   
        ifmt      <= U_TYPE;
        reg_write <= '1';
        auipc_sel <= '1';

      when "1101111" =>   
        ifmt      <= UJ_TYPE;
        reg_write <= '1';
        jump      <= '1';

      when "1100111" =>   
        ifmt      <= I_TYPE;
        alu_src   <= '1';
        reg_write <= '1';
        jump      <= '1';
        alu_op    <= ALU_ADD;

      when others =>
        null;
    end case;
  end process instr_decode;

  -- Compares to decide if branch is taken

  branch_compare: process(rf_rdata1, rf_rdata2, funct3, branch)
  begin
    branch_taken <= '0';
    if branch = '1' then
      case funct3 is
        when "000" =>
          if rf_rdata1 = rf_rdata2 then branch_taken <= '1'; end if;
        when "001" =>
          if rf_rdata1 /= rf_rdata2 then branch_taken <= '1'; end if;
        when "100" =>
          if signed(rf_rdata1) < signed(rf_rdata2) then branch_taken <= '1'; end if;
        when "101" =>
          if signed(rf_rdata1) >= signed(rf_rdata2) then branch_taken <= '1'; end if;
        when "110" =>
          if unsigned(rf_rdata1) < unsigned(rf_rdata2) then branch_taken <= '1'; end if;
        when "111" =>
          if unsigned(rf_rdata1) >= unsigned(rf_rdata2) then branch_taken <= '1'; end if;
        when others =>
          null;
      end case;
    end if;
  end process branch_compare;

  --- On reset: start at FETCH, PC=0
  --- On clock: advance FSM state
  
  state_reg: process(rst0, clk)
  begin
    if rst0 = '0' then
      state_r      <= S_FETCH;
      pc_r         <= (others => '0');
      instr_r      <= (others => '0');
      alu_result_r <= (others => '0');
      dmem_rdata_r <= (others => '0');
    elsif rising_edge(clk) then
      state_r <= state_next;
      pc_r    <= pc_next;

      case state_r is

        when S_DECODE =>
          instr_r <= imem_rdata;

        when S_EXECUTE =>
          if is_shift = '1' then
            alu_result_r <= shift_result;
          else
            alu_result_r <= alu_result;
          end if;

        
        --  added S_LOAD_WAIT and moved data capture from S_MEMORY to S_LOAD_WAIT bc sync_sp_sram_sim_arch needs one cycle after cs is asserted before data is valid
        when S_LOAD_WAIT =>
          dmem_rdata_r <= load_aligned;

        when others =>
          null;
      end case;
    end if;
  end process state_reg;

  
  -- FSM  to control memory signals, register writes and PC updates

  state_comb: process(state_r, pc_r, opcode, branch_taken, jump,
                      mem_read, mem_write, alu_result_r, imm_val,
                      rf_rdata1, lui_sel, auipc_sel, reg_write,
                      store_wr_en, store_aligned, is_shift, branch)
  begin
    
    state_next <= state_r;
    pc_next    <= pc_r;

    imem_cs    <= '0';
    imem_wr_en <= "0000";
    imem_addr  <= pc_r;              
    imem_wdata <= (others => '0');

    dmem_cs    <= '0';
    dmem_wr_en <= "0000";
    dmem_addr  <= (others => '0');
    dmem_wdata <= (others => '0');

    rf_wr_en   <= '0';

    case state_r is

      when S_FETCH =>
        imem_cs    <= '1';
        imem_addr  <= pc_r;
        state_next <= S_DECODE;

      when S_DECODE =>
        state_next <= S_EXECUTE;

      when S_EXECUTE =>

        if mem_read = '1' then
          state_next <= S_MEMORY;
        else
          state_next <= S_WRITEBACK;
        end if;

      when S_MEMORY =>
        dmem_cs   <= '1';
        dmem_addr <= alu_result_r;

        if mem_write = '1' then
          
          dmem_wr_en <= store_wr_en;
          dmem_wdata <= store_aligned;
          
          imem_cs    <= '1';
          imem_addr  <= pc_r;   
          state_next <= S_DECODE;  
        else
          
          -- This gives the sync_sp_sram_sim one cycle to return valid data
          state_next <= S_LOAD_WAIT;
        end if;

      --  new state 
      when S_LOAD_WAIT =>
        state_next <= S_WRITEBACK;

      when S_WRITEBACK =>
    if reg_write = '1' then
        rf_wr_en <= '1';
    end if;

   
    if branch_taken = '1' then
        pc_next <= std_logic_vector(unsigned(pc_r) + unsigned(imm_val));
    elsif jump = '1' then
        if opcode = "1101111" then
            pc_next <= std_logic_vector(unsigned(pc_r) + unsigned(imm_val));
        else
            pc_next    <= alu_result_r;
            pc_next(0) <= '0';
        end if;
    else
        pc_next <= std_logic_vector(unsigned(pc_r) + 4);
    end if;

    if mem_write = '1' then
        state_next <= S_MEMORY;
    elsif branch = '1' then
        
        if branch_taken = '1' then
            imem_addr <= std_logic_vector(unsigned(pc_r) + unsigned(imm_val));
        else
            imem_addr <= std_logic_vector(unsigned(pc_r) + 4);
        end if;
        imem_cs    <= '1';
        state_next <= S_DECODE;
    else
        state_next <= S_FETCH;
    end if;


      when others =>
        state_next <= S_FETCH;

    end case;
  end process state_comb;

  -- writeback mux to selects what data goes into the register file
  rf_wdata <= dmem_rdata_r when mem_to_reg = '1' else
              imm_val when lui_sel = '1' else
              std_logic_vector(unsigned(pc_r) + unsigned(imm_val)) when auipc_sel = '1' else
              std_logic_vector(unsigned(pc_r) + 4) when jump = '1' else
              alu_result_r;

 
---load alignment

  load_align: process(dmem_rdata, funct3, alu_result_r)
    variable byte_offset : integer;
  begin
    byte_offset := to_integer(unsigned(alu_result_r(1 downto 0)));
    load_aligned <= dmem_rdata;

    case funct3 is
      when "000" =>   
        case byte_offset is
          when 0 => load_aligned <= (31 downto 8 => dmem_rdata(7))  & dmem_rdata(7 downto 0);
          when 1 => load_aligned <= (31 downto 8 => dmem_rdata(15)) & dmem_rdata(15 downto 8);
          when 2 => load_aligned <= (31 downto 8 => dmem_rdata(23)) & dmem_rdata(23 downto 16);
          when 3 => load_aligned <= (31 downto 8 => dmem_rdata(31)) & dmem_rdata(31 downto 24);
          when others => null;
        end case;
      when "001" =>   
        if byte_offset = 0 then
          load_aligned <= (31 downto 16 => dmem_rdata(15)) & dmem_rdata(15 downto 0);
        else
          load_aligned <= (31 downto 16 => dmem_rdata(31)) & dmem_rdata(31 downto 16);
        end if;
      when "010" =>   
        load_aligned <= dmem_rdata;
      when "100" =>   
        case byte_offset is
          when 0 => load_aligned <= x"000000" & dmem_rdata(7 downto 0);
          when 1 => load_aligned <= x"000000" & dmem_rdata(15 downto 8);
          when 2 => load_aligned <= x"000000" & dmem_rdata(23 downto 16);
          when 3 => load_aligned <= x"000000" & dmem_rdata(31 downto 24);
          when others => null;
        end case;
      when "101" =>   
        if byte_offset = 0 then
          load_aligned <= x"0000" & dmem_rdata(15 downto 0);
        else
          load_aligned <= x"0000" & dmem_rdata(31 downto 16);
        end if;
      when others =>
        load_aligned <= dmem_rdata;
    end case;
  end process load_align;

--- store alignment

    store_align: process(rf_rdata2, funct3, alu_result_r)
    variable byte_offset : integer;
  begin
    byte_offset := to_integer(unsigned(alu_result_r(1 downto 0)));
    store_aligned <= rf_rdata2;
    store_wr_en   <= "1111";
    case funct3 is
      when "000" =>   
        store_aligned <= rf_rdata2(7 downto 0) & rf_rdata2(7 downto 0) & rf_rdata2(7 downto 0) & rf_rdata2(7 downto 0);
        case byte_offset is
          when 0 => store_wr_en <= "0001";
          when 1 => store_wr_en <= "0010";
          when 2 => store_wr_en <= "0100";
          when 3 => store_wr_en <= "1000";
          when others => null;
        end case;
      when "001" =>   
        store_aligned <= rf_rdata2(15 downto 0) & rf_rdata2(15 downto 0);
        if byte_offset = 0 then
          store_wr_en <= "0011";
        else
          store_wr_en <= "1100";
        end if;
      when "010" =>  
        store_aligned <= rf_rdata2;
        store_wr_en <= "1111";
      when others =>
        store_aligned <= rf_rdata2;
        store_wr_en <= "1111";
    end case;
  end process store_align;


end architecture rtl;
