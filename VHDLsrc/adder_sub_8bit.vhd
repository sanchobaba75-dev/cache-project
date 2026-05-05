library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_sub_8bit is
  port (
    a      : in  std_logic_vector(7 downto 0);
    b      : in  std_logic_vector(7 downto 0);
    cin    : in  std_logic;
    A0_S1  : in  std_logic;  -- 0 = ADD, 1 = SUB
    sum    : out std_logic_vector(7 downto 0);
    cout   : out std_logic
  );
end entity adder_sub_8bit;


architecture rtl of adder_sub_8bit is
begin
  process(a, b, cin, A0_S1)
    variable tmp : unsigned(8 downto 0);
    variable a9  : unsigned(8 downto 0);
    variable b9  : unsigned(8 downto 0);
    variable c9  : unsigned(8 downto 0);
    variable b_mod : unsigned(8 downto 0);
  begin
    a9 := unsigned('0' & a);

    if A0_S1 = '1' then
      
      b_mod := unsigned('0' & not b);
      c9    := to_unsigned(1, 9);
    else
      
      b_mod := unsigned('0' & b);
      if cin = '1' then
        c9 := to_unsigned(1, 9);
      else
        c9 := to_unsigned(0, 9);
      end if;
    end if;

    tmp := a9 + b_mod + c9;

    sum  <= std_logic_vector(tmp(7 downto 0));
    cout <= tmp(8);
  end process;
end architecture rtl;
