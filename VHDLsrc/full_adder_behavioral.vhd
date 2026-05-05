library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

architecture equations of full_adder is
begin
  s  <= a xor b xor ci;
  co <= (a and b) or (ci and (a xor b));
end architecture equations;