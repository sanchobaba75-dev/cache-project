--
--
--    Synchronous Two-address SRAM 
--
--       Dr. Edward L. Hepler
--        VLSI Concepts, Inc.
--          Copyright 2022
--
--

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

		--
		-- Synchronous Two Address SRAM
                --
		--   One address for Read
                --   One address for Write
		--   Separate read/write busses
                --

entity sync_2a_sram is
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

    wr_en                 :  in std_logic_vector((WIDTH/BITS_PER_WE)-1 downto 0);

    wAddr                 :  in std_logic_vector(ADDR_BITS-1 downto 0);
    wdata                 :  in std_logic_vector(WIDTH-1 downto 0);

    rAddr                 :  in std_logic_vector(ADDR_BITS-1 downto 0);
    rdata                 : out std_logic_vector(WIDTH-1 downto 0)
  );
end sync_2a_sram;

