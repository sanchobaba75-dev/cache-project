
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_adder_sub_8bit_reg is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_adder_sub_8bit_reg;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   
use work.CONV_PACK_adder_sub_8bit.all;

entity adder_sub_8bit_reg is

   port( clk, rst : in std_logic;  a, b : in std_logic_vector (7 downto 0);  
         cin, A0_S1 : in std_logic;  sum : out std_logic_vector (7 downto 0);  
         cout : out std_logic);

end adder_sub_8bit_reg;

architecture SYN_rtl of adder_sub_8bit_reg is

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
   
   component SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
      generic ( ac_as_q, ac_as_qn, sc_ss_q : integer );
      port(
         clear, preset, enable, data_in, synch_clear, synch_preset, 
            synch_toggle, synch_enable, next_state, clocked_on : in std_logic;
         Q, QN : buffer std_logic
      );
   end component;
   
   signal N0, N1, N2, N3, X_Logic1_port, X_Logic0_port, clk_port, a_7_port, 
      a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, a_1_port, a_0_port, 
      b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, b_1_port, 
      b_0_port, cin_port, A0_S1_port, sum_7_port, sum_6_port, sum_5_port, 
      sum_4_port, sum_3_port, sum_2_port, sum_1_port, sum_0_port, cout_port, N4
      , a_r_7_port, a_r_6_port, a_r_5_port, a_r_4_port, a_r_3_port, a_r_2_port,
      a_r_1_port, a_r_0_port, b_r_7_port, b_r_6_port, b_r_5_port, b_r_4_port, 
      b_r_3_port, b_r_2_port, b_r_1_port, b_r_0_port, cin_r, A0_S1_r, N5, N6, 
      N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, 
      N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, b_mod_7_port, 
      b_mod_6_port, b_mod_5_port, b_mod_4_port, b_mod_3_port, b_mod_2_port, 
      b_mod_1_port, b_mod_0_port, c9_0_port, N32, N33, N34, N35, N36, N37, N38,
      N39, N40, tmp_8_port, tmp_7_port, tmp_6_port, tmp_5_port, tmp_4_port, 
      tmp_3_port, tmp_2_port, tmp_1_port, tmp_0_port, N41, N42, N43, N44, N45, 
      N46, N47, N48, N49, n_1000, n_1001, n_1002, n_1003, n_1004, n_1005, 
      n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, n_1014, 
      n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, n_1023, 
      n_1024, n_1025, n_1026 : std_logic;

