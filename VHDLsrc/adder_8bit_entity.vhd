library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_8bit is
  port (
    a    : in std_logic_vector(7 downto 0);
    b    : in std_logic_vector(7 downto 0);
    cin  : in std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end entity adder_8bit;