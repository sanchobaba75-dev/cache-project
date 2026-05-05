library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.VLSI_TestBench_pkg.all;
use work.riscv_pkg.all;

entity alu_tb is
  generic (
    clk_cycle                : time := 10 ns;
    signal_application_delay : time := 3 ns;
    check_time               : time := 5 ns
  );
end alu_tb;

architecture testbench of alu_tb is

  
  component alu
    port (
      a        : in  std_logic_vector(31 downto 0);
      b        : in  std_logic_vector(31 downto 0);
      alu_func : in  alu_func_type;
      result   : out std_logic_vector(31 downto 0)
    );
  end component;

  signal clk_s       : std_logic;

  signal a_s         : std_logic_vector(31 downto 0);
  signal b_s         : std_logic_vector(31 downto 0);
  signal result_s    : std_logic_vector(31 downto 0);
  signal exp_res_s   : std_logic_vector(31 downto 0);
  signal alu_func_s  : alu_func_type;

  type test_record is record
    a        : std_logic_vector(31 downto 0);
    b        : std_logic_vector(31 downto 0);
    func_int : integer;
    exp_res  : std_logic_vector(31 downto 0);
  end record;

  signal vector_s : test_record;

begin

  
  dut: alu
    port map (
      a        => a_s,
      b        => b_s,
      alu_func => alu_func_s,
      result   => result_s
    );


  clk_gen1: clk_gen
    generic map (
      clk_period   => clk_cycle,
      clk_offset   => 0 ns,
      clk_init_val => '0'
    )
    port map (
      clk => clk_s
    );

  
  drv_a: drive_bus
    generic map (
      clk_offset => signal_application_delay,
      width      => 32
    )
    port map (
      clk        => clk_s,
      value_sig  => vector_s.a,
      actual_sig => a_s
    );

 
  drv_b: drive_bus
    generic map (
      clk_offset => signal_application_delay,
      width      => 32
    )
    port map (
      clk        => clk_s,
      value_sig  => vector_s.b,
      actual_sig => b_s
    );

 
  process(clk_s)
  begin
    if rising_edge(clk_s) then
      case vector_s.func_int is
        when 0 => alu_func_s <= ALU_ADD;
        when 1 => alu_func_s <= ALU_SUB;
        when 2 => alu_func_s <= ALU_AND;
        when 3 => alu_func_s <= ALU_OR;
        when 4 => alu_func_s <= ALU_XOR;
        when 5 => alu_func_s <= ALU_SLT;
        when 6 => alu_func_s <= ALU_SLTU;
        when others => alu_func_s <= ALU_ADD;
      end case;
    end if;
  end process;

  
  check_result: check_bus
    generic map (
      clk_offset => check_time,
      width      => 32,
      sig_label  => "ALU_result"
    )
    port map (
      clk          => clk_s,
      expected_sig => vector_s.exp_res,
      actual_sig   => result_s
    );


  test: process
    variable l         : LINE;
    variable line_in   : LINE;
    variable line_out  : LINE;
    variable str_size  : integer;
    variable t         : string(1 to 80);

    file test_list_file    : TEXT;
    file test_vectors_file : TEXT;

  begin

    testInfo.do_comparisons   := false;
    testInfo.mismatches_found := 0;

    loop

      write_string(line_out, "Enter test name (or ""quit""):");
      writeline(output,line_out);

      readline(input,line_in);
      get_word(line_in,testInfo.main_test_name,str_size);
      testInfo.main_test_size := str_size;

      if(testInfo.main_test_name(1 to 4) = "quit") then
        exit;
      else
        testInfo.do_comparisons := true;
      end if;

      file_open(test_list_file,
        external_name => testInfo.main_test_name(1 to str_size),
        open_kind     => read_mode);

      while not endfile(test_list_file) loop

        readline(test_list_file, line_in);
        if(line_in(1) = '#') then
          next;
        end if;

        get_word(line_in,testInfo.test_name,str_size);
        testInfo.test_size := str_size;

        file_open(test_vectors_file,
          external_name => testInfo.test_name(1 to str_size),
          open_kind     => read_mode);

        testInfo.lcnt := 1;

        while not endfile(test_vectors_file) loop

          readline(test_vectors_file,l);

          if(l(1) = '#') then
            testInfo.lcnt := testInfo.lcnt + 1;
            next;
          end if;

          -- a
          get_word(l,t,str_size);
          vector_s.a <= hex_to_std(t(1 to 8),32);

          -- b
          get_word(l,t,str_size);
          vector_s.b <= hex_to_std(t(1 to 8),32);

          
          get_word(l,t,str_size);
          vector_s.func_int <= integer'value(t(1 to str_size));


          -- results expected 
          get_word(l,t,str_size);
          exp_res_s <= hex_to_std(t(1 to 8),32);
          vector_s.exp_res <= hex_to_std(t(1 to 8),32);


          wait for clk_cycle;

          testInfo.lcnt := testInfo.lcnt + 1;

        end loop;

        file_close(test_vectors_file);

      end loop;

      file_close(test_list_file);

    end loop;

    wait;

  end process;

end architecture;