begin
   clk_port <= clk;
   ( a_7_port, a_6_port, a_5_port, a_4_port, a_3_port, a_2_port, a_1_port, 
      a_0_port ) <= a;
   ( b_7_port, b_6_port, b_5_port, b_4_port, b_3_port, b_2_port, b_1_port, 
      b_0_port ) <= b;
   cin_port <= cin;
   A0_S1_port <= A0_S1;
   sum <= ( sum_7_port, sum_6_port, sum_5_port, sum_4_port, sum_3_port, 
      sum_2_port, sum_1_port, sum_0_port );
   cout <= cout_port;
   
   A0_S1_r_reg : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N22,
               clocked_on => clk_port, Q => A0_S1_r, QN => n_1000);
   a_r_reg_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N12,
               clocked_on => clk_port, Q => a_r_7_port, QN => n_1001);
   a_r_reg_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N11,
               clocked_on => clk_port, Q => a_r_6_port, QN => n_1002);
   a_r_reg_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N10,
               clocked_on => clk_port, Q => a_r_5_port, QN => n_1003);
   a_r_reg_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N9, 
               clocked_on => clk_port, Q => a_r_4_port, QN => n_1004);
   a_r_reg_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N8, 
               clocked_on => clk_port, Q => a_r_3_port, QN => n_1005);
   a_r_reg_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N7, 
               clocked_on => clk_port, Q => a_r_2_port, QN => n_1006);
   a_r_reg_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N6, 
               clocked_on => clk_port, Q => a_r_1_port, QN => n_1007);
   a_r_reg_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N5, 
               clocked_on => clk_port, Q => a_r_0_port, QN => n_1008);
   b_r_reg_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N20,
               clocked_on => clk_port, Q => b_r_7_port, QN => n_1009);
   b_r_reg_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N19,
               clocked_on => clk_port, Q => b_r_6_port, QN => n_1010);
   b_r_reg_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N18,
               clocked_on => clk_port, Q => b_r_5_port, QN => n_1011);
   b_r_reg_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N17,
               clocked_on => clk_port, Q => b_r_4_port, QN => n_1012);
   b_r_reg_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N16,
               clocked_on => clk_port, Q => b_r_3_port, QN => n_1013);
   b_r_reg_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N15,
               clocked_on => clk_port, Q => b_r_2_port, QN => n_1014);
   b_r_reg_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N14,
               clocked_on => clk_port, Q => b_r_1_port, QN => n_1015);
   b_r_reg_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N13,
               clocked_on => clk_port, Q => b_r_0_port, QN => n_1016);
   cin_r_reg : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N21,
               clocked_on => clk_port, Q => cin_r, QN => n_1017);
   cout_reg : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N49,
               clocked_on => clk_port, Q => cout_port, QN => n_1018);
   sum_reg_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N48,
               clocked_on => clk_port, Q => sum_7_port, QN => n_1019);
   sum_reg_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N47,
               clocked_on => clk_port, Q => sum_6_port, QN => n_1020);
   sum_reg_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N46,
               clocked_on => clk_port, Q => sum_5_port, QN => n_1021);
   sum_reg_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N45,
               clocked_on => clk_port, Q => sum_4_port, QN => n_1022);
   sum_reg_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N44,
               clocked_on => clk_port, Q => sum_3_port, QN => n_1023);
   sum_reg_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N43,
               clocked_on => clk_port, Q => sum_2_port, QN => n_1024);
   sum_reg_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N42,
               clocked_on => clk_port, Q => sum_1_port, QN => n_1025);
   sum_reg_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 5, ac_as_qn => 5, sc_ss_q => 5 )
         port map ( clear => X_Logic0_port, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => X_Logic1_port, next_state => N41,
               clocked_on => clk_port, Q => sum_0_port, QN => n_1026);
   add_78 : process ( a_r_7_port, a_r_6_port, a_r_5_port, a_r_4_port, 
         a_r_3_port, a_r_2_port, a_r_1_port, a_r_0_port, b_mod_7_port, 
         b_mod_6_port, b_mod_5_port, b_mod_4_port, b_mod_3_port, b_mod_2_port, 
         b_mod_1_port, b_mod_0_port )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( '0', a_r_7_port, a_r_6_port, a_r_5_port, a_r_4_port, a_r_3_port, 
            a_r_2_port, a_r_1_port, a_r_0_port );
      B := ( '0', b_mod_7_port, b_mod_6_port, b_mod_5_port, b_mod_4_port, 
            b_mod_3_port, b_mod_2_port, b_mod_1_port, b_mod_0_port );
      Z := A + B;
      ( N40, N39, N38, N37, N36, N35, N34, N33, N32 ) <= Z;
   end process;
   
   add_78_2 : process ( N40, N39, N38, N37, N36, N35, N34, N33, N32, c9_0_port 
         )
      variable A : UNSIGNED( 8 downto 0 );
      variable B : UNSIGNED( 8 downto 0 );
      variable Z : UNSIGNED( 8 downto 0 );
   begin
      A := ( N40, N39, N38, N37, N36, N35, N34, N33, N32 );
      B := ( '0', '0', '0', '0', '0', '0', '0', '0', c9_0_port );
      Z := A + B;
      ( tmp_8_port, tmp_7_port, tmp_6_port, tmp_5_port, tmp_4_port, tmp_3_port,
            tmp_2_port, tmp_1_port, tmp_0_port ) <= Z;
   end process;
   
   C74_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 8 )
      port map(
         -- Connections to port 'DATA1'
         DATA(7) => X_Logic0_port, DATA(6) => X_Logic0_port, DATA(5) => 
               X_Logic0_port, DATA(4) => X_Logic0_port, DATA(3) => 
               X_Logic0_port, DATA(2) => X_Logic0_port, DATA(1) => 
               X_Logic0_port, DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(15) => a_7_port, DATA(14) => a_6_port, DATA(13) => a_5_port, 
               DATA(12) => a_4_port, DATA(11) => a_3_port, DATA(10) => a_2_port
               , DATA(9) => a_1_port, DATA(8) => a_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(7) => N12, Z(6) => N11, Z(5) => N10, Z(4) => N9, Z(3) => N8, Z(2) =>
               N7, Z(1) => N6, Z(0) => N5 );
   B_0 : GTECH_BUF port map( A => rst, Z => N0);
   B_1 : GTECH_BUF port map( A => N4, Z => N1);
   C75_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 8 )
      port map(
         -- Connections to port 'DATA1'
         DATA(7) => X_Logic0_port, DATA(6) => X_Logic0_port, DATA(5) => 
               X_Logic0_port, DATA(4) => X_Logic0_port, DATA(3) => 
               X_Logic0_port, DATA(2) => X_Logic0_port, DATA(1) => 
               X_Logic0_port, DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(15) => b_7_port, DATA(14) => b_6_port, DATA(13) => b_5_port, 
               DATA(12) => b_4_port, DATA(11) => b_3_port, DATA(10) => b_2_port
               , DATA(9) => b_1_port, DATA(8) => b_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(7) => N20, Z(6) => N19, Z(5) => N18, Z(4) => N17, Z(3) => N16, Z(2) 
               => N15, Z(1) => N14, Z(0) => N13 );
   C76_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(1) => cin_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(0) => N21 );
   C77_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(1) => A0_S1_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(0) => N22 );
   C78_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 8 )
      port map(
         -- Connections to port 'DATA1'
         DATA(7) => N24, DATA(6) => N25, DATA(5) => N26, DATA(4) => N27, 
               DATA(3) => N28, DATA(2) => N29, DATA(1) => N30, DATA(0) => N31, 
         -- Connections to port 'DATA2'
         DATA(15) => b_r_7_port, DATA(14) => b_r_6_port, DATA(13) => b_r_5_port
               , DATA(12) => b_r_4_port, DATA(11) => b_r_3_port, DATA(10) => 
               b_r_2_port, DATA(9) => b_r_1_port, DATA(8) => b_r_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N2, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N3, 
         -- Connections to port 'Z'
         Z(7) => b_mod_7_port, Z(6) => b_mod_6_port, Z(5) => b_mod_5_port, Z(4)
               => b_mod_4_port, Z(3) => b_mod_3_port, Z(2) => b_mod_2_port, 
               Z(1) => b_mod_1_port, Z(0) => b_mod_0_port );
   B_2 : GTECH_BUF port map( A => A0_S1_r, Z => N2);
   B_3 : GTECH_BUF port map( A => N23, Z => N3);
   C79_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => X_Logic1_port, 
         -- Connections to port 'DATA2'
         DATA(1) => cin_r, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N2, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N3, 
         -- Connections to port 'Z'
         Z(0) => c9_0_port );
   C80_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 8 )
      port map(
         -- Connections to port 'DATA1'
         DATA(7) => X_Logic0_port, DATA(6) => X_Logic0_port, DATA(5) => 
               X_Logic0_port, DATA(4) => X_Logic0_port, DATA(3) => 
               X_Logic0_port, DATA(2) => X_Logic0_port, DATA(1) => 
               X_Logic0_port, DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(15) => tmp_7_port, DATA(14) => tmp_6_port, DATA(13) => tmp_5_port
               , DATA(12) => tmp_4_port, DATA(11) => tmp_3_port, DATA(10) => 
               tmp_2_port, DATA(9) => tmp_1_port, DATA(8) => tmp_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(7) => N48, Z(6) => N47, Z(5) => N46, Z(4) => N45, Z(3) => N44, Z(2) 
               => N43, Z(1) => N42, Z(0) => N41 );
   C81_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(1) => tmp_8_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N0, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N1, 
         -- Connections to port 'Z'
         Z(0) => N49 );
         X_Logic1_port <= '1';
         X_Logic0_port <= '0';
   I_0 : GTECH_NOT port map( A => rst, Z => N4);
   I_1 : GTECH_NOT port map( A => A0_S1_r, Z => N23);
   I_2 : GTECH_NOT port map( A => b_r_7_port, Z => N24);
   I_3 : GTECH_NOT port map( A => b_r_6_port, Z => N25);
   I_4 : GTECH_NOT port map( A => b_r_5_port, Z => N26);
   I_5 : GTECH_NOT port map( A => b_r_4_port, Z => N27);
   I_6 : GTECH_NOT port map( A => b_r_3_port, Z => N28);
   I_7 : GTECH_NOT port map( A => b_r_2_port, Z => N29);
   I_8 : GTECH_NOT port map( A => b_r_1_port, Z => N30);
   I_9 : GTECH_NOT port map( A => b_r_0_port, Z => N31);

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
   
      --  Initialize variables
      index := 0;
      
      -- Loop over the values of the control inputs
      for_loop : for i in CONTROL'range loop
      
         if ( CONTROL(i) = '1' ) then
         
            index := i;
            exit for_loop;
            
         end if;
         
      end loop;
      
      -- Store the corresponding data lines into the output
      low := input_width * index;
      high := low + input_width - 1;
      Z <= DATA( high downto low );
   
   end process;
   
