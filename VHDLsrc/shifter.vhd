library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.riscv_pkg.all;

entity shifter is
  port (
    a        : in  std_logic_vector(31 downto 0);
    shamt    : in  std_logic_vector(4 downto 0);
    alu_func : in  alu_func_type;
    result   : out std_logic_vector(31 downto 0)
  );
end entity shifter;

architecture rtl of shifter is

  signal stage1, stage2, stage3, stage4, stage5 : std_logic_vector(31 downto 0);
  signal fill_bit     : std_logic;
  signal reversed_in  : std_logic_vector(31 downto 0);
  signal reversed_out : std_logic_vector(31 downto 0);
  signal shift_input  : std_logic_vector(31 downto 0);

begin

  
  reversed_in <=
    a(0)  & a(1)  & a(2)  & a(3)  &
    a(4)  & a(5)  & a(6)  & a(7)  &
    a(8)  & a(9)  & a(10) & a(11) &
    a(12) & a(13) & a(14) & a(15) &
    a(16) & a(17) & a(18) & a(19) &
    a(20) & a(21) & a(22) & a(23) &
    a(24) & a(25) & a(26) & a(27) &
    a(28) & a(29) & a(30) & a(31);

  
  shift_input <= reversed_in when alu_func = ALU_SLL else a;


  fill_bit <= shift_input(31) when alu_func = ALU_SRA else '0';

  
  stage1 <= 
    fill_bit & shift_input(31 downto 1)
    when shamt(0) = '1'
    else shift_input;

  
  stage2 <=
    fill_bit & fill_bit &
    stage1(31 downto 2)
    when shamt(1) = '1'
    else stage1;

  
  stage3 <=
    fill_bit & fill_bit & fill_bit & fill_bit &
    stage2(31 downto 4)
    when shamt(2) = '1'
    else stage2;

  
  stage4 <=
    fill_bit & fill_bit & fill_bit & fill_bit &
    fill_bit & fill_bit & fill_bit & fill_bit &
    stage3(31 downto 8)
    when shamt(3) = '1'
    else stage3;

 
  stage5 <=
    fill_bit & fill_bit & fill_bit & fill_bit &
    fill_bit & fill_bit & fill_bit & fill_bit &
    fill_bit & fill_bit & fill_bit & fill_bit &
    fill_bit & fill_bit & fill_bit & fill_bit &
    stage4(31 downto 16)
    when shamt(4) = '1'
    else stage4;

  
  reversed_out <=
    stage5(0)  & stage5(1)  & stage5(2)  & stage5(3)  &
    stage5(4)  & stage5(5)  & stage5(6)  & stage5(7)  &
    stage5(8)  & stage5(9)  & stage5(10) & stage5(11) &
    stage5(12) & stage5(13) & stage5(14) & stage5(15) &
    stage5(16) & stage5(17) & stage5(18) & stage5(19) &
    stage5(20) & stage5(21) & stage5(22) & stage5(23) &
    stage5(24) & stage5(25) & stage5(26) & stage5(27) &
    stage5(28) & stage5(29) & stage5(30) & stage5(31);


  result <= reversed_out when alu_func = ALU_SLL else stage5;

end architecture rtl;