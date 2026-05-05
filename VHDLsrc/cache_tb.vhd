--
-- Cache testbench
--

library ieee;
 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.VLSI_TestBench_pkg.all;

entity cache_tb is
  generic (
    clk_cycle                : time := 10 ns;
    signal_application_delay : time := 3 ns;
    check_time               : time := 5 ns
  );
end cache_tb;

architecture test_bench of cache_tb is
  component cache
    generic (
      NUM_WAYS              : integer := 2;      -- Number of ways of associativity
      NUM_SETS              : integer := 8;      -- Number of sets (lines) in cache
      NUM_SETS_BITS         : integer := 3;      -- Number of bits needed to represent sets
      NUM_TAG_BITS          : integer := 5;      -- Number of bits needed for Tag
      NUM_LINE_WORDS        : integer := 4;      -- Number of words in a cache line
      NUM_LINE_WORDS_BITS   : integer := 2;      -- Number of bits needed to represent words
      WORD_WIDTH            : integer := 32;     -- Number of data bits in a word from CPU
      ADDR_WIDTH            : integer := 32;     -- Number of bits in address from CPU
  
      RD_ACCESS             : time    := 4 ns    -- Read access delay time
    );
    port (
      rst0                  :  in std_logic;
      clk                   :  in std_logic;
      clkSync               :  in std_logic;
  
      cpu_cs                :  in std_logic;                                   -- Indicates valid access
      cpu_r1w0              :  in std_logic;                                   -- Indicates read (1) or write (0) access
      cpu_size              :  in std_logic_vector(1 downto 0);                -- Indicates transaction size (writes)
      cpu_addr              :  in std_logic_vector(ADDR_WIDTH-1 downto 0);     -- Address from CPU (byte address)
  
      cpu_wdata             :  in std_logic_vector(WORD_WIDTH-1 downto 0);     -- Data from CPU to cache
      cpu_rdata             : out std_logic_vector(WORD_WIDTH-1 downto 0);     -- Data from cache to CPU
  
      cpu_hit               : out std_logic;                                   -- Access resulted in a hit
      cpu_miss              : out std_logic;                                   -- Access resulted in a miss
      cpu_ready             : out std_logic;                                   -- Access results available
  
      dram_start            : out std_logic;                                   -- Request a Start of a DRAM access
      --dram_ack              :  in std_logic;                                   -- DRAM access has started
      dram_r1w0             : out std_logic;                                   -- DRAM read (1) or write (0)
      dram_type             : out std_logic_vector(1 downto 0);                -- DRAM access type (word, burst, refresh)
      dram_size             : out std_logic_vector(1 downto 0);                -- DRAM access size (byte, half-word, word)
      dram_addr             : out std_logic_vector(ADDR_WIDTH-1 downto 0);     -- DRAM address
      dram_wdata            : out std_logic_vector(WORD_WIDTH-1 downto 0);     -- Data to DRAM
      dram_rdata            :  in std_logic_vector(WORD_WIDTH-1 downto 0);     -- Data from DRAM
      dram_oe0              : out std_logic;                                   -- Control DRAM oe0
      dram_latch            :  in std_logic                                    -- DRAM controller latch signal
    );
  end component;

  component dram
    generic (
      ENDIAN             : integer := 1;      -- 0: Big; 1: Little
      WIDTH              : integer := 32;     -- Number of data bits
      BITS_PER_CAS       : integer := 8;      -- Number of data bits per cas siganl
      WORDS              : integer := 1024;   -- Number of locations
      BASE_OFFSET        : integer := 0;      -- Offset from initialization address
      ADDR_BITS          : integer := 9;      -- Number of bits in the multiplexed address bus
      DEFAULT_STATE      : std_logic := '0';  -- State to initialize bits
      SIM_INIT_FILE      : string  := "imem.srec";
      SIM_LOG_FILE       : string  := "";
      INIT_FILE_INDIRECT : integer := 0;      -- 0: Filename contains data, 1: Filename contains Filename
      T_CAS_DELAY        : time    := 8 ns;   -- Read access delay time (Tcas)
      T_OE_DATA_DELAY    : time    := 2 ns;   -- Data delay when OE enabled
      T_OE_OFF_DELAY     : time    := 1 ns    -- Turn off time when OE disabled
    );
    port (
      ma                 :    in std_logic_vector((ADDR_BITS-1) downto 0);        -- Multiplexed address
      ras0               :    in std_logic;                                         -- Row address strobe (low active)
      cas0               :    in std_logic_vector((WIDTH/BITS_PER_CAS)-1 downto 0); -- Column address strobe (low active)
      we0                :    in std_logic;                                         -- Write enable (low active)
      oe0                :    in std_logic;                                         -- Output enable (low active)

      dq                 : inout std_logic_vector(WIDTH-1 downto 0) bus             -- Data bus (Bi-directional)
    );
  end component;

  component dram_cntl
    port (
      clk                :  in std_logic;
      rst0               :  in std_logic;
      addr               :  in std_logic_vector(19 downto 0);
      start              :  in std_logic;
      acc_type           :  in std_logic_vector(1 downto 0);  -- "00" single access
                                                              -- "01" page access
                                                              -- "10" refresh
      size               :  in std_logic_vector(1 downto 0);  -- "00" word
                                                              -- "01" half-word
                                                              -- "10" byte
      r1w0               :  in std_logic;
      ras_0              : out std_logic;
      cas_0              : out std_logic_vector(3 downto 0);
      we_0               : out std_logic;
      latch              : out std_logic;
      mux_addr           : out std_logic_vector(8 downto 0)
    );
  end component;

  signal data_s:   std_logic_vector(31 downto 0) bus;

  type test_record is record
    rst0           : std_logic;
    cpu_cs         : std_logic;
    cpu_r1w0       : std_logic;
    cpu_size       : std_logic_vector(1 downto 0);
    cpu_addr       : std_logic_vector(31 downto 0);
    cpu_wdata      : std_logic_vector(31 downto 0);
    exp_cpu_rdata  : std_logic_vector(31 downto 0);
    exp_cpu_ready  : std_logic;
  end record;

  signal vector_s  : test_record;

  signal rst0_s               : std_logic;
  signal CPUclk_s             : std_logic;
  signal MEMclk_s             : std_logic;
  signal clkSync_s            : std_logic;

  signal cpu_cs_s             : std_logic;
  signal cpu_r1w0_s           : std_logic;
  signal cpu_size_s           : std_logic_vector(1 downto 0);
  signal cpu_addr_s           : std_logic_vector(31 downto 0);
  signal cpu_wdata_s          : std_logic_vector(31 downto 0);
  signal cpu_rdata_s          : std_logic_vector(31 downto 0);

  signal cpu_hit_s            : std_logic;
  signal cpu_miss_s           : std_logic;
  signal cpu_ready_s          : std_logic;

  signal dram_start_s         : std_logic;
  signal dram_ack_s           : std_logic;

  signal dram_r1w0_s          : std_logic;
  signal dram_type_s          : std_logic_vector(1 downto 0);
  signal dram_size_s          : std_logic_vector(1 downto 0);
  signal dram_addr_s          : std_logic_vector(31 downto 0);
  signal dram_wdata_s         : std_logic_vector(31 downto 0);
  signal dram_rdata_s         : std_logic_vector(31 downto 0);
  signal dram_latch_s         : std_logic;

  signal dram_ras0_s          : std_logic;
  signal dram_cas0_s          : std_logic_vector(3 downto 0);
  signal dram_we0_s           : std_logic;
  signal dram_mux_addr_s      : std_logic_vector(8 downto 0);

  signal dram_dq_s            : std_logic_vector(31 downto 0) bus;

  signal dram_oe0_s           : std_logic;

