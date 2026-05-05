library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_sub_8bit_reg is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;  
    a      : in  std_logic_vector(7 downto 0);
    b      : in  std_logic_vector(7 downto 0);
    cin    : in  std_logic;
    A0_S1  : in  std_logic;
    sum    : out std_logic_vector(7 downto 0);
    cout   : out std_logic
  );
end entity adder_sub_8bit_reg;

architecture rtl of adder_sub_8bit_reg is
  
  signal a_r     : std_logic_vector(7 downto 0);
  signal b_r     : std_logic_vector(7 downto 0);
  signal cin_r   : std_logic;
  signal A0_S1_r : std_logic;

  
  signal sum_c  : std_logic_vector(7 downto 0);
  signal cout_c : std_logic;
begin

  
  reg_in : process(clk)
    variable tmp : unsigned(8 downto 0);
    variable a9  : unsigned(8 downto 0);
    variable b9  : unsigned(8 downto 0);
    variable c9  : unsigned(8 downto 0);
    variable b_mod : unsigned(8 downto 0);
  begin
    if rising_edge(clk) then
      if rst = '1' then
        a_r     <= (others => '0');
        b_r     <= (others => '0');
        cin_r   <= '0';
        A0_S1_r <= '0';
      else
        a_r     <= a;
        b_r     <= b;
        cin_r   <= cin;
        A0_S1_r <= A0_S1;
      end if;
    end if;
  end process;

 
  comb : process(a_r, b_r, cin_r, A0_S1_r)
    variable tmp : unsigned(8 downto 0);
    variable a9  : unsigned(8 downto 0);
    variable b_mod : unsigned(8 downto 0);
    variable c9  : unsigned(8 downto 0);
  begin
    a9 := unsigned('0' & a_r);

    if A0_S1_r = '1' then
      b_mod := unsigned('0' & not b_r);
      c9    := to_unsigned(1, 9);
    else
      b_mod := unsigned('0' & b_r);
      if cin_r = '1' then
        c9 := to_unsigned(1, 9);
      else
        c9 := to_unsigned(0, 9);
      end if;
    end if;

    tmp := a9 + b_mod + c9;

    sum_c  <= std_logic_vector(tmp(7 downto 0));
    cout_c <= tmp(8);
  end process;

  
  reg_out : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        sum  <= (others => '0');
        cout <= '0';
      else
        sum  <= sum_c;
        cout <= cout_c;
      end if;
    end if;
  end process;

end architecture rtl;
