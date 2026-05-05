--
-- SYNC_2A testbench
--

library ieee;
 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.VLSI_TestBench_pkg.all;

entity sync_2a_tb is
end sync_2a_tb;

architecture test_bench of sync_2a_tb is
  component sync_2a_sram is
    generic (
      ENDIAN                : integer := 1;      -- 0: Big; 1: Little
      WIDTH                 : integer := 32;     -- Number of data bits
      BITS_PER_WE           : integer := 8;      -- Number of data bits per wr_en
      WORDS                 : integer := 512;    -- Number of locations
      BASE_OFFSET           : integer := 0;      -- Offset from initialization address
      ADDR_BITS             : integer := 9;      -- Number of bits in the address bus
      DEFAULT_STATE         : std_logic := '0';  -- State to initialize bits
      SIM_INIT_FILE         : string  := "imem.srec";
      INIT_FILE_INDIRECT    : integer := 0;      -- 0: Filename contains data, 1: Filename contains Filename
      RD_ACCESS             : time    := 4 ns    -- Read access delay time
    );
    port (
      clk                   :  in std_logic;
  
      cs                    :  in std_logic;
  
      wr_en                 :  in std_logic_vector(
                                      (WIDTH/BITS_PER_WE)-1 downto 0);
  
      wAddr                 :  in std_logic_vector(ADDR_BITS-1 downto 0);
      wdata                 :  in std_logic_vector(WIDTH-1 downto 0);
  
      rAddr                 :  in std_logic_vector(ADDR_BITS-1 downto 0);
      rdata                 : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component;

  signal clk_s:        std_logic;
  signal cs_s:         std_logic;
  signal wr_en_s:      std_logic_vector(3 downto 0);
  signal raddr_s:      std_logic_vector(8 downto 0);
  signal waddr_s:      std_logic_vector(8 downto 0);
  signal rdata_s:      std_logic_vector(31 downto 0);
  signal wdata_s:      std_logic_vector(31 downto 0);

  type test_record is record
         cs:  std_logic;
      wr_en:  std_logic_vector(3 downto 0);
      raddr:  std_logic_vector(8 downto 0);
      waddr:  std_logic_vector(8 downto 0);
  exp_rdata:  std_logic_vector(31 downto 0);
      wdata:  std_logic_vector(31 downto 0);
        chk:  std_logic;
  end record;

  type test_array is array(positive range <>) of test_record;

  constant test_patterns: test_array := (
    ( cs => '1', wr_en => X"0", raddr => B"000000001", waddr => B"000000000", exp_rdata => X"00000006", wdata => X"00000000", chk => '1'),
    ( cs => '1', wr_en => X"0", raddr => B"000000010", waddr => B"000000000", exp_rdata => X"00000002", wdata => X"00000000", chk => '1'),
    ( cs => '1', wr_en => X"0", raddr => B"000000011", waddr => B"000000000", exp_rdata => X"ffffffff", wdata => X"00000000", chk => '1'),
    ( cs => '1', wr_en => X"f", raddr => B"000000010", waddr => B"000000010", exp_rdata => X"12345678", wdata => X"12345678", chk => '1'),
    ( cs => '1', wr_en => X"0", raddr => B"000000001", waddr => B"000000000", exp_rdata => X"00000006", wdata => X"00000000", chk => '1'),
    ( cs => '1', wr_en => X"0", raddr => B"000000010", waddr => B"000000000", exp_rdata => X"12345678", wdata => X"00000000", chk => '1')

  );

  begin
    clk_gen1: clk_gen
      generic map (
        clk_period    => 20 ns,
        clk_offset    => 0 ns,
        clk_init_val  => '1'
      )
      port map (
        clk           => clk_s
      );
  
    s1: sync_2a_sram
      generic map (1,32,8,512,0,9,'0',"sync_2a_tb.srec",0,4 ns)
      port map (clk => clk_s, cs => cs_s, wr_en => wr_en_s, raddr => raddr_s, waddr => waddr_s, wdata => wdata_s, rdata => rdata_s);

    test: process
      variable vector: test_record;
      variable found_error: boolean := false;

      begin
        wait for 12 ns;

        for i in test_patterns'range loop
          vector := test_patterns(i);

          wait for 2 ns;
				-- Apply the values;
          cs_s      <= vector.cs after 1 ns;
          wr_en_s   <= vector.wr_en after 1 ns;
          raddr_s   <= vector.raddr after 1 ns;
          waddr_s   <= vector.waddr after 1 ns;
          wdata_s   <= vector.wdata after 1 ns;

          wait for 15 ns;

          if(vector.chk = '1') then
            if(rdata_s /=  vector.exp_rdata) then
              assert false
                report "Data value is " & to_string(rdata_s)
                     & ".  Expected is " 
                     & to_string(vector.exp_rdata);
                found_error := true;
            end if;
          end if;

          wait for 3 ns;
        end loop;

        assert not found_error
          report "There were ERRORS in the test"
          severity note;
        assert found_error
          report "Test completed with no errors"
          severity note;
        wait;
      end process;

    end test_bench;
