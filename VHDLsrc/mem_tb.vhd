library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.VLSI_TestBench_pkg.all;

entity mem_tb is
  generic (
    clk_cycle                 : time := 10 ns;
    signal_application_delay  : time := 3 ns;
    check_time                : time := 5 ns
  );
end mem_tb;

architecture testbench of mem_tb is
  component sync_sp_sram
    generic (
      ENDIAN                : integer := 1;      -- 0: Big; 1: Little
      WIDTH                 : integer := 32;     -- Number of data bits
      BITS_PER_WE           : integer := 8;      -- Number of data bits per wr_en
      WORDS                 : integer := 512;    -- Number of locations
      BASE_OFFSET           : integer := 0;      -- Offset from initialization address
      ADDR_BITS             : integer := 9;      -- Number of bits in the address bus
      DEFAULT_STATE         : std_logic := '0';  -- State to initialize bits
      SIM_INIT_FILE         : string  := "initfile.srec";
      INIT_FILE_INDIRECT    : integer := 0;
      RD_ACCESS             : time    := 4 ns    -- Read access delay time
    );
    port (
      clk                   :  in std_logic;
      cs                    :  in std_logic;
      wr_en                 :  in std_logic_vector(
                                      (WIDTH/BITS_PER_WE)-1 downto 0);
      addr                  :  in std_logic_vector(ADDR_BITS-1 downto 0);
      wdata                 :  in std_logic_vector(WIDTH-1 downto 0);
      rdata                 : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component;

  signal clk_s  :  std_logic;

  type test_record is record
    cs         : std_logic;
    wr_en      : std_logic_vector(3 downto 0);
    addr       : std_logic_vector(8 downto 0);
    wdata      : std_logic_vector(31 downto 0);
    exp_rdata  : std_logic_vector(31 downto 0);
  end record;

  signal vector_s : test_record;
  signal actual_s : test_record;

begin

  mem: sync_sp_sram
    generic map (
      SIM_INIT_FILE => "imem.srec",
      INIT_FILE_INDIRECT => 1,
      BASE_OFFSET => 16#80000000#,
      RD_ACCESS     => 2 ns
    )
    port map (
      clk       => clk_s,
      cs        => actual_s.cs,
      wr_en     => actual_s.wr_en,
      addr      => actual_s.addr,
      wdata     => actual_s.wdata,
      rdata     => actual_s.exp_rdata
    );


  clk_gen1: clk_gen
    generic map (
      clk_period    => clk_cycle,
      clk_offset    => 0 ns,
      clk_init_val  => '0'
    )
    port map (
      clk           => clk_s
    );

  check_rdata: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "rdata"
    )
    port map (
      clk           => clk_s,
      expected_sig  => vector_s.exp_rdata,
      actual_sig    => actual_s.exp_rdata
    );

  drv_cs: drive_bit
    generic map (
      clk_offset    => signal_application_delay
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.cs,
      actual_sig    => actual_s.cs
    );

  drv_wr_en: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 4
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.wr_en,
      actual_sig    => actual_s.wr_en
    );

  drv_addr: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 9
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.addr,
      actual_sig    => actual_s.addr
    );

  drv_wdata: drive_bus
    generic map (
      clk_offset    => clk_cycle - signal_application_delay,
      width         => 32
    )
    port map (
      clk           => clk_s,
      value_sig     => vector_s.wdata,
      actual_sig    => actual_s.wdata
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
        end loop;
        testInfo.test_size := str_size;
        -- Extract memory initfile name
        get_word(line_in,initfile,init_file_size);
        -- Put initfile name as contents of initialization file
        file_open(init_file,external_name => "imem.srec", open_kind => write_mode);
        write_string(line_out,initfile);
        writeline(init_file,line_out);
        file_close(init_file);
        -- File name set, so create a pulse on "initialize_memory" global signal
        initialize_memory <= '1', '0' after 1 ns;
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
          -- Get the cs signal
          get_word(l,t,str_size);
          vector_s.cs     <= cvt_char(t);

          -- Get the wr_en signal
          get_word(l,t,str_size);
          vector_s.wr_en  <= hex_to_std(t(1),4);

          -- Get the addr bus signal
          get_word(l,t,str_size);
          vector_s.addr  <= hex_to_std(t(1 to 3),9);

          -- Get the wdata bus signal
          get_word(l,t,str_size);
          vector_s.wdata  <= hex_to_std(t(1 to 8),32);

          -- Get the expected rdata bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_rdata <= "--------------------------------";
          else
            vector_s.exp_rdata <= hex_to_std(t(1 to 8),32);
          end if;

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
