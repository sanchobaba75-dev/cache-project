architecture rtl of riscv_core is

  --- for program counter
  signal pc_r    : std_logic_vector(31 downto 0);
  signal pc_next : std_logic_vector(31 downto 0);

  --- Instruction extraction
  signal opcode   : std_logic_vector(6 downto 0);
  signal rd_addr  : std_logic_vector(4 downto 0);
  signal funct3   : std_logic_vector(2 downto 0);
  signal rs1_addr : std_logic_vector(4 downto 0);
  signal rs2_addr : std_logic_vector(4 downto 0);
  signal funct7   : std_logic_vector(6 downto 0);
  signal ifmt     : fmt_type;

  --- control signals for decod
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
  signal auipc_sel  : std_logic;

  --- for RegFile
  signal rf_wr_en  : std_logic;
  signal rf_wdata  : std_logic_vector(31 downto 0);
  signal rf_rdata1 : std_logic_vector(31 downto 0);
  signal rf_rdata2 : std_logic_vector(31 downto 0);

  --- alu signals
  signal alu_a         : std_logic_vector(31 downto 0);
  signal alu_b         : std_logic_vector(31 downto 0);
  signal alu_result    : std_logic_vector(31 downto 0);
  signal ex_alu_result : std_logic_vector(31 downto 0);

  --- for shifter output
  signal shift_result  : std_logic_vector(31 downto 0);

  --- value from immediate generator
  signal imm_val       : std_logic_vector(31 downto 0);

  --- Load/store
  signal load_aligned  : std_logic_vector(31 downto 0);
  signal store_aligned : std_logic_vector(31 downto 0);
  signal store_wr_en   : std_logic_vector(3 downto 0);
  signal memwb_mem_data : std_logic_vector(31 downto 0);

  
  signal branch_taken    : std_logic;
  signal redirect_target : std_logic_vector(31 downto 0);
  signal redirect        : std_logic;

  --- Flush
  signal flush_ifid  : std_logic;
  signal flush_idex  : std_logic;
  signal flush_delay : std_logic; 

  --- Hazard & forwarding
  signal stall : std_logic;

  signal forward_a : std_logic_vector(1 downto 0);
  signal forward_b : std_logic_vector(1 downto 0);

  signal fwd_a : std_logic_vector(31 downto 0);
  signal fwd_b : std_logic_vector(31 downto 0);

  signal exmem_fwd_val : std_logic_vector(31 downto 0);

  -- IF/ID pipeline register
  signal ifid_pc : std_logic_vector(31 downto 0);

  -- ID/EX pipeline register
  signal idex_pc         : std_logic_vector(31 downto 0);
  signal idex_rdata1     : std_logic_vector(31 downto 0);
  signal idex_rdata2     : std_logic_vector(31 downto 0);
  signal idex_imm        : std_logic_vector(31 downto 0);
  signal idex_rd         : std_logic_vector(4 downto 0);
  signal idex_rs1        : std_logic_vector(4 downto 0);
  signal idex_rs2        : std_logic_vector(4 downto 0);
  signal idex_funct3     : std_logic_vector(2 downto 0);
  signal idex_opcode     : std_logic_vector(6 downto 0);
  -- control
  signal idex_alu_src    : std_logic;
  signal idex_reg_write  : std_logic;
  signal idex_mem_read   : std_logic;
  signal idex_mem_write  : std_logic;
  signal idex_mem_to_reg : std_logic;
  signal idex_branch     : std_logic;
  signal idex_jump       : std_logic;
  signal idex_alu_op     : alu_func_type;
  signal idex_is_shift   : std_logic;
  signal idex_lui_sel    : std_logic;
  signal idex_auipc_sel  : std_logic;

  -- EX/MEM pipeline register
  signal exmem_pc          : std_logic_vector(31 downto 0);
  signal exmem_alu_result  : std_logic_vector(31 downto 0);
  signal exmem_rdata2      : std_logic_vector(31 downto 0);
  signal exmem_rd          : std_logic_vector(4 downto 0);
  signal exmem_funct3      : std_logic_vector(2 downto 0);
  signal exmem_opcode      : std_logic_vector(6 downto 0);
  signal exmem_imm         : std_logic_vector(31 downto 0);
  -- control
  signal exmem_reg_write   : std_logic;
  signal exmem_mem_read    : std_logic;
  signal exmem_mem_write   : std_logic;
  signal exmem_mem_to_reg  : std_logic;
  signal exmem_jump        : std_logic;
  signal exmem_lui_sel     : std_logic;
  signal exmem_auipc_sel   : std_logic;
  signal exmem_branch_taken: std_logic;

  --- MEM/WB pipeline register
  signal memwb_pc         : std_logic_vector(31 downto 0);
  signal memwb_alu_result : std_logic_vector(31 downto 0);
  signal memwb_rd         : std_logic_vector(4 downto 0);
  signal memwb_imm        : std_logic_vector(31 downto 0);
  signal memwb_funct3     : std_logic_vector(2 downto 0);
  -- control
  signal memwb_reg_write  : std_logic;
  signal memwb_mem_to_reg : std_logic;
  signal memwb_jump       : std_logic;
  signal memwb_lui_sel    : std_logic;
  signal memwb_auipc_sel  : std_logic;

