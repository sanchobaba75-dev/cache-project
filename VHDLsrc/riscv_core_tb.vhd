library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.VLSI_TestBench_pkg.all;

use work.riscv_pkg.all;

entity riscv_core_tb is
  generic (
    clk_cycle                 : time := 10 ns;
    signal_application_delay  : time := 3 ns;
    check_time                : time := 5 ns
  );
end riscv_core_tb;

architecture testbench of riscv_core_tb is
  component riscv_core
    port (
      rst0               :  in std_logic;
      clk                :  in std_logic;

      -- Instruction memory interface
      imem_cs            : out std_logic;
      imem_wr_en         : out std_logic_vector(3 downto 0);
      imem_addr          : out std_logic_vector(31 downto 0);
      imem_wdata         : out std_logic_vector(31 downto 0);
      imem_rdata         :  in std_logic_vector(31 downto 0);

      -- Data memory interface
      dmem_cs            : out std_logic;
      dmem_wr_en         : out std_logic_vector(3 downto 0);
      dmem_addr          : out std_logic_vector(31 downto 0);
      dmem_wdata         : out std_logic_vector(31 downto 0);
      dmem_rdata         :  in std_logic_vector(31 downto 0)
    );
  end component;

  signal clk_s  :  std_logic;
  signal rst0_s :  std_logic;

  type test_record is record
    rst0               : std_logic;

    exp_imem_cs        : std_logic;
    exp_imem_wr_en     : std_logic_vector(3 downto 0);
    exp_imem_addr      : std_logic_vector(31 downto 0);
    exp_imem_wdata     : std_logic_vector(31 downto 0);
    imem_rdata         : std_logic_vector(31 downto 0);

      -- Data memory interface
    exp_dmem_cs        : std_logic;
    exp_dmem_wr_en     : std_logic_vector(3 downto 0);
    exp_dmem_addr      : std_logic_vector(31 downto 0);
    exp_dmem_wdata     : std_logic_vector(31 downto 0);
    dmem_rdata         : std_logic_vector(31 downto 0);
  end record;

  signal vector_s : test_record;
  signal actual_s : test_record;

begin

  core: riscv_core
    port map (
      rst0          => rst0_s,
      clk           => clk_s,

      -- Instruction memory interface
      imem_cs       => actual_s.exp_imem_cs,
      imem_wr_en    => actual_s.exp_imem_wr_en,
      imem_addr     => actual_s.exp_imem_addr,
      imem_wdata    => actual_s.exp_imem_wdata,
      imem_rdata    => actual_s.imem_rdata,

      -- Data memory interface
      dmem_cs       => actual_s.exp_dmem_cs,
      dmem_wr_en    => actual_s.exp_dmem_wr_en,
      dmem_addr     => actual_s.exp_dmem_addr,
      dmem_wdata    => actual_s.exp_dmem_wdata,
      dmem_rdata    => actual_s.dmem_rdata
    );

  clk_gen1: clk_gen
    generic map (
      clk_period    => clk_cycle,
      clk_offset    => 0 ns,
      clk_init_val  => '1'
    )
    port map (
      clk           => clk_s
    );

  check_imem_cs: check_bit
    generic map (
      clk_offset    => check_time,
      sig_label     => "imem_cs"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_imem_cs,
      actual_sig    => actual_s.exp_imem_cs
    );

  check_imem_wr_en: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 4,
      sig_label     => "imem_wr_en"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_imem_wr_en,
      actual_sig    => actual_s.exp_imem_wr_en
    );

  check_imem_addr: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "imem_addr"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_imem_addr,
      actual_sig    => actual_s.exp_imem_addr
    );

  check_imem_wdata: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "imem_wdata"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_imem_wdata,
      actual_sig    => actual_s.exp_imem_wdata
    );

  drv_imem_rdata: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 32
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.imem_rdata,
      actual_sig    => actual_s.imem_rdata
    );

  check_dmem_cs: check_bit
    generic map (
      clk_offset    => check_time,
      sig_label     => "dmem_cs"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_dmem_cs,
      actual_sig    => actual_s.exp_dmem_cs
    );

  check_dmem_wr_en: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 4,
      sig_label     => "dmem_wr_en"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_dmem_wr_en,
      actual_sig    => actual_s.exp_dmem_wr_en
    );

  check_dmem_addr: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "dmem_addr"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_dmem_addr,
      actual_sig    => actual_s.exp_dmem_addr
    );

  check_dmem_wdata: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "dmem_wdata"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_dmem_wdata,
      actual_sig    => actual_s.exp_dmem_wdata
    );

  drv_dmem_rdata: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 32
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.dmem_rdata,
      actual_sig    => actual_s.dmem_rdata
    );

