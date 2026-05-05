library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


architecture rtl of adder_8bit is
begin
  process(a, b, cin)
    variable tmp : unsigned(8 downto 0);
    variable a9  : unsigned(8 downto 0);
    variable b9  : unsigned(8 downto 0);
    variable c9  : unsigned(8 downto 0);
  begin
    a9 := unsigned('0' & a);
    b9 := unsigned('0' & b);

    if cin = '1' then
      c9 := to_unsigned(1, 9);
    else
      c9 := to_unsigned(0, 9);
    end if;

    tmp := a9 + b9 + c9;

    sum  <= std_logic_vector(tmp(7 downto 0));
    cout <= tmp(8);
  end process;
end architecture rtl;