library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and_2 is
  port (
    i0 : in std_logic;
    i1 : in std_logic;
    y  : out std_logic
  );
end entity and_2;

architecture rtl of and_2 is
begin
  y <= i0 and i1;
end architecture rtl;