--drv_rst: drive_bit
--  generic map (
--    clk_offset    => 0 ns
--  )
--  port map (
--    clk           => clk_s,
--    value_sig     => vector_s.rst0,
--    actual_sig    => rst0_s
--  );

  rst0_s <= vector_s.rst0 after 4 ns;
  


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

    testInfo.do_comparisons    := false;
    testInfo.mismatches_found  := 0;

    loop
      -- Prompt for a test list file name (file containing test names)
      write_string(line_out, "Enter test name (or ""quit""):");
      writeline(output,line_out);
      -- Clear the main test name string
      for i in 1 to 256 loop
        testInfo.main_test_name(i) := ' ';
      end loop;
      -- Read a line from the "terminal"
      readline(input,line_in);
      -- Extract the file name
      get_word(line_in,testInfo.main_test_name,str_size);
      for i in str_size+1 to 256 loop
        testInfo.main_test_name(i) := ' ';
      end loop;
      testInfo.main_test_size := str_size;
      -- Clear the error detected flag
      testInfo.error_detected := false;
      -- Check if finished
      if(testInfo.main_test_name(1 to 4) = "quit") then
        testInfo.do_comparisons     := false;
        exit;
      else
        testInfo.do_comparisons     := true;
      end if;
      -- Start the test
      write_string(line_out,"Start main_test: ");
      write_string(line_out,testInfo.main_test_name);
      writeline(output,line_out);
      -- Open the test list file
      file_open(test_list_file,
                   external_name  => testInfo.main_test_name(1 to str_size),
                   open_kind      => read_mode);
      -- Read every line of test list file; Each line is a name of a vector file
      while not endfile(test_list_file) loop
        -- Read a line from the test list file
        readline(test_list_file, line_in);
        -- Check for comment
        if(line_in(1) = '#') then
          -- This line is a comment, skip
          next;
        end if;
        -- Get the filename containing test info
        for i in 1 to 256 loop
          testInfo.test_name(i) := ' ';
          initfile(i) := ' ';
        end loop;
        -- Extract vector file name
        get_word(line_in,testInfo.test_name,str_size);
        for i in str_size+1 to 256 loop
          testInfo.test_name(i) := ' ';
          initfile(i) := ' ';
        end loop;
        testInfo.test_size := str_size;
--      -- Extract memory initfile name
--      get_word(line_in,initfile,init_file_size);
--      -- Put initfile name as contents of initialization file
--      file_open(init_file,external_name => "imem.srec", open_kind => write_mode);
--      write_string(line_out,initfile);
--      writeline(init_file,line_out);
--      file_close(init_file);
--      -- File name set, so create a pulse on "initialize_memory" global signal
--      initialize_memory <= '1', '0' after 1 ns;
        write_string(line_out,"Start test file: ");
        write_string(line_out,testInfo.test_name);
        writeline(output,line_out);
        -- Open the vector file
        file_open(test_vectors_file,
                       external_name => testInfo.test_name(1 to str_size),
                       open_kind     => read_mode);
        -- Process all of the lines; Each line is one vector
        testInfo.lcnt := 1;
        while not endfile(test_vectors_file) loop
          -- Get a line
          readline(test_vectors_file,l);
          -- Parse the line contents into the vector record
          -- Check for comment
          if(l(1) = '#') then
            testInfo.lcnt := testInfo.lcnt + 1;
            next;
          end if;

          -- Not a comment; Get each field of the vector
          -- Get the rst0 signal
          get_word(l,t,str_size);
          vector_s.rst0 <= cvt_char(t);

          -- Get the cs signal
          get_word(l,t,str_size);
          vector_s.exp_imem_cs <= cvt_char(t);

          -- Get the wr_en signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_imem_wr_en <= "----";
          else
            vector_s.exp_imem_wr_en <= hex_to_std(t(1),4);
          end if;

          -- Get the addr bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_imem_addr <= "--------------------------------";
          else
            vector_s.exp_imem_addr <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the wdata bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_imem_wdata <= "--------------------------------";
          else
            vector_s.exp_imem_wdata <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the rdata bus signal
          get_word(l,t,str_size);
          vector_s.imem_rdata  <= hex_to_std(t(1 to 8),32);

          -- Get the cs signal
          get_word(l,t,str_size);
          vector_s.exp_dmem_cs <= cvt_char(t);

          -- Get the wr_en signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_dmem_wr_en <= "----";
          else
            vector_s.exp_dmem_wr_en <= hex_to_std(t(1),4);
          end if;

          -- Get the addr bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_dmem_addr <= "--------------------------------";
          else
            vector_s.exp_dmem_addr <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the wdata bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_dmem_wdata <= "--------------------------------";
          else
            vector_s.exp_dmem_wdata <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the rdata bus signal
          get_word(l,t,str_size);
          vector_s.dmem_rdata  <= hex_to_std(t(1 to 8),32);

          -- Wait for the end of the clock cycle
          wait for clk_cycle;

          -- Increment the line counter
          testInfo.lcnt := testInfo.lcnt + 1;

        -- End of loops
        end loop; -- End of loop reading vector lines
        file_close(test_vectors_file);
        -- See if there is another test vector file to open/read
      end loop;
      -- All test vector files have been processed
      assert not testInfo.error_detected
        report "    There were ERRORS in the test."
        severity note;
      assert testInfo.error_detected
        report "    Test completed with no errors."
        severity note;
      file_close(test_list_file);
    end loop;  -- Prompt for another test list file?
    -- Should never get here...   User should type "quit" to exit
    -- Stall...
    wait;
  end process test;
end architecture testbench;
