--
-- DRAM testbench
--

library ieee;
 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use work.VLSI_TestBench_pkg.all;

entity dram_tb is
end dram_tb;

architecture test_bench of dram_tb is
  component dram
    generic (
      ENDIAN             : integer := 1;      -- 0: Big; 1: Little
      WIDTH              : integer := 32;     -- Number of data bits
      BITS_PER_CAS       : integer := 8;      -- Number of data bits per cas siganl
      WORDS              : integer := 512;    -- Number of locations
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

  signal ma_s:     std_logic_vector(8 downto 0);
  signal ras0_s:   std_logic;
  signal cas0_s:   std_logic_vector(3 downto 0);
  signal we0_s:    std_logic;
  signal oe0_s:    std_logic;
  signal data_s:   std_logic_vector(31 downto 0) bus;

  type test_record is record
          m:  std_logic_vector(8 downto 0);
        ras:  std_logic;
        cas:  std_logic_vector(3 downto 0);
         we:  std_logic;
         oe:  std_logic;
       data:  std_logic_vector(31 downto 0);
    in1out0:  std_logic;
        chk:  std_logic;
  end record;

  type test_array is array(positive range <>) of test_record;

  constant test_patterns: test_array := (
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),

    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
-- End reset
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),

-- Start a read cycle - Location 100 - from init file
--   Apply row address
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address
    ( m => "001000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply cas, oe
    ( m => "001000000", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas
    ( m => "001000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"aaaaaaaa", in1out0 => '0', chk => '1'),
--   Precharge
    ( m => "001000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),

-- Start a write cycle - Location 100
--   Apply row address, assert we
    ( m => "000000000", ras => '1', cas => "1111", we => '0',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address, also apply data
    ( m => "001000000", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"01234567", in1out0 => '1', chk => '0'),
--   Apply cas
    ( m => "001000000", ras => '0', cas => "0000", we => '0',
      oe => '1', data => X"01234567", in1out0 => '1', chk => '0'),
--   Remove cas, data
    ( m => "001000000", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"01234567", in1out0 => '0', chk => '0'),
--   Second cycle of precharge
    ( m => "001000000", ras => '1', cas => "1111", we => '0',
      oe => '1', data => X"01234567", in1out0 => '0', chk => '0'),
--   Third cycle of precharge
    ( m => "001000000", ras => '1', cas => "1111", we => '0',
      oe => '1', data => X"01234567", in1out0 => '0', chk => '0'),

-- Start a second write cycle
--   Apply row address, assert we
    ( m => "000000000", ras => '1', cas => "1111", we => '0',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address, also apply data
    ( m => "001000000", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"89abcdef", in1out0 => '1', chk => '0'),
--   Apply cas
    ( m => "001000001", ras => '0', cas => "0000", we => '0',
      oe => '1', data => X"89abcdef", in1out0 => '1', chk => '0'),
--   Remove cas, data
    ( m => "001000001", ras => '0', cas => "1111", we => '0',
      oe => '1', data => X"89abcdef", in1out0 => '0', chk => '0'),
--   Precharge
    ( m => "001000001", ras => '1', cas => "1111", we => '0',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),

-- Start a refresh cycle
--   Apply row address
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply cas
    ( m => "000000000", ras => '1', cas => "0000", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "0000", we => '1',
      oe => '1', data => X"00000000", in1out0 => '1', chk => '0'),
--   Apply cas
    ( m => "000000000", ras => '0', cas => "0000", we => '1',
      oe => '1', data => X"00000000", in1out0 => '1', chk => '0'),
--   Remove ras, cas
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Precharge
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),

-- Start a read cycle
--   Apply row address
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address
    ( m => "001000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply cas, oe
    ( m => "001000000", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas
    ( m => "001000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"01234567", in1out0 => '0', chk => '1'),
--   Precharge
    ( m => "001000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),


-- Start a 4 word burst read cycle
--   Apply row address
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address
    ( m => "001000000", ras => '0', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply cas, oe
    ( m => "001000000", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"01234567", in1out0 => '0', chk => '0'),
--   Remove cas and change col address and check data
    ( m => "001000001", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"01234567", in1out0 => '0', chk => '1'),
--  Second word of burst
--   Apply cas, oe
    ( m => "001000001", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"89abcdef", in1out0 => '0', chk => '0'),
--   Remove cas and change col address and check data
    ( m => "001000010", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"89abcdef", in1out0 => '0', chk => '1'),
-- Third word of burst
--   Apply cas, oe
    ( m => "001000010", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"76543210", in1out0 => '0', chk => '0'),
--   Remove cas and change col address and check data
    ( m => "001000011", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"76543210", in1out0 => '0', chk => '1'),
-- Fourth word of burst
--   Apply cas, oe
    ( m => "001000011", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"fedcba98", in1out0 => '0', chk => '0'),
--   Remove cas and change col address amd check data
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"fedcba98", in1out0 => '0', chk => '1'),
--   Precharge
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),


-- Start another 4 word burst read cycle
--   Apply row address
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply ras
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Change ma to col address
    ( m => "001000100", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Apply cas
    ( m => "001000100", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas and change col address
    ( m => "001000101", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '1'),
--  Second word of burst
--   Apply cas, oe
    ( m => "001000101", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas and change col address
    ( m => "001000110", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '1'),
-- Third word of burst
--   Apply cas, oe
    ( m => "001000110", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas and change col address
    ( m => "001000111", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '1'),
-- Fourth word of burst
--   Apply cas, oe
    ( m => "001000111", ras => '0', cas => "0000", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '0'),
--   Remove cas and change col address
    ( m => "000000000", ras => '0', cas => "1111", we => '1',
      oe => '0', data => X"00000000", in1out0 => '0', chk => '1'),
--   Precharge
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),
--   Precharge
    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0'),


    ( m => "000000000", ras => '1', cas => "1111", we => '1',
      oe => '1', data => X"00000000", in1out0 => '0', chk => '0')

  );

  begin
    s1: dram
      generic map (1,32,8,1024,0,9,'0',"dram_data.srec","Log.txt",0,8 ns,2 ns,1 ns)
      port map (ma => ma_s,ras0 => ras0_s,cas0 => cas0_s,we0 => we0_s,oe0 => oe0_s,dq => data_s);

    test: process
      variable vector: test_record;
      variable found_error: boolean := false;

      begin
        wait for 35 ns;

        for i in test_patterns'range loop
          vector := test_patterns(i);

          wait for 2 ns;
				-- Apply the values;
          ma_s     <= vector.m after 1 ns;
          ras0_s   <= vector.ras after 1 ns;
          cas0_s   <= vector.cas after 1 ns;
          we0_s    <= vector.we after 1 ns;
          oe0_s    <= vector.oe after 1 ns;
          if(vector.in1out0 = '1') then
            data_s <= vector.data after 1 ns;
          else
            data_s <= null after 1 ns;
          end if;

          wait for 30 ns;

          if(vector.chk = '1') then
            if(data_s /=  vector.data) then
              assert false
                report "Data value is " & to_string(data_s)
                     & ".  Expected is " 
                     & to_string(vector.data);
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
