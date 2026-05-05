library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package cache_pkg is
  -- Tag store word layout (one entry per set, holds info for BOTH ways):
  --   bit  0           : LRU  (0 => way0 is LRU, 1 => way1 is LRU)
  --   bits 1..1        : valid way0
  --   bits 2..2        : dirty way0
  --   bits 3..7        : tag   way0  (5 bits)
  --   bits 8..8        : valid way1
  --   bits 9..9        : dirty way1
  --   bits 10..14      : tag   way1  (5 bits)
  -- Total = 15 bits.  We size the SRAM word to 16 for byte-write friendliness.
  constant TAG_STORE_WIDTH : integer := 16;

  function pack_tag_word(
    lru   : std_logic;
    v0,d0 : std_logic; t0 : std_logic_vector(4 downto 0);
    v1,d1 : std_logic; t1 : std_logic_vector(4 downto 0)
  ) return std_logic_vector;
end package;

package body cache_pkg is
  function pack_tag_word(
    lru   : std_logic;
    v0,d0 : std_logic; t0 : std_logic_vector(4 downto 0);
    v1,d1 : std_logic; t1 : std_logic_vector(4 downto 0)
  ) return std_logic_vector is
    variable r : std_logic_vector(15 downto 0) := (others => '0');
  begin
    r(0)            := lru;
    r(1)            := v0;
    r(2)            := d0;
    r(7 downto 3)   := t0;
    r(8)            := v1;
    r(9)            := d1;
    r(14 downto 10) := t1;
    return r;
  end function;
end package body;
