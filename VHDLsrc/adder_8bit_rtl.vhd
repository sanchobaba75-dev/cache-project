
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_adder_8bit is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_adder_8bit;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   
use work.CONV_PACK_adder_sub_8bit.all;

entity adder_8bit is

   port( a, b : in std_logic_vector (7 downto 0);  cin : in std_logic;  sum : 
         out std_logic_vector (7 downto 0);  cout : out std_logic);

end adder_8bit;

architecture SYN_rtl of adder_8bit is

   component GTECH_BUF
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, a_1_port,
      a_0_port, b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, 
      b_1_port, b_0_port, sum_7_port, sum_6_port, sum_5_port, sum_4_port, 
      sum_3_port, sum_2_port, sum_1_port, sum_0_port, cout_port, c9_0_port, N0,
      N1, N2, N3, N4, N5, N6, N7, N8 : std_logic;

begin
   ( a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, a_1_port, 
      a_0_port ) <= a;
   ( b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, b_1_port, 
      b_0_port ) <= b;
   sum <= ( sum_7_port, sum_6_port, sum_5_port, sum_4_port, sum_3_port, 
      sum_2_port, sum_1_port, sum_0_port );
   cout <= cout_port;
   
   add_23 : process ( a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, 
         a_2_port, a_1_port, a_0_port, b_7_port, b_6_port, b_5_port, b_4_port, 
         b_3_port, b_2_port, b_1_port, b_0_port )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( '0', a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, 
            a_1_port, a_0_port );
      B := ( '0', b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, 
            b_1_port, b_0_port );
      Z := A + B;
      ( N8, N7, N6, N5, N4, N3, N2, N1, N0 ) <= Z;
   end process;
   
   add_23_2 : process ( N8, N7, N6, N5, N4, N3, N2, N1, N0, c9_0_port )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( N8, N7, N6, N5, N4, N3, N2, N1, N0 );
      B := ( '0', '0', '0', '0', '0', '0', '0', '0', c9_0_port );
      Z := A + B;
      ( cout_port, sum_7_port, sum_6_port, sum_5_port, sum_4_port, sum_3_port, 
            sum_2_port, sum_1_port, sum_0_port ) <= Z;
   end process;
   
   B_0 : GTECH_BUF port map( A => cin, Z => c9_0_port);

end SYN_rtl;