begin

  CLK_cpu: clk_gen
    generic map (
      clk_period            => 10 ns,
      clk_offset            => 0 ns,
      clk_init_val          => '1'
    )
    port map (
      clk                   => CPUclk_s
    );

  MEM_clk: clk_gen
    generic map (
      clk_period            => 20 ns,
      clk_offset            => 0 ns,
      clk_init_val          => '1'
    )
    port map (
      clk                   => MEMclk_s
    );

  clk_Sync: clk_gen
    generic map (
      clk_period            => 20 ns,
      clk_offset            => 1 ns,
      clk_init_val          => '0'
    )
    port map (
      clk                   => clkSync_s
    );
    
  c1: cache
    generic map (
      NUM_WAYS              => 2,
      NUM_SETS              => 8,
      NUM_SETS_BITS         => 3,
      NUM_TAG_BITS          => 5,
      NUM_LINE_WORDS        => 4,
      NUM_LINE_WORDS_BITS   => 2,
      WORD_WIDTH            => 32,
      ADDR_WIDTH            => 32,
      RD_ACCESS             => 4 ns
    )
    port map (
      rst0                  => rst0_s,
      clk                   => CPUclk_s,
      clkSync               => clkSync_s,
  
      cpu_cs                => cpu_cs_s,
      cpu_r1w0              => cpu_r1w0_s,
      cpu_size              => cpu_size_s,
      cpu_addr              => cpu_addr_s,
  
      cpu_wdata             => cpu_wdata_s,
      cpu_rdata             => cpu_rdata_s,
  
      cpu_hit               => cpu_hit_s,
      cpu_miss              => cpu_miss_s,
      cpu_ready             => cpu_ready_s,
  
      dram_start            => dram_start_s,
      --dram_ack              => dram_ack_s,
      dram_r1w0             => dram_r1w0_s,
      dram_type             => dram_type_s,
      dram_size             => dram_size_s,
      dram_addr             => dram_addr_s,
      dram_wdata            => dram_wdata_s,
      dram_rdata            => dram_rdata_s,
      dram_oe0              => dram_oe0_s,
      dram_latch            => dram_latch_s
    );

  dc: dram_cntl
    port map (
      clk                   => MEMclk_s,
      rst0                  => rst0_s,
      addr                  => dram_addr_s(19 downto 0),
      start                 => dram_start_s,
      acc_type              => dram_type_s,
      size                  => dram_size_s,
      r1w0                  => dram_r1w0_s,
      ras_0                 => dram_ras0_s,
      cas_0                 => dram_cas0_s,
      we_0                  => dram_we0_s,
      latch                 => dram_latch_s,
      mux_addr              => dram_mux_addr_s
    );


  s1: dram
    generic map (
      ENDIAN                => 1,
      WIDTH                 => 32,
      BITS_PER_CAS          => 8,
      WORDS                 => 1024,
      BASE_OFFSET           => 0,
      ADDR_BITS             => 9,
      DEFAULT_STATE         => '0',
      SIM_INIT_FILE         => "DRAMsystem_dram.srec",
      SIM_LOG_FILE          => "Log.txt",
      INIT_FILE_INDIRECT    => 0,
      T_CAS_DELAY           => 8 ns,
      T_OE_DATA_DELAY       => 2 ns,
      T_OE_OFF_DELAY        => 1 ns
    )
    port map (
      ma                    => dram_mux_addr_s,
      ras0                  => dram_ras0_s,
      cas0                  => dram_cas0_s,
      we0                   => dram_we0_s,
      oe0                   => dram_oe0_s,
      dq                    => dram_dq_s
    );

  --
  -- When dram_oe0_s is low,  the DRAM is driving the bus
  --                 is high, the Cache is driving the bus
  buf: process(dram_dq_s, dram_oe0_s, dram_wdata_s  ) is
  begin

    dram_rdata_s            <= dram_dq_s;

    if(dram_oe0_s = '1') then
      dram_dq_s             <= dram_wdata_s;
    else
      dram_dq_s             <= (others => 'Z');
    end if;
  end process buf;

  drv_cpu_rst0: drive_bit
    generic map (
--    clk_offset    => signal_application_delay
      clk_offset    => 5 ns
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.rst0,
      actual_sig    => rst0_s
    );

  drv_cpu_cs: drive_bit
    generic map (
      clk_offset    => signal_application_delay
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.cpu_cs,
      actual_sig    => cpu_cs_s
    );

  drv_cpu_r1w0: drive_bit
    generic map (
      clk_offset    => signal_application_delay
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.cpu_r1w0,
      actual_sig    => cpu_r1w0_s
    );

  drv_cpu_size: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 2
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.cpu_size,
      actual_sig    => cpu_size_s
    );

  drv_cpu_addr: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 32
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.cpu_addr,
      actual_sig    => cpu_addr_s
    );

  drv_cpu_wdata: drive_bus
    generic map (
      clk_offset    => signal_application_delay,
      width         => 32
    )
    port map (
      clk           => CPUclk_s,
      value_sig     => vector_s.cpu_wdata,
      actual_sig    => cpu_wdata_s
    );

  chk_cpu_rdata: check_bus
    generic map (
      clk_offset    => check_time,
      width         => 32,
      sig_label     => "cpu_rdata"
    )
    port map (
      clk           => CPUclk_s,
      expected_sig  => vector_s.exp_cpu_rdata,
      actual_sig    => cpu_rdata_s
      );

  chk_cpu_ready: check_bit
    generic map (
      clk_offset    => check_time,
      sig_label     => "cpu_ready"
    )
    port map (
      clk           => CPUclk_s,
      expected_sig  => vector_s.exp_cpu_ready,
      actual_sig    => cpu_ready_s
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
        testInfo.test_size := str_size;
--      -- Extract memory initfile name
--      get_word(line_in,initfile,init_file_size);
--      -- Put initfile name as contents of initialization file
--      file_open(init_file,external_name => "imem.srec", open_kind => write_mode);
--      write_string(line_out,initfile);
--      writeline(init_file,line_out);
--      file_close(init_file);
--      -- File name set, so create a pulse on "initialize_memory" global signal
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
          -- Get the rst0 signal
          get_word(l,t,str_size);
          vector_s.rst0 <= cvt_char(t);

          -- Get the cs signal
          get_word(l,t,str_size);
          vector_s.cpu_cs <= cvt_char(t);

          -- Get the r1w0 signal
          get_word(l,t,str_size);
          vector_s.cpu_r1w0 <= cvt_char(t);

          -- Get the size signal
          get_word(l,t,str_size);
          vector_s.cpu_size <= hex_to_std(t(1),2);

          -- Get the addr bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.cpu_addr <= (others => '-');
          else
            vector_s.cpu_addr <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the wdata bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.cpu_wdata <= "--------------------------------";
          else
            vector_s.cpu_wdata <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the exp_cpu_rdata bus signal
          get_word(l,t,str_size);
          if(dash_present(t,2) = true) then
            vector_s.exp_cpu_rdata <= "--------------------------------";
          else
            vector_s.exp_cpu_rdata <= hex_to_std(t(1 to 8),32);
          end if;

          -- Get the ready signal
          get_word(l,t,str_size);
          vector_s.exp_cpu_ready <= cvt_char(t);

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

end test_bench;
