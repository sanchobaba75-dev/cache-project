library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

architecture gates of full_adder is
 signal xor1_s, and1_s, and2_s: std_logic;
 component and_2
 port (
 i0, i1: in std_logic;
 y: out std_logic
 );
 end component;
 component xor_2
 port (
 i0, i1: in std_logic;
 y: out std_logic
 );
 end component;
 component or_2
 port (
 i0, i1: in std_logic;
 y: out std_logic
 );
 end component;
begin
 xor1: xor_2
 port map (
 i0 => a,
 i1 => b,
 y => xor1_s
 );
 xor2: xor_2
 port map (
 i0 => xor1_s,
 i1 => ci,
 y => s
 );
 and1: and_2
 port map (
 i0 => a,
 i1 => b,
 y => and1_s
 );
 and2: and_2
 port map (
 i0 => ci,
 i1 => xor1_s,
 y => and2_s
 );
 or1: or_2
 port map (
 i0 => and2_s,
 i1 => and1_s,
 y => co
 );
end architecture gates;

configuration FullAdder_Config_gates of full_adder is
 for gates
 --for xor1: xor_2 use entity work.xor_2(rtl); end for;
 --for xor2: xor_2 use entity work.xor_2(rtl); end for;
 --for or1: or_2 use entity work.or_2(rtl); end for;
 --for all: and_2 use entity work.and_2(rtl); end for;
 end for;
end configuration FullAdder_Config_gates;