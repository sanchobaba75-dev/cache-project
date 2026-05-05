library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity or_2 is
  port (
    i0 : in std_logic;
    i1 : in std_logic;
    y  : out std_logic
  );
end entity or_2;

architecture rtl of or_2 is
begin
  y <= i0 or i1;
end architecture rtl;