begin

  -- Instruction field extraction
  opcode   <= imem_rdata(6 downto 0);
  rd_addr  <= imem_rdata(11 downto 7);
  funct3   <= imem_rdata(14 downto 12);
  rs1_addr <= imem_rdata(19 downto 15);
  rs2_addr <= imem_rdata(24 downto 20);
  funct7   <= imem_rdata(31 downto 25);

  -- Component instantiations
  reg_file_inst: entity work.regFile
    generic map (width => 32)
    port map (
      rst0      => rst0,
      clk       => clk,
      wrRegEn   => rf_wr_en,
      wrRegNum  => memwb_rd,
      wdata     => rf_wdata,
      rdRegNum1 => rs1_addr,
      rdRegNum2 => rs2_addr,
      rdata1    => rf_rdata1,
      rdata2    => rf_rdata2
    );

  alu_inst: entity work.alu
    port map (
      a        => alu_a,
      b        => alu_b,
      alu_func => idex_alu_op,
      result   => alu_result
    );

  shifter_inst: entity work.shifter
    port map (
      a        => fwd_a,
      shamt    => alu_b(4 downto 0),
      alu_func => idex_alu_op,
      result   => shift_result
    );

  imm_gen_inst: entity work.immediate_generator
    port map (
      instr   => imem_rdata,
      ifmt    => ifmt,
      imm_out => imm_val
    );

  -- Hazard detection unit
  hazard_detect: process(idex_mem_read, idex_rd, rs1_addr, rs2_addr)
  begin
    stall <= '0';
    if idex_mem_read = '1' and idex_rd /= "00000" then
      if idex_rd = rs1_addr or idex_rd = rs2_addr then
        stall <= '1';
      end if;
    end if;
  end process;

  -- Forwarding unit
  exmem_fwd_val <= exmem_imm when exmem_lui_sel = '1' else
                   std_logic_vector(unsigned(exmem_pc) + unsigned(exmem_imm))
                       when exmem_auipc_sel = '1' else
                   std_logic_vector(unsigned(exmem_pc) + 4)
                       when exmem_jump = '1' else
                   exmem_alu_result;

  forwarding: process(exmem_reg_write, exmem_rd, memwb_reg_write, memwb_rd,
                      idex_rs1, idex_rs2)
  begin
    if exmem_reg_write = '1' and exmem_rd /= "00000" and exmem_rd = idex_rs1 then
      forward_a <= "10";
    elsif memwb_reg_write = '1' and memwb_rd /= "00000" and memwb_rd = idex_rs1 then
      forward_a <= "01";
    else
      forward_a <= "00";
    end if;

    if exmem_reg_write = '1' and exmem_rd /= "00000" and exmem_rd = idex_rs2 then
      forward_b <= "10";
    elsif memwb_reg_write = '1' and memwb_rd /= "00000" and memwb_rd = idex_rs2 then
      forward_b <= "01";
    else
      forward_b <= "00";
    end if;
  end process;

  --- Forwarding muxes

  fwd_a <= exmem_fwd_val when forward_a = "10" else
           rf_wdata       when forward_a = "01" else
           idex_rdata1;

  fwd_b <= exmem_fwd_val when forward_b = "10" else
           rf_wdata       when forward_b = "01" else
           idex_rdata2;

  -- STAGE 1: IF

  redirect   <= exmem_branch_taken or exmem_jump;
  flush_ifid <= redirect;                        
  flush_idex <= redirect or flush_delay;         

  redirect_target_proc: process(exmem_branch_taken, exmem_jump,
                                exmem_alu_result, exmem_pc,
                                exmem_imm, exmem_opcode)
  begin
    redirect_target <= (others => '0');
    if exmem_branch_taken = '1' then
      redirect_target <= std_logic_vector(unsigned(exmem_pc) + unsigned(exmem_imm));
    elsif exmem_jump = '1' then
      if exmem_opcode = "1101111" then
        redirect_target <= std_logic_vector(unsigned(exmem_pc) + unsigned(exmem_imm));
      else
        redirect_target <= exmem_alu_result(31 downto 1) & '0';
      end if;
    end if;
  end process;

  pc_next_proc: process(pc_r, redirect, redirect_target, stall)
  begin
    if redirect = '1' then
      pc_next <= redirect_target;
    elsif stall = '1' then
      pc_next <= pc_r;
    else
      pc_next <= std_logic_vector(unsigned(pc_r) + 4);
    end if;
  end process;

  imem_cs    <= '1';
  imem_wr_en <= "0000";
  imem_addr  <= pc_r;
  imem_wdata <= (others => '0');

  -- STAGE 2: ID

  instr_decode: process(opcode, funct3, funct7)
  begin
    alu_src    <= '0';
    reg_write  <= '0';
    mem_read   <= '0';
    mem_write  <= '0';
    mem_to_reg <= '0';
    branch     <= '0';
    jump       <= '0';
    alu_op     <= ALU_ADD;
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
  end process;


  --- STAGE 3: EXECUTE 

  alu_a <= fwd_a;
  alu_b <= idex_imm when idex_alu_src = '1' else fwd_b;

  ex_alu_result <= shift_result when idex_is_shift = '1' else alu_result;

  branch_compare: process(fwd_a, fwd_b, idex_funct3, idex_branch)
  begin
    branch_taken <= '0';
    if idex_branch = '1' then
      case idex_funct3 is
        when "000" =>
          if fwd_a = fwd_b then branch_taken <= '1'; end if;
        when "001" =>
          if fwd_a /= fwd_b then branch_taken <= '1'; end if;
        when "100" =>
          if signed(fwd_a) < signed(fwd_b) then branch_taken <= '1'; end if;
        when "101" =>
          if signed(fwd_a) >= signed(fwd_b) then branch_taken <= '1'; end if;
        when "110" =>
          if unsigned(fwd_a) < unsigned(fwd_b) then branch_taken <= '1'; end if;
        when "111" =>
          if unsigned(fwd_a) >= unsigned(fwd_b) then branch_taken <= '1'; end if;
        when others =>
          null;
      end case;
    end if;
  end process;


  -- STAGE 4: MEM/MA


  dmem_cs    <= exmem_mem_read or exmem_mem_write;
  dmem_addr  <= exmem_alu_result;
  dmem_wdata <= store_aligned;
  dmem_wr_en <= store_wr_en when exmem_mem_write = '1' else "0000";

  store_align: process(exmem_rdata2, exmem_funct3, exmem_alu_result)
    variable byte_offset : integer;
  begin
    byte_offset := to_integer(unsigned(exmem_alu_result(1 downto 0)));
    store_aligned <= exmem_rdata2;
    store_wr_en   <= "1111";
    case exmem_funct3 is
      when "000" =>
        store_aligned <= exmem_rdata2(7 downto 0) & exmem_rdata2(7 downto 0) &
                         exmem_rdata2(7 downto 0) & exmem_rdata2(7 downto 0);
        case byte_offset is
          when 0 => store_wr_en <= "0001";
          when 1 => store_wr_en <= "0010";
          when 2 => store_wr_en <= "0100";
          when 3 => store_wr_en <= "1000";
          when others => null;
        end case;
      when "001" =>
        store_aligned <= exmem_rdata2(15 downto 0) & exmem_rdata2(15 downto 0);
        if byte_offset = 0 then
          store_wr_en <= "0011";
        else
          store_wr_en <= "1100";
        end if;
      when "010" =>
        store_aligned <= exmem_rdata2;
        store_wr_en   <= "1111";
      when others =>
        store_aligned <= exmem_rdata2;
        store_wr_en   <= "1111";
    end case;
  end process;

  -- STAGE 5: WB

  load_align: process(dmem_rdata, memwb_funct3, memwb_alu_result)
    variable byte_offset : integer;
  begin
    byte_offset := to_integer(unsigned(memwb_alu_result(1 downto 0)));
    load_aligned <= dmem_rdata;
    case memwb_funct3 is
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
  end process;

  memwb_mem_data <= load_aligned;

  rf_wr_en <= memwb_reg_write;
  rf_wdata <= memwb_mem_data when memwb_mem_to_reg = '1' else
              memwb_imm when memwb_lui_sel = '1' else
              std_logic_vector(unsigned(memwb_pc) + unsigned(memwb_imm)) when memwb_auipc_sel = '1' else
              std_logic_vector(unsigned(memwb_pc) + 4) when memwb_jump = '1' else
              memwb_alu_result;



  --- Pipeline registers


  pipeline_regs: process(rst0, clk)
  begin
    if rst0 = '0' then

      -- IF/ID
      ifid_pc <= (others => '0');

      -- ID/EX
      idex_pc         <= (others => '0');
      idex_rdata1     <= (others => '0');
      idex_rdata2     <= (others => '0');
      idex_imm        <= (others => '0');
      idex_rd         <= (others => '0');
      idex_rs1        <= (others => '0');
      idex_rs2        <= (others => '0');
      idex_funct3     <= (others => '0');
      idex_opcode     <= (others => '0');
      idex_alu_src    <= '0';
      idex_reg_write  <= '0';
      idex_mem_read   <= '0';
      idex_mem_write  <= '0';
      idex_mem_to_reg <= '0';
      idex_branch     <= '0';
      idex_jump       <= '0';
      idex_alu_op     <= ALU_ADD;
      idex_is_shift   <= '0';
      idex_lui_sel    <= '0';
      idex_auipc_sel  <= '0';

      -- EX/MEM
      exmem_pc           <= (others => '0');
      exmem_alu_result   <= (others => '0');
      exmem_rdata2       <= (others => '0');
      exmem_rd           <= (others => '0');
      exmem_funct3       <= (others => '0');
      exmem_opcode       <= (others => '0');
      exmem_imm          <= (others => '0');
      exmem_reg_write    <= '0';
      exmem_mem_read     <= '0';
      exmem_mem_write    <= '0';
      exmem_mem_to_reg   <= '0';
      exmem_jump         <= '0';
      exmem_lui_sel      <= '0';
      exmem_auipc_sel    <= '0';
      exmem_branch_taken <= '0';

      -- MEM/WB
      memwb_pc         <= (others => '0');
      memwb_alu_result <= (others => '0');
      memwb_rd         <= (others => '0');
      memwb_imm        <= (others => '0');
      memwb_funct3     <= (others => '0');
      memwb_reg_write  <= '0';
      memwb_mem_to_reg <= '0';
      memwb_jump       <= '0';
      memwb_lui_sel    <= '0';
      memwb_auipc_sel  <= '0';
      pc_r <= (others => '0');
      flush_delay <= '0';                

    elsif rising_edge(clk) then

      
      pc_r <= pc_next;

    
      flush_delay <= redirect;           

      -- IF/ID register - flush on redirect only and freeze on stall
      if flush_ifid = '1' then
        ifid_pc <= (others => '0');
      elsif stall = '0' then
        ifid_pc <= imem_addr;
      end if;

      -- ID/EX register


      if flush_idex = '1' or stall = '1' then
        idex_pc         <= (others => '0');
        idex_rdata1     <= (others => '0');
        idex_rdata2     <= (others => '0');
        idex_imm        <= (others => '0');
        idex_rd         <= (others => '0');
        idex_rs1        <= (others => '0');
        idex_rs2        <= (others => '0');
        idex_funct3     <= (others => '0');
        idex_opcode     <= (others => '0');
        idex_alu_src    <= '0';
        idex_reg_write  <= '0';
        idex_mem_read   <= '0';
        idex_mem_write  <= '0';
        idex_mem_to_reg <= '0';
        idex_branch     <= '0';
        idex_jump       <= '0';
        idex_alu_op     <= ALU_ADD;
        idex_is_shift   <= '0';
        idex_lui_sel    <= '0';
        idex_auipc_sel  <= '0';
      else
        idex_pc         <= ifid_pc;
        --- WB to ID bypass for rs1
        if memwb_reg_write = '1' and memwb_rd /= "00000" and memwb_rd = rs1_addr then
          idex_rdata1 <= rf_wdata;
        else
          idex_rdata1 <= rf_rdata1;
        end if;
        --- WB to ID bypass for rs2
        if memwb_reg_write = '1' and memwb_rd /= "00000" and memwb_rd = rs2_addr then
          idex_rdata2 <= rf_wdata;
        else
          idex_rdata2 <= rf_rdata2;
        end if;
        idex_imm        <= imm_val; 
        idex_rd         <= rd_addr;
        idex_rs1        <= rs1_addr;
        idex_rs2        <= rs2_addr;
        idex_funct3     <= funct3;
        idex_opcode     <= opcode;
        idex_alu_src    <= alu_src;
        idex_reg_write  <= reg_write;
        idex_mem_read   <= mem_read;
        idex_mem_write  <= mem_write;
        idex_mem_to_reg <= mem_to_reg;
        idex_branch     <= branch;
        idex_jump       <= jump;
        idex_alu_op     <= alu_op;
        idex_is_shift   <= is_shift;
        idex_lui_sel    <= lui_sel;
        idex_auipc_sel  <= auipc_sel;
      end if;

      --- EX/MEM register

      if flush_idex = '1' then
        exmem_pc           <= (others => '0');
        exmem_alu_result   <= (others => '0');
        exmem_rdata2       <= (others => '0');
        exmem_rd           <= (others => '0');
        exmem_funct3       <= (others => '0');
        exmem_opcode       <= (others => '0');
        exmem_imm          <= (others => '0');
        exmem_reg_write    <= '0';
        exmem_mem_read     <= '0';
        exmem_mem_write    <= '0';
        exmem_mem_to_reg   <= '0';
        exmem_jump         <= '0';
        exmem_lui_sel      <= '0';
        exmem_auipc_sel    <= '0';
        exmem_branch_taken <= '0';
      else
        exmem_pc           <= idex_pc;
        exmem_alu_result   <= ex_alu_result;
        exmem_rdata2       <= fwd_b;
        exmem_rd           <= idex_rd;
        exmem_funct3       <= idex_funct3;
        exmem_opcode       <= idex_opcode;
        exmem_imm          <= idex_imm;
        exmem_reg_write    <= idex_reg_write;
        exmem_mem_read     <= idex_mem_read;
        exmem_mem_write    <= idex_mem_write;
        exmem_mem_to_reg   <= idex_mem_to_reg;
        exmem_jump         <= idex_jump;
        exmem_lui_sel      <= idex_lui_sel;
        exmem_auipc_sel    <= idex_auipc_sel;
        exmem_branch_taken <= branch_taken;
      end if;

      --- MEM/WB register
      memwb_pc         <= exmem_pc;
      memwb_alu_result <= exmem_alu_result;
      memwb_rd         <= exmem_rd;
      memwb_imm        <= exmem_imm;
      memwb_funct3     <= exmem_funct3;
      memwb_reg_write  <= exmem_reg_write;
      memwb_mem_to_reg <= exmem_mem_to_reg;
      memwb_jump       <= exmem_jump;
      memwb_lui_sel    <= exmem_lui_sel;
      memwb_auipc_sel  <= exmem_auipc_sel;

    end if;
  end process;

end architecture rtl;
