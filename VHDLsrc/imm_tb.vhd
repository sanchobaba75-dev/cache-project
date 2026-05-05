library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.riscv_pkg.all;
use work.VLSI_TestBench_pkg.all;

entity mem_tb is
  generic (
    clk_cycle                 : time := 10 ns;
    signal_application_delay  : time := 2 ns;  
    check_time                : time := 8 ns   
  );
end mem_tb;

architecture testbench of mem_tb is

  component immediate_generator
    port (
      instr   : in  std_logic_vector(31 downto 0);
      ifmt    : in  fmt_type;
      imm_out : out std_logic_vector(31 downto 0)
    );
  end component;

  signal clk_s        : std_logic;
  signal initialize_memory : std_logic := '0';

  type test_record is record
    instr     : std_logic_vector(31 downto 0);
    ifmt      : fmt_type;
    exp_imm   : std_logic_vector(31 downto 0);
  end record;

  signal vector_s      : test_record;
  signal actual_instr  : std_logic_vector(31 downto 0);
  signal actual_ifmt   : fmt_type;
  signal actual_imm    : std_logic_vector(31 downto 0);

begin



  dut: immediate_generator
    port map (
      instr   => actual_instr,
      ifmt    => actual_ifmt,
      imm_out => actual_imm
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



  check_imm: check_bus
    generic map (
      clk_offset => check_time,
      width      => 32,
      sig_label  => "imm_out"
    )
    port map (
      clk          => clk_s,
      expected_sig => vector_s.exp_imm,
      actual_sig   => actual_imm
    );



  drv_instr: drive_bus
    generic map (
      clk_offset => signal_application_delay,
      width      => 32
    )
    port map (
      clk        => clk_s,
      value_sig  => vector_s.instr,
      actual_sig => actual_instr
    );

  
  drv_ifmt: drive_bus
    generic map (
      clk_offset => signal_application_delay,
      width      => 3
    )
    port map (
      clk        => clk_s,
      value_sig  => vector_s.ifmt,
      actual_sig => actual_ifmt
    );



  test: process
    variable l                 : LINE;
    variable line_in           : LINE;
    variable line_out          : LINE;
    variable str_size          : integer;
    variable t                 : string(1 to 80);
    variable initfile          : string(1 to 256);
    variable init_file_size    : integer;

    file test_list_file        : TEXT;
    file test_vectors_file     : TEXT;
    file init_file             : TEXT;

  begin

    testInfo.do_comparisons   := false;
    testInfo.mismatches_found := 0;

    loop

      write_string(line_out, "Enter test name (or ""quit""):");
      writeline(output,line_out);

      readline(input,line_in);
      get_word(line_in,testInfo.main_test_name,str_size);

      if (str_size = 0) then
        next;
      end if;

      if(testInfo.main_test_name(1 to 4) = "quit") then
        exit;
      end if;

      file_open(test_list_file,
                external_name => testInfo.main_test_name(1 to str_size),
                open_kind     => read_mode);

      while not endfile(test_list_file) loop

        readline(test_list_file, line_in);
        get_word(line_in,testInfo.test_name,str_size);

        if (str_size = 0 or testInfo.test_name(1) = '#') then
          next;
        end if;

        file_open(test_vectors_file,
                  external_name => testInfo.test_name(1 to str_size),
                  open_kind     => read_mode);

        while not endfile(test_vectors_file) loop

          readline(test_vectors_file,l);
          get_word(l,t,str_size);

          if (str_size = 0 or t(1) = '#') then
            next;
          end if;

          
          vector_s.instr <= hex_to_std(t(1 to 8), 32);

          
          get_word(l,t,str_size);
          case t(1) is
            when '0' => vector_s.ifmt <= R_TYPE;
            when '1' => vector_s.ifmt <= I_TYPE;
            when '2' => vector_s.ifmt <= S_TYPE;
            when '3' => vector_s.ifmt <= SB_TYPE;
            when '4' => vector_s.ifmt <= UJ_TYPE;
            when '5' => vector_s.ifmt <= U_TYPE;
            when others => null;
          end case;

          
          get_word(l,t,str_size);
          vector_s.exp_imm <= hex_to_std(t(1 to 8), 32);

          
          wait until rising_edge(clk_s);

        end loop;

        file_close(test_vectors_file);

      end loop;

      file_close(test_list_file);

    end loop;

    std.env.finish;

  end process;

end architecture;
