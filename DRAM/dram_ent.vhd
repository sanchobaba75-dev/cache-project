--
--
--         Dynamic RAM Model
--
--       Dr. Edward L. Hepler
--        VLSI Concepts, Inc.
--  Copyright 2005, 2006, 2011, 2022
--
--

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

		--
		--   DRAM model
                --

entity dram is
  generic (
    ENDIAN             : integer := 1;      -- 0: Big; 1: Little
    WIDTH              : integer := 32;     -- Number of data bits
    BITS_PER_CAS       : integer := 8;      -- Number of data bits per cas signal
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
    ma                 :    in std_logic_vector(ADDR_BITS-1 downto 0);            -- Multiplexed address
    ras0               :    in std_logic;                                         -- Row address strobe (low active)
    cas0               :    in std_logic_vector((WIDTH/BITS_PER_CAS)-1 downto 0); -- Column address strobe (low active)
    we0                :    in std_logic;                                         -- Write enable (low active)
    oe0                :    in std_logic;                                         -- Output enable (low active)

    dq                 : inout std_logic_vector(WIDTH-1 downto 0) bus             -- Data bus (Bi-directional)
  );
end dram;

