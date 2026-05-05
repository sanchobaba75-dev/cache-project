library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity full_adder is
 port (
 a : in std_logic;
 b : in std_logic;
 ci: in std_logic;
 s : out std_logic;
 co: out std_logic
 );
end entity full_adder;