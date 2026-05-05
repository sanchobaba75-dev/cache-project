
library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package CONV_PACK_adder_sub_8bit is


attribute ENUM_ENCODING : STRING;

end CONV_PACK_adder_sub_8bit;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   
use work.CONV_PACK_adder_sub_8bit.all;


entity adder_sub_8bit is

   port( a, b : in std_logic_vector (7 downto 0);  cin, A0_S1 : in std_logic;  
         sum : out std_logic_vector (7 downto 0);  cout : out std_logic);

end adder_sub_8bit;

architecture SYN_rtl of adder_sub_8bit is

   component GTECH_NOT
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component SELECT_OP
      generic( num_inputs, input_width : integer );
      port( DATA : in std_logic_vector( num_inputs* input_width - 1 downto 0 );
            CONTROL : in std_logic_vector( num_inputs - 1 downto 0 ); Z : out 
            std_logic_vector( input_width - 1 downto 0 ) );
   end component;
   
   component GTECH_BUF
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   signal N0, N1, X_Logic1_port, a_7_port, a_6_port, a_5_port, a_4_port, 
      a_3_port, a_2_port, a_1_port, a_0_port, b_7_port, b_6_port, b_5_port, 
      b_4_port, b_3_port, b_2_port, b_1_port, b_0_port, cin_port, sum_7_port, 
      sum_6_port, sum_5_port, sum_4_port, sum_3_port, sum_2_port, sum_1_port, 
      sum_0_port, cout_port, N2, N3, N4, N5, N6, N7, N8, N9, N10, b_mod_7_port,
      b_mod_6_port, b_mod_5_port, b_mod_4_port, b_mod_3_port, b_mod_2_port, 
      b_mod_1_port, b_mod_0_port, c9_0_port, N11, N12, N13, N14, N15, N16, N17,
      N18, N19 : std_logic;

begin
   ( a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, a_1_port, 
      a_0_port ) <= a;
   ( b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, b_1_port, 
      b_0_port ) <= b;
   cin_port <= cin;
   sum <= ( sum_7_port, sum_6_port, sum_5_port, sum_4_port, sum_3_port, 
      sum_2_port, sum_1_port, sum_0_port );
   cout <= cout_port;
   
   add_42 : process ( a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, 
         a_2_port, a_1_port, a_0_port, b_mod_7_port, b_mod_6_port, b_mod_5_port
         , b_mod_4_port, b_mod_3_port, b_mod_2_port, b_mod_1_port, b_mod_0_port
         )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( '0', a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, 
            a_1_port, a_0_port );
      B := ( '0', b_mod_7_port, b_mod_6_port, b_mod_5_port, b_mod_4_port, 
            b_mod_3_port, b_mod_2_port, b_mod_1_port, b_mod_0_port );
      Z := A + B;
      ( N19, N18, N17, N16, N15, N14, N13, N12, N11 ) <= Z;
   end process;
   
   add_42_2 : process ( N19, N18, N17, N16, N15, N14, N13, N12, N11, c9_0_port 
         )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( N19, N18, N17, N16, N15, N14, N13, N12, N11 );
      B := ( '0', '0', '0', '0', '0', '0', '0', '0', c9_0_port );
      Z := A + B;
      ( cout_port, sum_7_port, sum_6_port, sum_5_port, sum_4_port, sum_3_port, 
            sum_2_port, sum_1_port, sum_0_port ) <= Z;
   end process;
   
   C35_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 8 )
      port map(
         
         DATA(7) => N3, DATA(6) => N4, DATA(5) => N5, DATA(4) => N6, DATA(3) =>
               N7, DATA(2) => N8, DATA(1) => N9, DATA(0) => N10, 
         
         DATA(15) => b_7_port, DATA(14) => b_6_port, DATA(13) => b_5_port, 
               DATA(12) => b_4_port, DATA(11) => b_3_port, DATA(10) => b_2_port
               , DATA(9) => b_1_port, DATA(8) => b_0_port, 
         '
         CONTROL(0) => N0, 
         
         CONTROL(1) => N1, 
        
         Z(7) => b_mod_7_port, Z(6) => b_mod_6_port, Z(5) => b_mod_5_port, Z(4)
               => b_mod_4_port, Z(3) => b_mod_3_port, Z(2) => b_mod_2_port, 
               Z(1) => b_mod_1_port, Z(0) => b_mod_0_port );
   B_0 : GTECH_BUF port map( A => A0_S1, Z => N0);
   B_1 : GTECH_BUF port map( A => N2, Z => N1);
   C36_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 1 )
      port map(
        
         DATA(0) => X_Logic1_port, 
         
         DATA(1) => cin_port, 
         
         CONTROL(0) => N0, 
         
         CONTROL(1) => N1, 
         
         Z(0) => c9_0_port );
         X_Logic1_port <= '1';
   I_0 : GTECH_NOT port map( A => A0_S1, Z => N2);
   I_1 : GTECH_NOT port map( A => b_7_port, Z => N3);
   I_2 : GTECH_NOT port map( A => b_6_port, Z => N4);
   I_3 : GTECH_NOT port map( A => b_5_port, Z => N5);
   I_4 : GTECH_NOT port map( A => b_4_port, Z => N6);
   I_5 : GTECH_NOT port map( A => b_3_port, Z => N7);
   I_6 : GTECH_NOT port map( A => b_2_port, Z => N8);
   I_7 : GTECH_NOT port map( A => b_1_port, Z => N9);
   I_8 : GTECH_NOT port map( A => b_0_port, Z => N10);

end SYN_rtl;

library IEEE;

use IEEE.std_logic_1164.all;
entity SELECT_OP is
   generic ( num_inputs, input_width : integer );
   port(
      DATA : in std_logic_vector( num_inputs  * input_width - 1 downto 0 );
      CONTROL : in std_logic_vector( num_inputs - 1 downto 0 );
      Z : out std_logic_vector( input_width - 1 downto 0 )
   );
end SELECT_OP;

architecture RTL of SELECT_OP is
begin

   process ( DATA, CONTROL )
      variable index, high, low : integer;
   begin
   
      
      index := 0;
      
      
      for_loop : for i in CONTROL'range loop
      
         if ( CONTROL(i) = '1' ) then
         
            index := i;
            exit for_loop;
            
         end if;
         
      end loop;
      
      
      low := input_width * index;
      high := low + input_width - 1;
      Z <= DATA( high downto low );
   
   end process;
   
end RTL;