end RTL;

library IEEE;

use IEEE.std_logic_1164.all;

entity SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT is
   generic ( ac_as_q, ac_as_qn, sc_ss_q : integer );
   port(
      clear, preset, enable, data_in, synch_clear, synch_preset, synch_toggle, 
         synch_enable, next_state, clocked_on : in std_logic;
      Q, QN : buffer std_logic
   );
end SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT;

architecture RTL of SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT is
begin

   process ( preset, clear, enable, data_in, clocked_on )
   begin
   
            -- Check the value of inputs (asynchronous first)
            if ( ( ( preset /= '1' ) and ( preset /= '0' ) ) or ( ( clear /= 
                     '1' ) and ( clear /= '0' ) )  ) then
               Q <= 'X';
            elsif ( clear = '1' and preset = '1' ) then
               case ac_as_q is
                  when 2 =>
                     Q <= '1';
                  when 1 =>
                     Q <= '0';
                  when others =>
                     Q <= 'X';
               end case;
               case ac_as_qn is
                  when 2 =>
                     QN <= '1';
                  when 1 =>
                     QN <= '0';
                  when others =>
                     QN <= 'X';
               end case;
            elsif ( clear = '1' ) then
               Q <= '0';
            elsif ( preset = '1' ) then
               Q <= '1';
            elsif ( ( enable /= '1' ) and ( enable /= '0' ) ) then
               Q <= 'X';
            elsif ( enable = '1' ) then
               Q <= data_in;
            elsif ( ( clocked_on /= '1' ) and ( clocked_on /= '0' ) ) then
               Q <= 'X';
            elsif ( clocked_on'event and clocked_on = '1' ) then
         if ( ( ( synch_preset /= '1' ) and ( synch_preset /= '0' ) ) or ( ( 
                  synch_clear /= '1' ) and ( synch_clear /= '0' ) )  ) then
            Q <= 'X';
         elsif ( synch_clear = '1' and synch_preset = '1' ) then
            case sc_ss_q is
               when 2 =>
                  Q <= '1';
               when 1 =>
                  Q <= '0';
               when others =>
                  Q <= 'X';
            end case;
         elsif ( synch_clear = '1' ) then
            Q <= '0';
         elsif ( synch_preset = '1' ) then
            Q <= '1';
         elsif ( ( ( synch_toggle /= '1' ) and ( synch_toggle /= '0' ) ) or ( (
                  synch_enable /= '1' ) and ( synch_enable /= '0' ) )  ) then
            Q <= 'X';
         elsif ( synch_enable = '1' and synch_toggle = '1' ) then
            Q <= 'X';
         elsif ( synch_toggle = '1' ) then
            Q <= QN;
         elsif ( synch_enable = '1' ) then
            Q <= next_state;
         end if;
      end if;
   
   end process;

end RTL;
