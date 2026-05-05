
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_regFile is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_regFile;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   
use work.CONV_PACK_adder_sub_8bit.all;

entity regFile is

   port( rst0, clk, wrRegEn : in std_logic;  wrRegNum : in std_logic_vector (4 
         downto 0);  wdata : in std_logic_vector (31 downto 0);  rdRegNum1, 
         rdRegNum2 : in std_logic_vector (4 downto 0);  rdata1, rdata2 : out 
         std_logic_vector (31 downto 0));

end regFile;

architecture SYN_rtl of regFile is

   component GTECH_NOT
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_AND2
      port( A, B : in std_logic;  Z : out std_logic);
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
   
   component GTECH_AND5
      port( A, B, C, D, E : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_AND4
      port( A, B, C, D : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_OR2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
      generic ( ac_as_q, ac_as_qn, sc_ss_q : integer );
      port(
         clear, preset, enable, data_in, synch_clear, synch_preset, 
            synch_toggle, synch_enable, next_state, clocked_on : in std_logic;
         Q, QN : buffer std_logic
      );
   end component;
   
   signal N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
      N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30
      , N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, 
      N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59
      , N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, 
      N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88
      , N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102
      , N103, N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
      N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, 
      N127, N128, N129, N130, N131, N132, N133, N134, N135, N136, N137, N138, 
      N139, N140, N141, N142, N143, N144, N145, N146, N147, N148, N149, N150, 
      N151, N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, 
      N163, N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174, 
      N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, 
      N187, N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198, 
      N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, 
      N211, N212, N213, N214, N215, N216, N217, N218, N219, N220, N221, N222, 
      N223, N224, X_Logic0_port, clk_port, wdata_31_port, wdata_30_port, 
      wdata_29_port, wdata_28_port, wdata_27_port, wdata_26_port, wdata_25_port
      , wdata_24_port, wdata_23_port, wdata_22_port, wdata_21_port, 
      wdata_20_port, wdata_19_port, wdata_18_port, wdata_17_port, wdata_16_port
      , wdata_15_port, wdata_14_port, wdata_13_port, wdata_12_port, 
      wdata_11_port, wdata_10_port, wdata_9_port, wdata_8_port, wdata_7_port, 
      wdata_6_port, wdata_5_port, wdata_4_port, wdata_3_port, wdata_2_port, 
      wdata_1_port, wdata_0_port, rdata1_31_port, rdata1_30_port, 
      rdata1_29_port, rdata1_28_port, rdata1_27_port, rdata1_26_port, 
      rdata1_25_port, rdata1_24_port, rdata1_23_port, rdata1_22_port, 
      rdata1_21_port, rdata1_20_port, rdata1_19_port, rdata1_18_port, 
      rdata1_17_port, rdata1_16_port, rdata1_15_port, rdata1_14_port, 
      rdata1_13_port, rdata1_12_port, rdata1_11_port, rdata1_10_port, 
      rdata1_9_port, rdata1_8_port, rdata1_7_port, rdata1_6_port, rdata1_5_port
      , rdata1_4_port, rdata1_3_port, rdata1_2_port, rdata1_1_port, 
      rdata1_0_port, rdata2_31_port, rdata2_30_port, rdata2_29_port, 
      rdata2_28_port, rdata2_27_port, rdata2_26_port, rdata2_25_port, 
      rdata2_24_port, rdata2_23_port, rdata2_22_port, rdata2_21_port, 
      rdata2_20_port, rdata2_19_port, rdata2_18_port, rdata2_17_port, 
      rdata2_16_port, rdata2_15_port, rdata2_14_port, rdata2_13_port, 
      rdata2_12_port, rdata2_11_port, rdata2_10_port, rdata2_9_port, 
      rdata2_8_port, rdata2_7_port, rdata2_6_port, rdata2_5_port, rdata2_4_port
      , rdata2_3_port, rdata2_2_port, rdata2_1_port, rdata2_0_port, 
      regs_r_1_31_port, regs_r_1_30_port, regs_r_1_29_port, regs_r_1_28_port, 
      regs_r_1_27_port, regs_r_1_26_port, regs_r_1_25_port, regs_r_1_24_port, 
      regs_r_1_23_port, regs_r_1_22_port, regs_r_1_21_port, regs_r_1_20_port, 
      regs_r_1_19_port, regs_r_1_18_port, regs_r_1_17_port, regs_r_1_16_port, 
      regs_r_1_15_port, regs_r_1_14_port, regs_r_1_13_port, regs_r_1_12_port, 
      regs_r_1_11_port, regs_r_1_10_port, regs_r_1_9_port, regs_r_1_8_port, 
      regs_r_1_7_port, regs_r_1_6_port, regs_r_1_5_port, regs_r_1_4_port, 
      regs_r_1_3_port, regs_r_1_2_port, regs_r_1_1_port, regs_r_1_0_port, 
      regs_r_2_31_port, regs_r_2_30_port, regs_r_2_29_port, regs_r_2_28_port, 
      regs_r_2_27_port, regs_r_2_26_port, regs_r_2_25_port, regs_r_2_24_port, 
      regs_r_2_23_port, regs_r_2_22_port, regs_r_2_21_port, regs_r_2_20_port, 
      regs_r_2_19_port, regs_r_2_18_port, regs_r_2_17_port, regs_r_2_16_port, 
      regs_r_2_15_port, regs_r_2_14_port, regs_r_2_13_port, regs_r_2_12_port, 
      regs_r_2_11_port, regs_r_2_10_port, regs_r_2_9_port, regs_r_2_8_port, 
      regs_r_2_7_port, regs_r_2_6_port, regs_r_2_5_port, regs_r_2_4_port, 
      regs_r_2_3_port, regs_r_2_2_port, regs_r_2_1_port, regs_r_2_0_port, 
      regs_r_3_31_port, regs_r_3_30_port, regs_r_3_29_port, regs_r_3_28_port, 
      regs_r_3_27_port, regs_r_3_26_port, regs_r_3_25_port, regs_r_3_24_port, 
      regs_r_3_23_port, regs_r_3_22_port, regs_r_3_21_port, regs_r_3_20_port, 
      regs_r_3_19_port, regs_r_3_18_port, regs_r_3_17_port, regs_r_3_16_port, 
      regs_r_3_15_port, regs_r_3_14_port, regs_r_3_13_port, regs_r_3_12_port, 
      regs_r_3_11_port, regs_r_3_10_port, regs_r_3_9_port, regs_r_3_8_port, 
      regs_r_3_7_port, regs_r_3_6_port, regs_r_3_5_port, regs_r_3_4_port, 
      regs_r_3_3_port, regs_r_3_2_port, regs_r_3_1_port, regs_r_3_0_port, 
      regs_r_4_31_port, regs_r_4_30_port, regs_r_4_29_port, regs_r_4_28_port, 
      regs_r_4_27_port, regs_r_4_26_port, regs_r_4_25_port, regs_r_4_24_port, 
      regs_r_4_23_port, regs_r_4_22_port, regs_r_4_21_port, regs_r_4_20_port, 
      regs_r_4_19_port, regs_r_4_18_port, regs_r_4_17_port, regs_r_4_16_port, 
      regs_r_4_15_port, regs_r_4_14_port, regs_r_4_13_port, regs_r_4_12_port, 
      regs_r_4_11_port, regs_r_4_10_port, regs_r_4_9_port, regs_r_4_8_port, 
      regs_r_4_7_port, regs_r_4_6_port, regs_r_4_5_port, regs_r_4_4_port, 
      regs_r_4_3_port, regs_r_4_2_port, regs_r_4_1_port, regs_r_4_0_port, 
      regs_r_5_31_port, regs_r_5_30_port, regs_r_5_29_port, regs_r_5_28_port, 
      regs_r_5_27_port, regs_r_5_26_port, regs_r_5_25_port, regs_r_5_24_port, 
      regs_r_5_23_port, regs_r_5_22_port, regs_r_5_21_port, regs_r_5_20_port, 
      regs_r_5_19_port, regs_r_5_18_port, regs_r_5_17_port, regs_r_5_16_port, 
      regs_r_5_15_port, regs_r_5_14_port, regs_r_5_13_port, regs_r_5_12_port, 
      regs_r_5_11_port, regs_r_5_10_port, regs_r_5_9_port, regs_r_5_8_port, 
      regs_r_5_7_port, regs_r_5_6_port, regs_r_5_5_port, regs_r_5_4_port, 
      regs_r_5_3_port, regs_r_5_2_port, regs_r_5_1_port, regs_r_5_0_port, 
      regs_r_6_31_port, regs_r_6_30_port, regs_r_6_29_port, regs_r_6_28_port, 
      regs_r_6_27_port, regs_r_6_26_port, regs_r_6_25_port, regs_r_6_24_port, 
      regs_r_6_23_port, regs_r_6_22_port, regs_r_6_21_port, regs_r_6_20_port, 
      regs_r_6_19_port, regs_r_6_18_port, regs_r_6_17_port, regs_r_6_16_port, 
      regs_r_6_15_port, regs_r_6_14_port, regs_r_6_13_port, regs_r_6_12_port, 
      regs_r_6_11_port, regs_r_6_10_port, regs_r_6_9_port, regs_r_6_8_port, 
      regs_r_6_7_port, regs_r_6_6_port, regs_r_6_5_port, regs_r_6_4_port, 
      regs_r_6_3_port, regs_r_6_2_port, regs_r_6_1_port, regs_r_6_0_port, 
      regs_r_7_31_port, regs_r_7_30_port, regs_r_7_29_port, regs_r_7_28_port, 
      regs_r_7_27_port, regs_r_7_26_port, regs_r_7_25_port, regs_r_7_24_port, 
      regs_r_7_23_port, regs_r_7_22_port, regs_r_7_21_port, regs_r_7_20_port, 
      regs_r_7_19_port, regs_r_7_18_port, regs_r_7_17_port, regs_r_7_16_port, 
      regs_r_7_15_port, regs_r_7_14_port, regs_r_7_13_port, regs_r_7_12_port, 
      regs_r_7_11_port, regs_r_7_10_port, regs_r_7_9_port, regs_r_7_8_port, 
      regs_r_7_7_port, regs_r_7_6_port, regs_r_7_5_port, regs_r_7_4_port, 
      regs_r_7_3_port, regs_r_7_2_port, regs_r_7_1_port, regs_r_7_0_port, 
      regs_r_8_31_port, regs_r_8_30_port, regs_r_8_29_port, regs_r_8_28_port, 
      regs_r_8_27_port, regs_r_8_26_port, regs_r_8_25_port, regs_r_8_24_port, 
      regs_r_8_23_port, regs_r_8_22_port, regs_r_8_21_port, regs_r_8_20_port, 
      regs_r_8_19_port, regs_r_8_18_port, regs_r_8_17_port, regs_r_8_16_port, 
      regs_r_8_15_port, regs_r_8_14_port, regs_r_8_13_port, regs_r_8_12_port, 
      regs_r_8_11_port, regs_r_8_10_port, regs_r_8_9_port, regs_r_8_8_port, 
      regs_r_8_7_port, regs_r_8_6_port, regs_r_8_5_port, regs_r_8_4_port, 
      regs_r_8_3_port, regs_r_8_2_port, regs_r_8_1_port, regs_r_8_0_port, 
      regs_r_9_31_port, regs_r_9_30_port, regs_r_9_29_port, regs_r_9_28_port, 
      regs_r_9_27_port, regs_r_9_26_port, regs_r_9_25_port, regs_r_9_24_port, 
      regs_r_9_23_port, regs_r_9_22_port, regs_r_9_21_port, regs_r_9_20_port, 
      regs_r_9_19_port, regs_r_9_18_port, regs_r_9_17_port, regs_r_9_16_port, 
      regs_r_9_15_port, regs_r_9_14_port, regs_r_9_13_port, regs_r_9_12_port, 
      regs_r_9_11_port, regs_r_9_10_port, regs_r_9_9_port, regs_r_9_8_port, 
      regs_r_9_7_port, regs_r_9_6_port, regs_r_9_5_port, regs_r_9_4_port, 
      regs_r_9_3_port, regs_r_9_2_port, regs_r_9_1_port, regs_r_9_0_port, 
      regs_r_10_31_port, regs_r_10_30_port, regs_r_10_29_port, 
      regs_r_10_28_port, regs_r_10_27_port, regs_r_10_26_port, 
      regs_r_10_25_port, regs_r_10_24_port, regs_r_10_23_port, 
      regs_r_10_22_port, regs_r_10_21_port, regs_r_10_20_port, 
      regs_r_10_19_port, regs_r_10_18_port, regs_r_10_17_port, 
      regs_r_10_16_port, regs_r_10_15_port, regs_r_10_14_port, 
      regs_r_10_13_port, regs_r_10_12_port, regs_r_10_11_port, 
      regs_r_10_10_port, regs_r_10_9_port, regs_r_10_8_port, regs_r_10_7_port, 
      regs_r_10_6_port, regs_r_10_5_port, regs_r_10_4_port, regs_r_10_3_port, 
      regs_r_10_2_port, regs_r_10_1_port, regs_r_10_0_port, regs_r_11_31_port, 
      regs_r_11_30_port, regs_r_11_29_port, regs_r_11_28_port, 
      regs_r_11_27_port, regs_r_11_26_port, regs_r_11_25_port, 
      regs_r_11_24_port, regs_r_11_23_port, regs_r_11_22_port, 
      regs_r_11_21_port, regs_r_11_20_port, regs_r_11_19_port, 
      regs_r_11_18_port, regs_r_11_17_port, regs_r_11_16_port, 
      regs_r_11_15_port, regs_r_11_14_port, regs_r_11_13_port, 
      regs_r_11_12_port, regs_r_11_11_port, regs_r_11_10_port, regs_r_11_9_port
      , regs_r_11_8_port, regs_r_11_7_port, regs_r_11_6_port, regs_r_11_5_port,
      regs_r_11_4_port, regs_r_11_3_port, regs_r_11_2_port, regs_r_11_1_port, 
      regs_r_11_0_port, regs_r_12_31_port, regs_r_12_30_port, regs_r_12_29_port
      , regs_r_12_28_port, regs_r_12_27_port, regs_r_12_26_port, 
      regs_r_12_25_port, regs_r_12_24_port, regs_r_12_23_port, 
      regs_r_12_22_port, regs_r_12_21_port, regs_r_12_20_port, 
      regs_r_12_19_port, regs_r_12_18_port, regs_r_12_17_port, 
      regs_r_12_16_port, regs_r_12_15_port, regs_r_12_14_port, 
      regs_r_12_13_port, regs_r_12_12_port, regs_r_12_11_port, 
      regs_r_12_10_port, regs_r_12_9_port, regs_r_12_8_port, regs_r_12_7_port, 
      regs_r_12_6_port, regs_r_12_5_port, regs_r_12_4_port, regs_r_12_3_port, 
      regs_r_12_2_port, regs_r_12_1_port, regs_r_12_0_port, regs_r_13_31_port, 
      regs_r_13_30_port, regs_r_13_29_port, regs_r_13_28_port, 
      regs_r_13_27_port, regs_r_13_26_port, regs_r_13_25_port, 
      regs_r_13_24_port, regs_r_13_23_port, regs_r_13_22_port, 
      regs_r_13_21_port, regs_r_13_20_port, regs_r_13_19_port, 
      regs_r_13_18_port, regs_r_13_17_port, regs_r_13_16_port, 
      regs_r_13_15_port, regs_r_13_14_port, regs_r_13_13_port, 
      regs_r_13_12_port, regs_r_13_11_port, regs_r_13_10_port, regs_r_13_9_port
      , regs_r_13_8_port, regs_r_13_7_port, regs_r_13_6_port, regs_r_13_5_port,
      regs_r_13_4_port, regs_r_13_3_port, regs_r_13_2_port, regs_r_13_1_port, 
      regs_r_13_0_port, regs_r_14_31_port, regs_r_14_30_port, regs_r_14_29_port
      , regs_r_14_28_port, regs_r_14_27_port, regs_r_14_26_port, 
      regs_r_14_25_port, regs_r_14_24_port, regs_r_14_23_port, 
      regs_r_14_22_port, regs_r_14_21_port, regs_r_14_20_port, 
      regs_r_14_19_port, regs_r_14_18_port, regs_r_14_17_port, 
      regs_r_14_16_port, regs_r_14_15_port, regs_r_14_14_port, 
      regs_r_14_13_port, regs_r_14_12_port, regs_r_14_11_port, 
      regs_r_14_10_port, regs_r_14_9_port, regs_r_14_8_port, regs_r_14_7_port, 
      regs_r_14_6_port, regs_r_14_5_port, regs_r_14_4_port, regs_r_14_3_port, 
      regs_r_14_2_port, regs_r_14_1_port, regs_r_14_0_port, regs_r_15_31_port, 
      regs_r_15_30_port, regs_r_15_29_port, regs_r_15_28_port, 
      regs_r_15_27_port, regs_r_15_26_port, regs_r_15_25_port, 
      regs_r_15_24_port, regs_r_15_23_port, regs_r_15_22_port, 
      regs_r_15_21_port, regs_r_15_20_port, regs_r_15_19_port, 
      regs_r_15_18_port, regs_r_15_17_port, regs_r_15_16_port, 
      regs_r_15_15_port, regs_r_15_14_port, regs_r_15_13_port, 
      regs_r_15_12_port, regs_r_15_11_port, regs_r_15_10_port, regs_r_15_9_port
      , regs_r_15_8_port, regs_r_15_7_port, regs_r_15_6_port, regs_r_15_5_port,
      regs_r_15_4_port, regs_r_15_3_port, regs_r_15_2_port, regs_r_15_1_port, 
      regs_r_15_0_port, regs_r_16_31_port, regs_r_16_30_port, regs_r_16_29_port
      , regs_r_16_28_port, regs_r_16_27_port, regs_r_16_26_port, 
      regs_r_16_25_port, regs_r_16_24_port, regs_r_16_23_port, 
      regs_r_16_22_port, regs_r_16_21_port, regs_r_16_20_port, 
      regs_r_16_19_port, regs_r_16_18_port, regs_r_16_17_port, 
      regs_r_16_16_port, regs_r_16_15_port, regs_r_16_14_port, 
      regs_r_16_13_port, regs_r_16_12_port, regs_r_16_11_port, 
      regs_r_16_10_port, regs_r_16_9_port, regs_r_16_8_port, regs_r_16_7_port, 
      regs_r_16_6_port, regs_r_16_5_port, regs_r_16_4_port, regs_r_16_3_port, 
      regs_r_16_2_port, regs_r_16_1_port, regs_r_16_0_port, regs_r_17_31_port, 
      regs_r_17_30_port, regs_r_17_29_port, regs_r_17_28_port, 
      regs_r_17_27_port, regs_r_17_26_port, regs_r_17_25_port, 
      regs_r_17_24_port, regs_r_17_23_port, regs_r_17_22_port, 
      regs_r_17_21_port, regs_r_17_20_port, regs_r_17_19_port, 
      regs_r_17_18_port, regs_r_17_17_port, regs_r_17_16_port, 
      regs_r_17_15_port, regs_r_17_14_port, regs_r_17_13_port, 
      regs_r_17_12_port, regs_r_17_11_port, regs_r_17_10_port, regs_r_17_9_port
      , regs_r_17_8_port, regs_r_17_7_port, regs_r_17_6_port, regs_r_17_5_port,
      regs_r_17_4_port, regs_r_17_3_port, regs_r_17_2_port, regs_r_17_1_port, 
      regs_r_17_0_port, regs_r_18_31_port, regs_r_18_30_port, regs_r_18_29_port
      , regs_r_18_28_port, regs_r_18_27_port, regs_r_18_26_port, 
      regs_r_18_25_port, regs_r_18_24_port, regs_r_18_23_port, 
      regs_r_18_22_port, regs_r_18_21_port, regs_r_18_20_port, 
      regs_r_18_19_port, regs_r_18_18_port, regs_r_18_17_port, 
      regs_r_18_16_port, regs_r_18_15_port, regs_r_18_14_port, 
      regs_r_18_13_port, regs_r_18_12_port, regs_r_18_11_port, 
      regs_r_18_10_port, regs_r_18_9_port, regs_r_18_8_port, regs_r_18_7_port, 
      regs_r_18_6_port, regs_r_18_5_port, regs_r_18_4_port, regs_r_18_3_port, 
      regs_r_18_2_port, regs_r_18_1_port, regs_r_18_0_port, regs_r_19_31_port, 
      regs_r_19_30_port, regs_r_19_29_port, regs_r_19_28_port, 
      regs_r_19_27_port, regs_r_19_26_port, regs_r_19_25_port, 
      regs_r_19_24_port, regs_r_19_23_port, regs_r_19_22_port, 
      regs_r_19_21_port, regs_r_19_20_port, regs_r_19_19_port, 
      regs_r_19_18_port, regs_r_19_17_port, regs_r_19_16_port, 
      regs_r_19_15_port, regs_r_19_14_port, regs_r_19_13_port, 
      regs_r_19_12_port, regs_r_19_11_port, regs_r_19_10_port, regs_r_19_9_port
      , regs_r_19_8_port, regs_r_19_7_port, regs_r_19_6_port, regs_r_19_5_port,
      regs_r_19_4_port, regs_r_19_3_port, regs_r_19_2_port, regs_r_19_1_port, 
      regs_r_19_0_port, regs_r_20_31_port, regs_r_20_30_port, regs_r_20_29_port
      , regs_r_20_28_port, regs_r_20_27_port, regs_r_20_26_port, 
      regs_r_20_25_port, regs_r_20_24_port, regs_r_20_23_port, 
      regs_r_20_22_port, regs_r_20_21_port, regs_r_20_20_port, 
      regs_r_20_19_port, regs_r_20_18_port, regs_r_20_17_port, 
      regs_r_20_16_port, regs_r_20_15_port, regs_r_20_14_port, 
      regs_r_20_13_port, regs_r_20_12_port, regs_r_20_11_port, 
      regs_r_20_10_port, regs_r_20_9_port, regs_r_20_8_port, regs_r_20_7_port, 
      regs_r_20_6_port, regs_r_20_5_port, regs_r_20_4_port, regs_r_20_3_port, 
      regs_r_20_2_port, regs_r_20_1_port, regs_r_20_0_port, regs_r_21_31_port, 
      regs_r_21_30_port, regs_r_21_29_port, regs_r_21_28_port, 
      regs_r_21_27_port, regs_r_21_26_port, regs_r_21_25_port, 
      regs_r_21_24_port, regs_r_21_23_port, regs_r_21_22_port, 
      regs_r_21_21_port, regs_r_21_20_port, regs_r_21_19_port, 
      regs_r_21_18_port, regs_r_21_17_port, regs_r_21_16_port, 
      regs_r_21_15_port, regs_r_21_14_port, regs_r_21_13_port, 
      regs_r_21_12_port, regs_r_21_11_port, regs_r_21_10_port, regs_r_21_9_port
      , regs_r_21_8_port, regs_r_21_7_port, regs_r_21_6_port, regs_r_21_5_port,
      regs_r_21_4_port, regs_r_21_3_port, regs_r_21_2_port, regs_r_21_1_port, 
      regs_r_21_0_port, regs_r_22_31_port, regs_r_22_30_port, regs_r_22_29_port
      , regs_r_22_28_port, regs_r_22_27_port, regs_r_22_26_port, 
      regs_r_22_25_port, regs_r_22_24_port, regs_r_22_23_port, 
      regs_r_22_22_port, regs_r_22_21_port, regs_r_22_20_port, 
      regs_r_22_19_port, regs_r_22_18_port, regs_r_22_17_port, 
      regs_r_22_16_port, regs_r_22_15_port, regs_r_22_14_port, 
      regs_r_22_13_port, regs_r_22_12_port, regs_r_22_11_port, 
      regs_r_22_10_port, regs_r_22_9_port, regs_r_22_8_port, regs_r_22_7_port, 
      regs_r_22_6_port, regs_r_22_5_port, regs_r_22_4_port, regs_r_22_3_port, 
      regs_r_22_2_port, regs_r_22_1_port, regs_r_22_0_port, regs_r_23_31_port, 
      regs_r_23_30_port, regs_r_23_29_port, regs_r_23_28_port, 
      regs_r_23_27_port, regs_r_23_26_port, regs_r_23_25_port, 
      regs_r_23_24_port, regs_r_23_23_port, regs_r_23_22_port, 
      regs_r_23_21_port, regs_r_23_20_port, regs_r_23_19_port, 
      regs_r_23_18_port, regs_r_23_17_port, regs_r_23_16_port, 
      regs_r_23_15_port, regs_r_23_14_port, regs_r_23_13_port, 
      regs_r_23_12_port, regs_r_23_11_port, regs_r_23_10_port, regs_r_23_9_port
      , regs_r_23_8_port, regs_r_23_7_port, regs_r_23_6_port, regs_r_23_5_port,
      regs_r_23_4_port, regs_r_23_3_port, regs_r_23_2_port, regs_r_23_1_port, 
      regs_r_23_0_port, regs_r_24_31_port, regs_r_24_30_port, regs_r_24_29_port
      , regs_r_24_28_port, regs_r_24_27_port, regs_r_24_26_port, 
      regs_r_24_25_port, regs_r_24_24_port, regs_r_24_23_port, 
      regs_r_24_22_port, regs_r_24_21_port, regs_r_24_20_port, 
      regs_r_24_19_port, regs_r_24_18_port, regs_r_24_17_port, 
      regs_r_24_16_port, regs_r_24_15_port, regs_r_24_14_port, 
      regs_r_24_13_port, regs_r_24_12_port, regs_r_24_11_port, 
      regs_r_24_10_port, regs_r_24_9_port, regs_r_24_8_port, regs_r_24_7_port, 
      regs_r_24_6_port, regs_r_24_5_port, regs_r_24_4_port, regs_r_24_3_port, 
      regs_r_24_2_port, regs_r_24_1_port, regs_r_24_0_port, regs_r_25_31_port, 
      regs_r_25_30_port, regs_r_25_29_port, regs_r_25_28_port, 
      regs_r_25_27_port, regs_r_25_26_port, regs_r_25_25_port, 
      regs_r_25_24_port, regs_r_25_23_port, regs_r_25_22_port, 
      regs_r_25_21_port, regs_r_25_20_port, regs_r_25_19_port, 
      regs_r_25_18_port, regs_r_25_17_port, regs_r_25_16_port, 
      regs_r_25_15_port, regs_r_25_14_port, regs_r_25_13_port, 
      regs_r_25_12_port, regs_r_25_11_port, regs_r_25_10_port, regs_r_25_9_port
      , regs_r_25_8_port, regs_r_25_7_port, regs_r_25_6_port, regs_r_25_5_port,
      regs_r_25_4_port, regs_r_25_3_port, regs_r_25_2_port, regs_r_25_1_port, 
      regs_r_25_0_port, regs_r_26_31_port, regs_r_26_30_port, regs_r_26_29_port
      , regs_r_26_28_port, regs_r_26_27_port, regs_r_26_26_port, 
      regs_r_26_25_port, regs_r_26_24_port, regs_r_26_23_port, 
      regs_r_26_22_port, regs_r_26_21_port, regs_r_26_20_port, 
      regs_r_26_19_port, regs_r_26_18_port, regs_r_26_17_port, 
      regs_r_26_16_port, regs_r_26_15_port, regs_r_26_14_port, 
      regs_r_26_13_port, regs_r_26_12_port, regs_r_26_11_port, 
      regs_r_26_10_port, regs_r_26_9_port, regs_r_26_8_port, regs_r_26_7_port, 
      regs_r_26_6_port, regs_r_26_5_port, regs_r_26_4_port, regs_r_26_3_port, 
      regs_r_26_2_port, regs_r_26_1_port, regs_r_26_0_port, regs_r_27_31_port, 
      regs_r_27_30_port, regs_r_27_29_port, regs_r_27_28_port, 
      regs_r_27_27_port, regs_r_27_26_port, regs_r_27_25_port, 
      regs_r_27_24_port, regs_r_27_23_port, regs_r_27_22_port, 
      regs_r_27_21_port, regs_r_27_20_port, regs_r_27_19_port, 
      regs_r_27_18_port, regs_r_27_17_port, regs_r_27_16_port, 
      regs_r_27_15_port, regs_r_27_14_port, regs_r_27_13_port, 
      regs_r_27_12_port, regs_r_27_11_port, regs_r_27_10_port, regs_r_27_9_port
      , regs_r_27_8_port, regs_r_27_7_port, regs_r_27_6_port, regs_r_27_5_port,
      regs_r_27_4_port, regs_r_27_3_port, regs_r_27_2_port, regs_r_27_1_port, 
      regs_r_27_0_port, regs_r_28_31_port, regs_r_28_30_port, regs_r_28_29_port
      , regs_r_28_28_port, regs_r_28_27_port, regs_r_28_26_port, 
      regs_r_28_25_port, regs_r_28_24_port, regs_r_28_23_port, 
      regs_r_28_22_port, regs_r_28_21_port, regs_r_28_20_port, 
      regs_r_28_19_port, regs_r_28_18_port, regs_r_28_17_port, 
      regs_r_28_16_port, regs_r_28_15_port, regs_r_28_14_port, 
      regs_r_28_13_port, regs_r_28_12_port, regs_r_28_11_port, 
      regs_r_28_10_port, regs_r_28_9_port, regs_r_28_8_port, regs_r_28_7_port, 
      regs_r_28_6_port, regs_r_28_5_port, regs_r_28_4_port, regs_r_28_3_port, 
      regs_r_28_2_port, regs_r_28_1_port, regs_r_28_0_port, regs_r_29_31_port, 
      regs_r_29_30_port, regs_r_29_29_port, regs_r_29_28_port, 
      regs_r_29_27_port, regs_r_29_26_port, regs_r_29_25_port, 
      regs_r_29_24_port, regs_r_29_23_port, regs_r_29_22_port, 
      regs_r_29_21_port, regs_r_29_20_port, regs_r_29_19_port, 
      regs_r_29_18_port, regs_r_29_17_port, regs_r_29_16_port, 
      regs_r_29_15_port, regs_r_29_14_port, regs_r_29_13_port, 
      regs_r_29_12_port, regs_r_29_11_port, regs_r_29_10_port, regs_r_29_9_port
      , regs_r_29_8_port, regs_r_29_7_port, regs_r_29_6_port, regs_r_29_5_port,
      regs_r_29_4_port, regs_r_29_3_port, regs_r_29_2_port, regs_r_29_1_port, 
      regs_r_29_0_port, regs_r_30_31_port, regs_r_30_30_port, regs_r_30_29_port
      , regs_r_30_28_port, regs_r_30_27_port, regs_r_30_26_port, 
      regs_r_30_25_port, regs_r_30_24_port, regs_r_30_23_port, 
      regs_r_30_22_port, regs_r_30_21_port, regs_r_30_20_port, 
      regs_r_30_19_port, regs_r_30_18_port, regs_r_30_17_port, 
      regs_r_30_16_port, regs_r_30_15_port, regs_r_30_14_port, 
      regs_r_30_13_port, regs_r_30_12_port, regs_r_30_11_port, 
      regs_r_30_10_port, regs_r_30_9_port, regs_r_30_8_port, regs_r_30_7_port, 
      regs_r_30_6_port, regs_r_30_5_port, regs_r_30_4_port, regs_r_30_3_port, 
      regs_r_30_2_port, regs_r_30_1_port, regs_r_30_0_port, regs_r_31_31_port, 
      regs_r_31_30_port, regs_r_31_29_port, regs_r_31_28_port, 
      regs_r_31_27_port, regs_r_31_26_port, regs_r_31_25_port, 
      regs_r_31_24_port, regs_r_31_23_port, regs_r_31_22_port, 
      regs_r_31_21_port, regs_r_31_20_port, regs_r_31_19_port, 
      regs_r_31_18_port, regs_r_31_17_port, regs_r_31_16_port, 
      regs_r_31_15_port, regs_r_31_14_port, regs_r_31_13_port, 
      regs_r_31_12_port, regs_r_31_11_port, regs_r_31_10_port, regs_r_31_9_port
      , regs_r_31_8_port, regs_r_31_7_port, regs_r_31_6_port, regs_r_31_5_port,
      regs_r_31_4_port, regs_r_31_3_port, regs_r_31_2_port, regs_r_31_1_port, 
      regs_r_31_0_port, N225, N226, N227, N228, N229, N230, N231, N232, N233, 
      N234, N235, N236, N237, N238, N239, N240, N241, N242, N243, N244, N245, 
      N246, N247, N248, N249, N250, N251, N252, N253, N254, N255, N256, N257, 
      N258, N259, N260, N261, N262, N263, N264, N265, N266, N267, N268, N269, 
      N270, N271, N272, N273, N274, N275, N276, N277, N278, N279, N280, N281, 
      N282, N283, N284, N285, N286, N287, N288, N289, N290, N291, N292, N293, 
      N294, N295, N296, N297, N298, N299, N300, N301, N302, N303, N304, N305, 
      N306, N307, N308, N309, N310, N311, N312, N313, N314, N315, N316, N317, 
      N318, N319, N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, 
      N330, N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341, 
      N342, N343, N344, N345, N346, N347, N348, N349, N350, N351, N352, N353, 
      N354, N355, N356, N357, N358, N359, N360, N361, N362, N363, N364, N365, 
      N366, N367, N368, N369, N370, N371, N372, N373, N374, N375, N376, N377, 
      N378, N379, N380, N381, N382, N383, N384, N385, N386, N387, N388, N389, 
      N390, N391, N392, N393, N394, N395, N396, N397, N398, N399, N400, N401, 
      N402, N403, N404, N405, N406, N407, N408, N409, N410, N411, N412, N413, 
      N414, N415, N416, N417, N418, N419, N420, N421, N422, N423, N424, N425, 
      N426, N427, N428, N429, N430, N431, N432, N433, N434, N435, N436, N437, 
      N438, N439, N440, N441, N442, N443, N444, N445, N446, N447, N448, N449, 
      N450, N451, N452, N453, N454, N455, N456, N457, N458, N459, N460, N461, 
      N462, N463, N464, N465, N466, N467, N468, N469, N470, N471, N472, N473, 
      N474, N475, N476, N477, N478, N479, N480, N481, N482, N483, N484, N485, 
      N486, N487, N488, N489, N490, N491, N492, N493, N494, N495, N496, N497, 
      N498, N499, N500, N501, N502, N503, N504, N505, N506, N507, N508, N509, 
      N510, N511, N512, N513, N514, N515, N516, N517, N518, N519, N520, N521, 
      N522, N523, N524, N525, N526, N527, N528, N529, N530, N531, N532, N533, 
      N534, N535, N536, N537, N538, N539, N540, N541, N542, N543, N544, N545, 
      N546, N547, N548, N549, N550, N551, N552, N553, N554, N555, N556, N557, 
      N558, N559, N560, N561, N562, N563, N564, N565, N566, N567, N568, N569, 
      N570, N571, N572, N573, N574, N575, N576, N577, N578, N579, N580, N581, 
      N582, N583, N584, N585, N586, N587, N588, N589, N590, N591, N592, N593, 
      N594, N595, N596, N597, N598, N599, N600, N601, N602, N603, N604, N605, 
      N606, N607, N608, N609, N610, N611, N612, N613, N614, N615, N616, N617, 
      N618, N619, N620, N621, N622, N623, N624, N625, N626, N627, N628, N629, 
      N630, N631, N632, N633, N634, N635, N636, N637, N638, N639, N640, N641, 
      N642, N643, N644, N645, N646, N647, N648, N649, N650, N651, N652, N653, 
      N654, N655, N656, N657, N658, N659, N660, N661, N662, N663, N664, N665, 
      N666, N667, N668, N669, N670, N671, N672, N673, N674, N675, N676, N677, 
      N678, N679, N680, N681, N682, N683, N684, N685, N686, N687, N688, N689, 
      N690, N691, N692, N693, N694, N695, N696, N697, N698, N699, N700, N701, 
      N702, N703, N704, N705, N706, N707, N708, N709, N710, N711, N712, N713, 
      N714, N715, N716, N717, N718, N719, N720, N721, N722, N723, N724, N725, 
      N726, N727, N728, N729, N730, N731, N732, N733, N734, N735, N736, N737, 
      N738, N739, N740, N741, N742, N743, N744, N745, N746, N747, N748, N749, 
      N750, N751, N752, N753, N754, N755, N756, N757, N758, N759, N760, N761, 
      N762, N763, N764, N765, N766, N767, N768, N769, N770, N771, N772, N773, 
      N774, N775, N776, N777, N778, N779, N780, N781, N782, N783, N784, N785, 
      N786, N787, N788, N789, N790, N791, N792, N793, N794, N795, N796, N797, 
      N798, N799, N800, N801, N802, N803, N804, N805, N806, N807, N808, N809, 
      N810, N811, N812, N813, N814, N815, N816, N817, N818, N819, N820, N821, 
      N822, N823, N824, N825, N826, N827, N828, N829, N830, N831, N832, N833, 
      N834, N835, N836, N837, N838, N839, N840, N841, N842, N843, N844, N845, 
      N846, N847, N848, N849, N850, N851, N852, N853, N854, N855, N856, N857, 
      N858, N859, N860, N861, N862, N863, N864, N865, N866, N867, N868, N869, 
      N870, N871, N872, N873, N874, N875, N876, N877, N878, N879, N880, N881, 
      N882, N883, N884, N885, N886, N887, N888, N889, N890, N891, N892, N893, 
      N894, N895, N896, N897, N898, N899, N900, N901, N902, N903, N904, N905, 
      N906, N907, N908, N909, N910, N911, N912, N913, N914, N915, N916, N917, 
      N918, N919, N920, N921, N922, N923, N924, N925, N926, N927, N928, N929, 
      N930, N931, N932, N933, N934, N935, N936, N937, N938, N939, N940, N941, 
      N942, N943, N944, N945, N946, N947, N948, N949, N950, N951, N952, N953, 
      N954, N955, N956, N957, N958, N959, N960, N961, N962, N963, N964, N965, 
      N966, N967, N968, N969, N970, N971, N972, N973, N974, N975, N976, N977, 
      N978, N979, N980, N981, N982, N983, N984, N985, N986, N987, N988, N989, 
      N990, N991, N992, N993, N994, N995, N996, N997, N998, N999, N1000, N1001,
      N1002, N1003, N1004, N1005, N1006, N1007, N1008, N1009, N1010, N1011, 
      N1012, N1013, N1014, N1015, N1016, N1017, N1018, N1019, N1020, N1021, 
      N1022, N1023, N1024, N1025, N1026, N1027, N1028, N1029, N1030, N1031, 
      N1032, N1033, N1034, N1035, N1036, N1037, N1038, N1039, N1040, N1041, 
      N1042, N1043, N1044, N1045, N1046, N1047, N1048, N1049, N1050, N1051, 
      N1052, N1053, N1054, N1055, N1056, N1057, N1058, N1059, N1060, N1061, 
      N1062, N1063, N1064, N1065, N1066, N1067, N1068, N1069, N1070, N1071, 
      N1072, N1073, N1074, N1075, N1076, N1077, N1078, N1079, N1080, N1081, 
      N1082, N1083, N1084, N1085, N1086, N1087, N1088, N1089, N1090, N1091, 
      N1092, N1093, N1094, N1095, N1096, N1097, N1098, N1099, N1100, N1101, 
      N1102, N1103, N1104, N1105, N1106, N1107, N1108, N1109, N1110, N1111, 
      N1112, N1113, N1114, N1115, N1116, N1117, N1118, N1119, N1120, N1121, 
      N1122, N1123, N1124, N1125, N1126, N1127, N1128, N1129, N1130, N1131, 
      N1132, N1133, N1134, N1135, N1136, N1137, N1138, N1139, N1140, N1141, 
      N1142, N1143, N1144, N1145, N1146, N1147, N1148, N1149, N1150, N1151, 
      N1152, N1153, N1154, N1155, N1156, N1157, N1158, N1159, N1160, N1161, 
      N1162, N1163, N1164, N1165, N1166, N1167, N1168, N1169, N1170, N1171, 
      N1172, N1173, N1174, N1175, N1176, N1177, N1178, N1179, N1180, N1181, 
      N1182, N1183, N1184, N1185, N1186, N1187, N1188, N1189, N1190, N1191, 
      N1192, N1193, N1194, N1195, N1196, N1197, N1198, N1199, N1200, N1201, 
      N1202, N1203, N1204, N1205, N1206, N1207, N1208, N1209, N1210, N1211, 
      N1212, N1213, N1214, N1215, N1216, N1217, N1218, N1219, N1220, N1221, 
      N1222, N1223, N1224, N1225, N1226, N1227, N1228, N1229, N1230, N1231, 
      N1232, N1233, N1234, N1235, N1236, N1237, N1238, N1239, N1240, N1241, 
      N1242, N1243, N1244, N1245, N1246, N1247, N1248, N1249, N1250, N1251, 
      N1252, N1253, N1254, N1255, N1256, N1257, N1258, N1259, N1260, N1261, 
      N1262, N1263, N1264, N1265, N1266, N1267, N1268, N1269, N1270, N1271, 
      N1272, N1273, N1274, N1275, N1276, N1277, N1278, N1279, N1280, N1281, 
      N1282, N1283, N1284, N1285, N1286, N1287, N1288, N1289, N1290, N1291, 
      N1292, N1293, N1294, N1295, N1296, N1297, N1298, N1299, N1300, N1301, 
      N1302, N1303, N1304, N1305, N1306, N1307, N1308, N1309, N1310, N1311, 
      N1312, N1313, N1314, N1315, N1316, N1317, N1318, N1319, N1320, N1321, 
      N1322, N1323, N1324, N1325, N1326, N1327, N1328, N1329, N1330, N1331, 
      N1332, N1333, N1334, N1335, N1336, N1337, N1338, N1339, N1340, N1341, 
      N1342, N1343, N1344, N1345, N1346, N1347, N1348, N1349, N1350, N1351, 
      N1352, N1353, N1354, N1355, N1356, N1357, N1358, N1359, N1360, N1361, 
      N1362, N1363, N1364, N1365, N1366, N1367, N1368, N1369, N1370, N1371, 
      N1372, N1373, N1374, N1375, N1376, N1377, N1378, N1379, N1380, N1381, 
      N1382, N1383, N1384, N1385, N1386, N1387, N1388, N1389, N1390, N1391, 
      N1392, N1393, N1394, N1395, N1396, N1397, N1398, N1399, N1400, N1401, 
      N1402, N1403, N1404, N1405, N1406, N1407, n_1000, n_1001, n_1002, n_1003,
      n_1004, n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, 
      n_1013, n_1014, n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, n_1021, 
      n_1022, n_1023, n_1024, n_1025, n_1026, n_1027, n_1028, n_1029, n_1030, 
      n_1031, n_1032, n_1033, n_1034, n_1035, n_1036, n_1037, n_1038, n_1039, 
      n_1040, n_1041, n_1042, n_1043, n_1044, n_1045, n_1046, n_1047, n_1048, 
      n_1049, n_1050, n_1051, n_1052, n_1053, n_1054, n_1055, n_1056, n_1057, 
      n_1058, n_1059, n_1060, n_1061, n_1062, n_1063, n_1064, n_1065, n_1066, 
      n_1067, n_1068, n_1069, n_1070, n_1071, n_1072, n_1073, n_1074, n_1075, 
      n_1076, n_1077, n_1078, n_1079, n_1080, n_1081, n_1082, n_1083, n_1084, 
      n_1085, n_1086, n_1087, n_1088, n_1089, n_1090, n_1091, n_1092, n_1093, 
      n_1094, n_1095, n_1096, n_1097, n_1098, n_1099, n_1100, n_1101, n_1102, 
      n_1103, n_1104, n_1105, n_1106, n_1107, n_1108, n_1109, n_1110, n_1111, 
      n_1112, n_1113, n_1114, n_1115, n_1116, n_1117, n_1118, n_1119, n_1120, 
      n_1121, n_1122, n_1123, n_1124, n_1125, n_1126, n_1127, n_1128, n_1129, 
      n_1130, n_1131, n_1132, n_1133, n_1134, n_1135, n_1136, n_1137, n_1138, 
      n_1139, n_1140, n_1141, n_1142, n_1143, n_1144, n_1145, n_1146, n_1147, 
      n_1148, n_1149, n_1150, n_1151, n_1152, n_1153, n_1154, n_1155, n_1156, 
      n_1157, n_1158, n_1159, n_1160, n_1161, n_1162, n_1163, n_1164, n_1165, 
      n_1166, n_1167, n_1168, n_1169, n_1170, n_1171, n_1172, n_1173, n_1174, 
      n_1175, n_1176, n_1177, n_1178, n_1179, n_1180, n_1181, n_1182, n_1183, 
      n_1184, n_1185, n_1186, n_1187, n_1188, n_1189, n_1190, n_1191, n_1192, 
      n_1193, n_1194, n_1195, n_1196, n_1197, n_1198, n_1199, n_1200, n_1201, 
      n_1202, n_1203, n_1204, n_1205, n_1206, n_1207, n_1208, n_1209, n_1210, 
      n_1211, n_1212, n_1213, n_1214, n_1215, n_1216, n_1217, n_1218, n_1219, 
      n_1220, n_1221, n_1222, n_1223, n_1224, n_1225, n_1226, n_1227, n_1228, 
      n_1229, n_1230, n_1231, n_1232, n_1233, n_1234, n_1235, n_1236, n_1237, 
      n_1238, n_1239, n_1240, n_1241, n_1242, n_1243, n_1244, n_1245, n_1246, 
      n_1247, n_1248, n_1249, n_1250, n_1251, n_1252, n_1253, n_1254, n_1255, 
      n_1256, n_1257, n_1258, n_1259, n_1260, n_1261, n_1262, n_1263, n_1264, 
      n_1265, n_1266, n_1267, n_1268, n_1269, n_1270, n_1271, n_1272, n_1273, 
      n_1274, n_1275, n_1276, n_1277, n_1278, n_1279, n_1280, n_1281, n_1282, 
      n_1283, n_1284, n_1285, n_1286, n_1287, n_1288, n_1289, n_1290, n_1291, 
      n_1292, n_1293, n_1294, n_1295, n_1296, n_1297, n_1298, n_1299, n_1300, 
      n_1301, n_1302, n_1303, n_1304, n_1305, n_1306, n_1307, n_1308, n_1309, 
      n_1310, n_1311, n_1312, n_1313, n_1314, n_1315, n_1316, n_1317, n_1318, 
      n_1319, n_1320, n_1321, n_1322, n_1323, n_1324, n_1325, n_1326, n_1327, 
      n_1328, n_1329, n_1330, n_1331, n_1332, n_1333, n_1334, n_1335, n_1336, 
      n_1337, n_1338, n_1339, n_1340, n_1341, n_1342, n_1343, n_1344, n_1345, 
      n_1346, n_1347, n_1348, n_1349, n_1350, n_1351, n_1352, n_1353, n_1354, 
      n_1355, n_1356, n_1357, n_1358, n_1359, n_1360, n_1361, n_1362, n_1363, 
      n_1364, n_1365, n_1366, n_1367, n_1368, n_1369, n_1370, n_1371, n_1372, 
      n_1373, n_1374, n_1375, n_1376, n_1377, n_1378, n_1379, n_1380, n_1381, 
      n_1382, n_1383, n_1384, n_1385, n_1386, n_1387, n_1388, n_1389, n_1390, 
      n_1391, n_1392, n_1393, n_1394, n_1395, n_1396, n_1397, n_1398, n_1399, 
      n_1400, n_1401, n_1402, n_1403, n_1404, n_1405, n_1406, n_1407, n_1408, 
      n_1409, n_1410, n_1411, n_1412, n_1413, n_1414, n_1415, n_1416, n_1417, 
      n_1418, n_1419, n_1420, n_1421, n_1422, n_1423, n_1424, n_1425, n_1426, 
      n_1427, n_1428, n_1429, n_1430, n_1431, n_1432, n_1433, n_1434, n_1435, 
      n_1436, n_1437, n_1438, n_1439, n_1440, n_1441, n_1442, n_1443, n_1444, 
      n_1445, n_1446, n_1447, n_1448, n_1449, n_1450, n_1451, n_1452, n_1453, 
      n_1454, n_1455, n_1456, n_1457, n_1458, n_1459, n_1460, n_1461, n_1462, 
      n_1463, n_1464, n_1465, n_1466, n_1467, n_1468, n_1469, n_1470, n_1471, 
      n_1472, n_1473, n_1474, n_1475, n_1476, n_1477, n_1478, n_1479, n_1480, 
      n_1481, n_1482, n_1483, n_1484, n_1485, n_1486, n_1487, n_1488, n_1489, 
      n_1490, n_1491, n_1492, n_1493, n_1494, n_1495, n_1496, n_1497, n_1498, 
      n_1499, n_1500, n_1501, n_1502, n_1503, n_1504, n_1505, n_1506, n_1507, 
      n_1508, n_1509, n_1510, n_1511, n_1512, n_1513, n_1514, n_1515, n_1516, 
      n_1517, n_1518, n_1519, n_1520, n_1521, n_1522, n_1523, n_1524, n_1525, 
      n_1526, n_1527, n_1528, n_1529, n_1530, n_1531, n_1532, n_1533, n_1534, 
      n_1535, n_1536, n_1537, n_1538, n_1539, n_1540, n_1541, n_1542, n_1543, 
      n_1544, n_1545, n_1546, n_1547, n_1548, n_1549, n_1550, n_1551, n_1552, 
      n_1553, n_1554, n_1555, n_1556, n_1557, n_1558, n_1559, n_1560, n_1561, 
      n_1562, n_1563, n_1564, n_1565, n_1566, n_1567, n_1568, n_1569, n_1570, 
      n_1571, n_1572, n_1573, n_1574, n_1575, n_1576, n_1577, n_1578, n_1579, 
      n_1580, n_1581, n_1582, n_1583, n_1584, n_1585, n_1586, n_1587, n_1588, 
      n_1589, n_1590, n_1591, n_1592, n_1593, n_1594, n_1595, n_1596, n_1597, 
      n_1598, n_1599, n_1600, n_1601, n_1602, n_1603, n_1604, n_1605, n_1606, 
      n_1607, n_1608, n_1609, n_1610, n_1611, n_1612, n_1613, n_1614, n_1615, 
      n_1616, n_1617, n_1618, n_1619, n_1620, n_1621, n_1622, n_1623, n_1624, 
      n_1625, n_1626, n_1627, n_1628, n_1629, n_1630, n_1631, n_1632, n_1633, 
      n_1634, n_1635, n_1636, n_1637, n_1638, n_1639, n_1640, n_1641, n_1642, 
      n_1643, n_1644, n_1645, n_1646, n_1647, n_1648, n_1649, n_1650, n_1651, 
      n_1652, n_1653, n_1654, n_1655, n_1656, n_1657, n_1658, n_1659, n_1660, 
      n_1661, n_1662, n_1663, n_1664, n_1665, n_1666, n_1667, n_1668, n_1669, 
      n_1670, n_1671, n_1672, n_1673, n_1674, n_1675, n_1676, n_1677, n_1678, 
      n_1679, n_1680, n_1681, n_1682, n_1683, n_1684, n_1685, n_1686, n_1687, 
      n_1688, n_1689, n_1690, n_1691, n_1692, n_1693, n_1694, n_1695, n_1696, 
      n_1697, n_1698, n_1699, n_1700, n_1701, n_1702, n_1703, n_1704, n_1705, 
      n_1706, n_1707, n_1708, n_1709, n_1710, n_1711, n_1712, n_1713, n_1714, 
      n_1715, n_1716, n_1717, n_1718, n_1719, n_1720, n_1721, n_1722, n_1723, 
      n_1724, n_1725, n_1726, n_1727, n_1728, n_1729, n_1730, n_1731, n_1732, 
      n_1733, n_1734, n_1735, n_1736, n_1737, n_1738, n_1739, n_1740, n_1741, 
      n_1742, n_1743, n_1744, n_1745, n_1746, n_1747, n_1748, n_1749, n_1750, 
      n_1751, n_1752, n_1753, n_1754, n_1755, n_1756, n_1757, n_1758, n_1759, 
      n_1760, n_1761, n_1762, n_1763, n_1764, n_1765, n_1766, n_1767, n_1768, 
      n_1769, n_1770, n_1771, n_1772, n_1773, n_1774, n_1775, n_1776, n_1777, 
      n_1778, n_1779, n_1780, n_1781, n_1782, n_1783, n_1784, n_1785, n_1786, 
      n_1787, n_1788, n_1789, n_1790, n_1791, n_1792, n_1793, n_1794, n_1795, 
      n_1796, n_1797, n_1798, n_1799, n_1800, n_1801, n_1802, n_1803, n_1804, 
      n_1805, n_1806, n_1807, n_1808, n_1809, n_1810, n_1811, n_1812, n_1813, 
      n_1814, n_1815, n_1816, n_1817, n_1818, n_1819, n_1820, n_1821, n_1822, 
      n_1823, n_1824, n_1825, n_1826, n_1827, n_1828, n_1829, n_1830, n_1831, 
      n_1832, n_1833, n_1834, n_1835, n_1836, n_1837, n_1838, n_1839, n_1840, 
      n_1841, n_1842, n_1843, n_1844, n_1845, n_1846, n_1847, n_1848, n_1849, 
      n_1850, n_1851, n_1852, n_1853, n_1854, n_1855, n_1856, n_1857, n_1858, 
      n_1859, n_1860, n_1861, n_1862, n_1863, n_1864, n_1865, n_1866, n_1867, 
      n_1868, n_1869, n_1870, n_1871, n_1872, n_1873, n_1874, n_1875, n_1876, 
      n_1877, n_1878, n_1879, n_1880, n_1881, n_1882, n_1883, n_1884, n_1885, 
      n_1886, n_1887, n_1888, n_1889, n_1890, n_1891, n_1892, n_1893, n_1894, 
      n_1895, n_1896, n_1897, n_1898, n_1899, n_1900, n_1901, n_1902, n_1903, 
      n_1904, n_1905, n_1906, n_1907, n_1908, n_1909, n_1910, n_1911, n_1912, 
      n_1913, n_1914, n_1915, n_1916, n_1917, n_1918, n_1919, n_1920, n_1921, 
      n_1922, n_1923, n_1924, n_1925, n_1926, n_1927, n_1928, n_1929, n_1930, 
      n_1931, n_1932, n_1933, n_1934, n_1935, n_1936, n_1937, n_1938, n_1939, 
      n_1940, n_1941, n_1942, n_1943, n_1944, n_1945, n_1946, n_1947, n_1948, 
      n_1949, n_1950, n_1951, n_1952, n_1953, n_1954, n_1955, n_1956, n_1957, 
      n_1958, n_1959, n_1960, n_1961, n_1962, n_1963, n_1964, n_1965, n_1966, 
      n_1967, n_1968, n_1969, n_1970, n_1971, n_1972, n_1973, n_1974, n_1975, 
      n_1976, n_1977, n_1978, n_1979, n_1980, n_1981, n_1982, n_1983, n_1984, 
      n_1985, n_1986, n_1987, n_1988, n_1989, n_1990, n_1991 : std_logic;

begin
   clk_port <= clk;
   ( wdata_31_port, wdata_30_port, wdata_29_port, wdata_28_port, wdata_27_port,
      wdata_26_port, wdata_25_port, wdata_24_port, wdata_23_port, wdata_22_port
      , wdata_21_port, wdata_20_port, wdata_19_port, wdata_18_port, 
      wdata_17_port, wdata_16_port, wdata_15_port, wdata_14_port, wdata_13_port
      , wdata_12_port, wdata_11_port, wdata_10_port, wdata_9_port, wdata_8_port
      , wdata_7_port, wdata_6_port, wdata_5_port, wdata_4_port, wdata_3_port, 
      wdata_2_port, wdata_1_port, wdata_0_port ) <= wdata;
   rdata1 <= ( rdata1_31_port, rdata1_30_port, rdata1_29_port, rdata1_28_port, 
      rdata1_27_port, rdata1_26_port, rdata1_25_port, rdata1_24_port, 
      rdata1_23_port, rdata1_22_port, rdata1_21_port, rdata1_20_port, 
      rdata1_19_port, rdata1_18_port, rdata1_17_port, rdata1_16_port, 
      rdata1_15_port, rdata1_14_port, rdata1_13_port, rdata1_12_port, 
      rdata1_11_port, rdata1_10_port, rdata1_9_port, rdata1_8_port, 
      rdata1_7_port, rdata1_6_port, rdata1_5_port, rdata1_4_port, rdata1_3_port
      , rdata1_2_port, rdata1_1_port, rdata1_0_port );
   rdata2 <= ( rdata2_31_port, rdata2_30_port, rdata2_29_port, rdata2_28_port, 
      rdata2_27_port, rdata2_26_port, rdata2_25_port, rdata2_24_port, 
      rdata2_23_port, rdata2_22_port, rdata2_21_port, rdata2_20_port, 
      rdata2_19_port, rdata2_18_port, rdata2_17_port, rdata2_16_port, 
      rdata2_15_port, rdata2_14_port, rdata2_13_port, rdata2_12_port, 
      rdata2_11_port, rdata2_10_port, rdata2_9_port, rdata2_8_port, 
      rdata2_7_port, rdata2_6_port, rdata2_5_port, rdata2_4_port, rdata2_3_port
      , rdata2_2_port, rdata2_1_port, rdata2_0_port );
   
   regs_r_reg_1_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1249, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_1_31_port, QN
               => n_1000);
   regs_r_reg_1_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1248, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_1_30_port, QN
               => n_1001);
   regs_r_reg_1_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1247, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_1_29_port, QN
               => n_1002);
   regs_r_reg_1_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1246, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_1_28_port, QN
               => n_1003);
   regs_r_reg_1_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1245, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_1_27_port, QN
               => n_1004);
   regs_r_reg_1_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1244, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_1_26_port, QN
               => n_1005);
   regs_r_reg_1_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1243, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_1_25_port, QN
               => n_1006);
   regs_r_reg_1_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1242, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_1_24_port, QN
               => n_1007);
   regs_r_reg_1_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1241, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_1_23_port, QN
               => n_1008);
   regs_r_reg_1_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1240, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_1_22_port, QN
               => n_1009);
   regs_r_reg_1_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1239, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_1_21_port, QN
               => n_1010);
   regs_r_reg_1_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1238, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_1_20_port, QN
               => n_1011);
   regs_r_reg_1_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1237, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_1_19_port, QN
               => n_1012);
   regs_r_reg_1_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1236, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_1_18_port, QN
               => n_1013);
   regs_r_reg_1_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1235, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_1_17_port, QN
               => n_1014);
   regs_r_reg_1_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1234, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_1_16_port, QN
               => n_1015);
   regs_r_reg_1_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1233, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_1_15_port, QN
               => n_1016);
   regs_r_reg_1_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1232, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_1_14_port, QN
               => n_1017);
   regs_r_reg_1_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1231, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_1_13_port, QN
               => n_1018);
   regs_r_reg_1_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1230, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_1_12_port, QN
               => n_1019);
   regs_r_reg_1_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1229, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_1_11_port, QN
               => n_1020);
   regs_r_reg_1_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1228, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_1_10_port, QN
               => n_1021);
   regs_r_reg_1_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1227, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_1_9_port, QN => n_1022);
   regs_r_reg_1_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1226, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_1_8_port, QN => n_1023);
   regs_r_reg_1_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1225, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_1_7_port, QN => n_1024);
   regs_r_reg_1_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1224, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_1_6_port, QN => n_1025);
   regs_r_reg_1_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1223, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_1_5_port, QN => n_1026);
   regs_r_reg_1_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1222, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_1_4_port, QN => n_1027);
   regs_r_reg_1_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1221, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_1_3_port, QN => n_1028);
   regs_r_reg_1_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1220, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_1_2_port, QN => n_1029);
   regs_r_reg_1_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1219, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_1_1_port, QN => n_1030);
   regs_r_reg_1_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1218, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_1_0_port, QN => n_1031);
   regs_r_reg_2_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1217, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_2_31_port, QN
               => n_1032);
   regs_r_reg_2_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1216, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_2_30_port, QN
               => n_1033);
   regs_r_reg_2_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1215, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_2_29_port, QN
               => n_1034);
   regs_r_reg_2_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1214, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_2_28_port, QN
               => n_1035);
   regs_r_reg_2_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1213, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_2_27_port, QN
               => n_1036);
   regs_r_reg_2_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1212, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_2_26_port, QN
               => n_1037);
   regs_r_reg_2_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1211, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_2_25_port, QN
               => n_1038);
   regs_r_reg_2_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1210, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_2_24_port, QN
               => n_1039);
   regs_r_reg_2_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1209, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_2_23_port, QN
               => n_1040);
   regs_r_reg_2_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1208, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_2_22_port, QN
               => n_1041);
   regs_r_reg_2_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1207, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_2_21_port, QN
               => n_1042);
   regs_r_reg_2_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1206, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_2_20_port, QN
               => n_1043);
   regs_r_reg_2_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1205, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_2_19_port, QN
               => n_1044);
   regs_r_reg_2_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1204, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_2_18_port, QN
               => n_1045);
   regs_r_reg_2_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1203, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_2_17_port, QN
               => n_1046);
   regs_r_reg_2_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1202, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_2_16_port, QN
               => n_1047);
   regs_r_reg_2_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1201, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_2_15_port, QN
               => n_1048);
   regs_r_reg_2_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1200, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_2_14_port, QN
               => n_1049);
   regs_r_reg_2_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1199, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_2_13_port, QN
               => n_1050);
   regs_r_reg_2_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1198, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_2_12_port, QN
               => n_1051);
   regs_r_reg_2_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1197, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_2_11_port, QN
               => n_1052);
   regs_r_reg_2_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1196, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_2_10_port, QN
               => n_1053);
   regs_r_reg_2_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1195, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_2_9_port, QN => n_1054);
   regs_r_reg_2_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1194, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_2_8_port, QN => n_1055);
   regs_r_reg_2_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1193, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_2_7_port, QN => n_1056);
   regs_r_reg_2_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1192, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_2_6_port, QN => n_1057);
   regs_r_reg_2_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1191, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_2_5_port, QN => n_1058);
   regs_r_reg_2_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1190, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_2_4_port, QN => n_1059);
   regs_r_reg_2_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1189, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_2_3_port, QN => n_1060);
   regs_r_reg_2_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1188, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_2_2_port, QN => n_1061);
   regs_r_reg_2_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1187, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_2_1_port, QN => n_1062);
   regs_r_reg_2_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1186, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_2_0_port, QN => n_1063);
   regs_r_reg_3_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1185, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_3_31_port, QN
               => n_1064);
   regs_r_reg_3_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1184, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_3_30_port, QN
               => n_1065);
   regs_r_reg_3_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1183, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_3_29_port, QN
               => n_1066);
   regs_r_reg_3_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1182, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_3_28_port, QN
               => n_1067);
   regs_r_reg_3_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1181, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_3_27_port, QN
               => n_1068);
   regs_r_reg_3_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1180, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_3_26_port, QN
               => n_1069);
   regs_r_reg_3_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1179, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_3_25_port, QN
               => n_1070);
   regs_r_reg_3_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1178, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_3_24_port, QN
               => n_1071);
   regs_r_reg_3_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1177, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_3_23_port, QN
               => n_1072);
   regs_r_reg_3_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1176, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_3_22_port, QN
               => n_1073);
   regs_r_reg_3_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1175, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_3_21_port, QN
               => n_1074);
   regs_r_reg_3_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1174, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_3_20_port, QN
               => n_1075);
   regs_r_reg_3_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1173, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_3_19_port, QN
               => n_1076);
   regs_r_reg_3_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1172, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_3_18_port, QN
               => n_1077);
   regs_r_reg_3_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1171, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_3_17_port, QN
               => n_1078);
   regs_r_reg_3_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1170, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_3_16_port, QN
               => n_1079);
   regs_r_reg_3_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1169, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_3_15_port, QN
               => n_1080);
   regs_r_reg_3_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1168, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_3_14_port, QN
               => n_1081);
   regs_r_reg_3_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1167, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_3_13_port, QN
               => n_1082);
   regs_r_reg_3_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1166, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_3_12_port, QN
               => n_1083);
   regs_r_reg_3_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1165, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_3_11_port, QN
               => n_1084);
   regs_r_reg_3_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1164, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_3_10_port, QN
               => n_1085);
   regs_r_reg_3_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1163, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_3_9_port, QN => n_1086);
   regs_r_reg_3_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1162, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_3_8_port, QN => n_1087);
   regs_r_reg_3_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1161, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_3_7_port, QN => n_1088);
   regs_r_reg_3_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1160, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_3_6_port, QN => n_1089);
   regs_r_reg_3_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1159, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_3_5_port, QN => n_1090);
   regs_r_reg_3_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1158, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_3_4_port, QN => n_1091);
   regs_r_reg_3_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1157, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_3_3_port, QN => n_1092);
   regs_r_reg_3_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1156, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_3_2_port, QN => n_1093);
   regs_r_reg_3_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1155, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_3_1_port, QN => n_1094);
   regs_r_reg_3_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1154, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_3_0_port, QN => n_1095);
   regs_r_reg_4_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1153, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_4_31_port, QN
               => n_1096);
   regs_r_reg_4_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1152, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_4_30_port, QN
               => n_1097);
   regs_r_reg_4_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1151, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_4_29_port, QN
               => n_1098);
   regs_r_reg_4_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1150, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_4_28_port, QN
               => n_1099);
   regs_r_reg_4_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1149, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_4_27_port, QN
               => n_1100);
   regs_r_reg_4_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1148, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_4_26_port, QN
               => n_1101);
   regs_r_reg_4_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1147, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_4_25_port, QN
               => n_1102);
   regs_r_reg_4_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1146, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_4_24_port, QN
               => n_1103);
   regs_r_reg_4_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1145, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_4_23_port, QN
               => n_1104);
   regs_r_reg_4_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1144, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_4_22_port, QN
               => n_1105);
   regs_r_reg_4_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1143, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_4_21_port, QN
               => n_1106);
   regs_r_reg_4_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1142, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_4_20_port, QN
               => n_1107);
   regs_r_reg_4_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1141, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_4_19_port, QN
               => n_1108);
   regs_r_reg_4_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1140, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_4_18_port, QN
               => n_1109);
   regs_r_reg_4_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1139, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_4_17_port, QN
               => n_1110);
   regs_r_reg_4_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1138, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_4_16_port, QN
               => n_1111);
   regs_r_reg_4_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1137, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_4_15_port, QN
               => n_1112);
   regs_r_reg_4_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1136, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_4_14_port, QN
               => n_1113);
   regs_r_reg_4_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1135, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_4_13_port, QN
               => n_1114);
   regs_r_reg_4_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1134, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_4_12_port, QN
               => n_1115);
   regs_r_reg_4_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1133, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_4_11_port, QN
               => n_1116);
   regs_r_reg_4_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1132, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_4_10_port, QN
               => n_1117);
   regs_r_reg_4_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1131, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_4_9_port, QN => n_1118);
   regs_r_reg_4_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1130, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_4_8_port, QN => n_1119);
   regs_r_reg_4_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1129, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_4_7_port, QN => n_1120);
   regs_r_reg_4_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1128, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_4_6_port, QN => n_1121);
   regs_r_reg_4_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1127, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_4_5_port, QN => n_1122);
   regs_r_reg_4_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1126, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_4_4_port, QN => n_1123);
   regs_r_reg_4_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1125, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_4_3_port, QN => n_1124);
   regs_r_reg_4_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1124, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_4_2_port, QN => n_1125);
   regs_r_reg_4_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1123, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_4_1_port, QN => n_1126);
   regs_r_reg_4_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1122, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_4_0_port, QN => n_1127);
   regs_r_reg_5_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1121, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_5_31_port, QN
               => n_1128);
   regs_r_reg_5_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1120, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_5_30_port, QN
               => n_1129);
   regs_r_reg_5_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1119, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_5_29_port, QN
               => n_1130);
   regs_r_reg_5_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1118, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_5_28_port, QN
               => n_1131);
   regs_r_reg_5_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1117, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_5_27_port, QN
               => n_1132);
   regs_r_reg_5_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1116, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_5_26_port, QN
               => n_1133);
   regs_r_reg_5_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1115, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_5_25_port, QN
               => n_1134);
   regs_r_reg_5_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1114, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_5_24_port, QN
               => n_1135);
   regs_r_reg_5_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1113, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_5_23_port, QN
               => n_1136);
   regs_r_reg_5_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1112, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_5_22_port, QN
               => n_1137);
   regs_r_reg_5_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1111, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_5_21_port, QN
               => n_1138);
   regs_r_reg_5_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1110, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_5_20_port, QN
               => n_1139);
   regs_r_reg_5_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1109, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_5_19_port, QN
               => n_1140);
   regs_r_reg_5_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1108, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_5_18_port, QN
               => n_1141);
   regs_r_reg_5_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1107, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_5_17_port, QN
               => n_1142);
   regs_r_reg_5_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1106, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_5_16_port, QN
               => n_1143);
   regs_r_reg_5_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1105, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_5_15_port, QN
               => n_1144);
   regs_r_reg_5_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1104, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_5_14_port, QN
               => n_1145);
   regs_r_reg_5_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1103, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_5_13_port, QN
               => n_1146);
   regs_r_reg_5_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1102, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_5_12_port, QN
               => n_1147);
   regs_r_reg_5_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1101, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_5_11_port, QN
               => n_1148);
   regs_r_reg_5_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1100, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_5_10_port, QN
               => n_1149);
   regs_r_reg_5_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1099, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_5_9_port, QN => n_1150);
   regs_r_reg_5_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1098, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_5_8_port, QN => n_1151);
   regs_r_reg_5_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1097, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_5_7_port, QN => n_1152);
   regs_r_reg_5_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1096, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_5_6_port, QN => n_1153);
   regs_r_reg_5_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1095, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_5_5_port, QN => n_1154);
   regs_r_reg_5_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1094, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_5_4_port, QN => n_1155);
   regs_r_reg_5_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1093, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_5_3_port, QN => n_1156);
   regs_r_reg_5_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1092, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_5_2_port, QN => n_1157);
   regs_r_reg_5_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1091, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_5_1_port, QN => n_1158);
   regs_r_reg_5_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1090, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_5_0_port, QN => n_1159);
   regs_r_reg_6_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1089, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_6_31_port, QN
               => n_1160);
   regs_r_reg_6_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1088, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_6_30_port, QN
               => n_1161);
   regs_r_reg_6_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1087, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_6_29_port, QN
               => n_1162);
   regs_r_reg_6_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1086, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_6_28_port, QN
               => n_1163);
   regs_r_reg_6_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1085, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_6_27_port, QN
               => n_1164);
   regs_r_reg_6_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1084, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_6_26_port, QN
               => n_1165);
   regs_r_reg_6_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1083, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_6_25_port, QN
               => n_1166);
   regs_r_reg_6_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1082, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_6_24_port, QN
               => n_1167);
   regs_r_reg_6_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1081, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_6_23_port, QN
               => n_1168);
   regs_r_reg_6_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1080, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_6_22_port, QN
               => n_1169);
   regs_r_reg_6_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1079, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_6_21_port, QN
               => n_1170);
   regs_r_reg_6_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1078, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_6_20_port, QN
               => n_1171);
   regs_r_reg_6_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1077, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_6_19_port, QN
               => n_1172);
   regs_r_reg_6_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1076, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_6_18_port, QN
               => n_1173);
   regs_r_reg_6_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1075, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_6_17_port, QN
               => n_1174);
   regs_r_reg_6_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1074, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_6_16_port, QN
               => n_1175);
   regs_r_reg_6_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1073, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_6_15_port, QN
               => n_1176);
   regs_r_reg_6_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1072, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_6_14_port, QN
               => n_1177);
   regs_r_reg_6_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1071, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_6_13_port, QN
               => n_1178);
   regs_r_reg_6_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1070, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_6_12_port, QN
               => n_1179);
   regs_r_reg_6_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1069, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_6_11_port, QN
               => n_1180);
   regs_r_reg_6_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1068, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_6_10_port, QN
               => n_1181);
   regs_r_reg_6_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1067, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_6_9_port, QN => n_1182);
   regs_r_reg_6_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1066, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_6_8_port, QN => n_1183);
   regs_r_reg_6_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1065, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_6_7_port, QN => n_1184);
   regs_r_reg_6_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1064, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_6_6_port, QN => n_1185);
   regs_r_reg_6_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1063, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_6_5_port, QN => n_1186);
   regs_r_reg_6_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1062, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_6_4_port, QN => n_1187);
   regs_r_reg_6_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1061, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_6_3_port, QN => n_1188);
   regs_r_reg_6_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1060, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_6_2_port, QN => n_1189);
   regs_r_reg_6_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1059, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_6_1_port, QN => n_1190);
   regs_r_reg_6_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1058, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_6_0_port, QN => n_1191);
   regs_r_reg_7_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1057, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_7_31_port, QN
               => n_1192);
   regs_r_reg_7_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1056, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_7_30_port, QN
               => n_1193);
   regs_r_reg_7_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1055, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_7_29_port, QN
               => n_1194);
   regs_r_reg_7_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1054, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_7_28_port, QN
               => n_1195);
   regs_r_reg_7_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1053, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_7_27_port, QN
               => n_1196);
   regs_r_reg_7_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1052, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_7_26_port, QN
               => n_1197);
   regs_r_reg_7_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1051, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_7_25_port, QN
               => n_1198);
   regs_r_reg_7_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1050, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_7_24_port, QN
               => n_1199);
   regs_r_reg_7_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1049, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_7_23_port, QN
               => n_1200);
   regs_r_reg_7_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1048, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_7_22_port, QN
               => n_1201);
   regs_r_reg_7_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1047, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_7_21_port, QN
               => n_1202);
   regs_r_reg_7_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1046, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_7_20_port, QN
               => n_1203);
   regs_r_reg_7_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1045, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_7_19_port, QN
               => n_1204);
   regs_r_reg_7_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1044, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_7_18_port, QN
               => n_1205);
   regs_r_reg_7_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1043, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_7_17_port, QN
               => n_1206);
   regs_r_reg_7_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1042, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_7_16_port, QN
               => n_1207);
   regs_r_reg_7_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1041, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_7_15_port, QN
               => n_1208);
   regs_r_reg_7_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1040, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_7_14_port, QN
               => n_1209);
   regs_r_reg_7_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1039, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_7_13_port, QN
               => n_1210);
   regs_r_reg_7_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1038, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_7_12_port, QN
               => n_1211);
   regs_r_reg_7_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1037, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_7_11_port, QN
               => n_1212);
   regs_r_reg_7_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1036, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_7_10_port, QN
               => n_1213);
   regs_r_reg_7_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1035, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_7_9_port, QN => n_1214);
   regs_r_reg_7_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1034, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_7_8_port, QN => n_1215);
   regs_r_reg_7_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1033, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_7_7_port, QN => n_1216);
   regs_r_reg_7_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1032, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_7_6_port, QN => n_1217);
   regs_r_reg_7_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1031, next_state => wdata_5_port
               , clocked_on => clk_port, Q => regs_r_7_5_port, QN => n_1218);
   regs_r_reg_7_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1030, next_state => wdata_4_port
               , clocked_on => clk_port, Q => regs_r_7_4_port, QN => n_1219);
   regs_r_reg_7_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1029, next_state => wdata_3_port
               , clocked_on => clk_port, Q => regs_r_7_3_port, QN => n_1220);
   regs_r_reg_7_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1028, next_state => wdata_2_port
               , clocked_on => clk_port, Q => regs_r_7_2_port, QN => n_1221);
   regs_r_reg_7_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1027, next_state => wdata_1_port
               , clocked_on => clk_port, Q => regs_r_7_1_port, QN => n_1222);
   regs_r_reg_7_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1026, next_state => wdata_0_port
               , clocked_on => clk_port, Q => regs_r_7_0_port, QN => n_1223);
   regs_r_reg_8_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1025, next_state => 
               wdata_31_port, clocked_on => clk_port, Q => regs_r_8_31_port, QN
               => n_1224);
   regs_r_reg_8_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1024, next_state => 
               wdata_30_port, clocked_on => clk_port, Q => regs_r_8_30_port, QN
               => n_1225);
   regs_r_reg_8_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1023, next_state => 
               wdata_29_port, clocked_on => clk_port, Q => regs_r_8_29_port, QN
               => n_1226);
   regs_r_reg_8_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1022, next_state => 
               wdata_28_port, clocked_on => clk_port, Q => regs_r_8_28_port, QN
               => n_1227);
   regs_r_reg_8_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1021, next_state => 
               wdata_27_port, clocked_on => clk_port, Q => regs_r_8_27_port, QN
               => n_1228);
   regs_r_reg_8_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1020, next_state => 
               wdata_26_port, clocked_on => clk_port, Q => regs_r_8_26_port, QN
               => n_1229);
   regs_r_reg_8_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1019, next_state => 
               wdata_25_port, clocked_on => clk_port, Q => regs_r_8_25_port, QN
               => n_1230);
   regs_r_reg_8_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1018, next_state => 
               wdata_24_port, clocked_on => clk_port, Q => regs_r_8_24_port, QN
               => n_1231);
   regs_r_reg_8_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1017, next_state => 
               wdata_23_port, clocked_on => clk_port, Q => regs_r_8_23_port, QN
               => n_1232);
   regs_r_reg_8_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1016, next_state => 
               wdata_22_port, clocked_on => clk_port, Q => regs_r_8_22_port, QN
               => n_1233);
   regs_r_reg_8_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1015, next_state => 
               wdata_21_port, clocked_on => clk_port, Q => regs_r_8_21_port, QN
               => n_1234);
   regs_r_reg_8_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1014, next_state => 
               wdata_20_port, clocked_on => clk_port, Q => regs_r_8_20_port, QN
               => n_1235);
   regs_r_reg_8_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1013, next_state => 
               wdata_19_port, clocked_on => clk_port, Q => regs_r_8_19_port, QN
               => n_1236);
   regs_r_reg_8_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1012, next_state => 
               wdata_18_port, clocked_on => clk_port, Q => regs_r_8_18_port, QN
               => n_1237);
   regs_r_reg_8_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1011, next_state => 
               wdata_17_port, clocked_on => clk_port, Q => regs_r_8_17_port, QN
               => n_1238);
   regs_r_reg_8_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1010, next_state => 
               wdata_16_port, clocked_on => clk_port, Q => regs_r_8_16_port, QN
               => n_1239);
   regs_r_reg_8_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1009, next_state => 
               wdata_15_port, clocked_on => clk_port, Q => regs_r_8_15_port, QN
               => n_1240);
   regs_r_reg_8_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1008, next_state => 
               wdata_14_port, clocked_on => clk_port, Q => regs_r_8_14_port, QN
               => n_1241);
   regs_r_reg_8_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1007, next_state => 
               wdata_13_port, clocked_on => clk_port, Q => regs_r_8_13_port, QN
               => n_1242);
   regs_r_reg_8_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1006, next_state => 
               wdata_12_port, clocked_on => clk_port, Q => regs_r_8_12_port, QN
               => n_1243);
   regs_r_reg_8_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1005, next_state => 
               wdata_11_port, clocked_on => clk_port, Q => regs_r_8_11_port, QN
               => n_1244);
   regs_r_reg_8_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1004, next_state => 
               wdata_10_port, clocked_on => clk_port, Q => regs_r_8_10_port, QN
               => n_1245);
   regs_r_reg_8_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1003, next_state => wdata_9_port
               , clocked_on => clk_port, Q => regs_r_8_9_port, QN => n_1246);
   regs_r_reg_8_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1002, next_state => wdata_8_port
               , clocked_on => clk_port, Q => regs_r_8_8_port, QN => n_1247);
   regs_r_reg_8_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1001, next_state => wdata_7_port
               , clocked_on => clk_port, Q => regs_r_8_7_port, QN => n_1248);
   regs_r_reg_8_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N1000, next_state => wdata_6_port
               , clocked_on => clk_port, Q => regs_r_8_6_port, QN => n_1249);
   regs_r_reg_8_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N999, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_8_5_port, QN => n_1250);
   regs_r_reg_8_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N998, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_8_4_port, QN => n_1251);
   regs_r_reg_8_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N997, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_8_3_port, QN => n_1252);
   regs_r_reg_8_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N996, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_8_2_port, QN => n_1253);
   regs_r_reg_8_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N995, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_8_1_port, QN => n_1254);
   regs_r_reg_8_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N994, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_8_0_port, QN => n_1255);
   regs_r_reg_9_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N993, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_9_31_port, QN => n_1256);
   regs_r_reg_9_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N992, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_9_30_port, QN => n_1257);
   regs_r_reg_9_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N991, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_9_29_port, QN => n_1258);
   regs_r_reg_9_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N990, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_9_28_port, QN => n_1259);
   regs_r_reg_9_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N989, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_9_27_port, QN => n_1260);
   regs_r_reg_9_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N988, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_9_26_port, QN => n_1261);
   regs_r_reg_9_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N987, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_9_25_port, QN => n_1262);
   regs_r_reg_9_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N986, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_9_24_port, QN => n_1263);
   regs_r_reg_9_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N985, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_9_23_port, QN => n_1264);
   regs_r_reg_9_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N984, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_9_22_port, QN => n_1265);
   regs_r_reg_9_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N983, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_9_21_port, QN => n_1266);
   regs_r_reg_9_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N982, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_9_20_port, QN => n_1267);
   regs_r_reg_9_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N981, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_9_19_port, QN => n_1268);
   regs_r_reg_9_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N980, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_9_18_port, QN => n_1269);
   regs_r_reg_9_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N979, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_9_17_port, QN => n_1270);
   regs_r_reg_9_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N978, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_9_16_port, QN => n_1271);
   regs_r_reg_9_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N977, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_9_15_port, QN => n_1272);
   regs_r_reg_9_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N976, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_9_14_port, QN => n_1273);
   regs_r_reg_9_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N975, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_9_13_port, QN => n_1274);
   regs_r_reg_9_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N974, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_9_12_port, QN => n_1275);
   regs_r_reg_9_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N973, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_9_11_port, QN => n_1276);
   regs_r_reg_9_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N972, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_9_10_port, QN => n_1277);
   regs_r_reg_9_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N971, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_9_9_port, QN => n_1278);
   regs_r_reg_9_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N970, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_9_8_port, QN => n_1279);
   regs_r_reg_9_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N969, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_9_7_port, QN => n_1280);
   regs_r_reg_9_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N968, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_9_6_port, QN => n_1281);
   regs_r_reg_9_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N967, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_9_5_port, QN => n_1282);
   regs_r_reg_9_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N966, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_9_4_port, QN => n_1283);
   regs_r_reg_9_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N965, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_9_3_port, QN => n_1284);
   regs_r_reg_9_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N964, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_9_2_port, QN => n_1285);
   regs_r_reg_9_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N963, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_9_1_port, QN => n_1286);
   regs_r_reg_9_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N962, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_9_0_port, QN => n_1287);
   regs_r_reg_10_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N961, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_10_31_port, QN => n_1288);
   regs_r_reg_10_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N960, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_10_30_port, QN => n_1289);
   regs_r_reg_10_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N959, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_10_29_port, QN => n_1290);
   regs_r_reg_10_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N958, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_10_28_port, QN => n_1291);
   regs_r_reg_10_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N957, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_10_27_port, QN => n_1292);
   regs_r_reg_10_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N956, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_10_26_port, QN => n_1293);
   regs_r_reg_10_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N955, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_10_25_port, QN => n_1294);
   regs_r_reg_10_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N954, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_10_24_port, QN => n_1295);
   regs_r_reg_10_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N953, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_10_23_port, QN => n_1296);
   regs_r_reg_10_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N952, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_10_22_port, QN => n_1297);
   regs_r_reg_10_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N951, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_10_21_port, QN => n_1298);
   regs_r_reg_10_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N950, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_10_20_port, QN => n_1299);
   regs_r_reg_10_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N949, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_10_19_port, QN => n_1300);
   regs_r_reg_10_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N948, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_10_18_port, QN => n_1301);
   regs_r_reg_10_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N947, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_10_17_port, QN => n_1302);
   regs_r_reg_10_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N946, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_10_16_port, QN => n_1303);
   regs_r_reg_10_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N945, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_10_15_port, QN => n_1304);
   regs_r_reg_10_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N944, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_10_14_port, QN => n_1305);
   regs_r_reg_10_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N943, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_10_13_port, QN => n_1306);
   regs_r_reg_10_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N942, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_10_12_port, QN => n_1307);
   regs_r_reg_10_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N941, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_10_11_port, QN => n_1308);
   regs_r_reg_10_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N940, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_10_10_port, QN => n_1309);
   regs_r_reg_10_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N939, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_10_9_port, QN => n_1310);
   regs_r_reg_10_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N938, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_10_8_port, QN => n_1311);
   regs_r_reg_10_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N937, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_10_7_port, QN => n_1312);
   regs_r_reg_10_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N936, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_10_6_port, QN => n_1313);
   regs_r_reg_10_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N935, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_10_5_port, QN => n_1314);
   regs_r_reg_10_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N934, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_10_4_port, QN => n_1315);
   regs_r_reg_10_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N933, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_10_3_port, QN => n_1316);
   regs_r_reg_10_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N932, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_10_2_port, QN => n_1317);
   regs_r_reg_10_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N931, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_10_1_port, QN => n_1318);
   regs_r_reg_10_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N930, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_10_0_port, QN => n_1319);
   regs_r_reg_11_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N929, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_11_31_port, QN => n_1320);
   regs_r_reg_11_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N928, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_11_30_port, QN => n_1321);
   regs_r_reg_11_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N927, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_11_29_port, QN => n_1322);
   regs_r_reg_11_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N926, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_11_28_port, QN => n_1323);
   regs_r_reg_11_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N925, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_11_27_port, QN => n_1324);
   regs_r_reg_11_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N924, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_11_26_port, QN => n_1325);
   regs_r_reg_11_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N923, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_11_25_port, QN => n_1326);
   regs_r_reg_11_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N922, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_11_24_port, QN => n_1327);
   regs_r_reg_11_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N921, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_11_23_port, QN => n_1328);
   regs_r_reg_11_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N920, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_11_22_port, QN => n_1329);
   regs_r_reg_11_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N919, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_11_21_port, QN => n_1330);
   regs_r_reg_11_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N918, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_11_20_port, QN => n_1331);
   regs_r_reg_11_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N917, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_11_19_port, QN => n_1332);
   regs_r_reg_11_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N916, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_11_18_port, QN => n_1333);
   regs_r_reg_11_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N915, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_11_17_port, QN => n_1334);
   regs_r_reg_11_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N914, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_11_16_port, QN => n_1335);
   regs_r_reg_11_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N913, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_11_15_port, QN => n_1336);
   regs_r_reg_11_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N912, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_11_14_port, QN => n_1337);
   regs_r_reg_11_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N911, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_11_13_port, QN => n_1338);
   regs_r_reg_11_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N910, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_11_12_port, QN => n_1339);
   regs_r_reg_11_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N909, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_11_11_port, QN => n_1340);
   regs_r_reg_11_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N908, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_11_10_port, QN => n_1341);
   regs_r_reg_11_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N907, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_11_9_port, QN => n_1342);
   regs_r_reg_11_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N906, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_11_8_port, QN => n_1343);
   regs_r_reg_11_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N905, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_11_7_port, QN => n_1344);
   regs_r_reg_11_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N904, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_11_6_port, QN => n_1345);
   regs_r_reg_11_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N903, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_11_5_port, QN => n_1346);
   regs_r_reg_11_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N902, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_11_4_port, QN => n_1347);
   regs_r_reg_11_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N901, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_11_3_port, QN => n_1348);
   regs_r_reg_11_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N900, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_11_2_port, QN => n_1349);
   regs_r_reg_11_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N899, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_11_1_port, QN => n_1350);
   regs_r_reg_11_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N898, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_11_0_port, QN => n_1351);
   regs_r_reg_12_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N897, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_12_31_port, QN => n_1352);
   regs_r_reg_12_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N896, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_12_30_port, QN => n_1353);
   regs_r_reg_12_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N895, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_12_29_port, QN => n_1354);
   regs_r_reg_12_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N894, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_12_28_port, QN => n_1355);
   regs_r_reg_12_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N893, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_12_27_port, QN => n_1356);
   regs_r_reg_12_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N892, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_12_26_port, QN => n_1357);
   regs_r_reg_12_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N891, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_12_25_port, QN => n_1358);
   regs_r_reg_12_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N890, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_12_24_port, QN => n_1359);
   regs_r_reg_12_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N889, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_12_23_port, QN => n_1360);
   regs_r_reg_12_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N888, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_12_22_port, QN => n_1361);
   regs_r_reg_12_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N887, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_12_21_port, QN => n_1362);
   regs_r_reg_12_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N886, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_12_20_port, QN => n_1363);
   regs_r_reg_12_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N885, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_12_19_port, QN => n_1364);
   regs_r_reg_12_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N884, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_12_18_port, QN => n_1365);
   regs_r_reg_12_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N883, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_12_17_port, QN => n_1366);
   regs_r_reg_12_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N882, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_12_16_port, QN => n_1367);
   regs_r_reg_12_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N881, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_12_15_port, QN => n_1368);
   regs_r_reg_12_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N880, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_12_14_port, QN => n_1369);
   regs_r_reg_12_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N879, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_12_13_port, QN => n_1370);
   regs_r_reg_12_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N878, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_12_12_port, QN => n_1371);
   regs_r_reg_12_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N877, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_12_11_port, QN => n_1372);
   regs_r_reg_12_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N876, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_12_10_port, QN => n_1373);
   regs_r_reg_12_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N875, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_12_9_port, QN => n_1374);
   regs_r_reg_12_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N874, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_12_8_port, QN => n_1375);
   regs_r_reg_12_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N873, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_12_7_port, QN => n_1376);
   regs_r_reg_12_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N872, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_12_6_port, QN => n_1377);
   regs_r_reg_12_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N871, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_12_5_port, QN => n_1378);
   regs_r_reg_12_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N870, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_12_4_port, QN => n_1379);
   regs_r_reg_12_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N869, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_12_3_port, QN => n_1380);
   regs_r_reg_12_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N868, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_12_2_port, QN => n_1381);
   regs_r_reg_12_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N867, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_12_1_port, QN => n_1382);
   regs_r_reg_12_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N866, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_12_0_port, QN => n_1383);
   regs_r_reg_13_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N865, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_13_31_port, QN => n_1384);
   regs_r_reg_13_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N864, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_13_30_port, QN => n_1385);
   regs_r_reg_13_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N863, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_13_29_port, QN => n_1386);
   regs_r_reg_13_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N862, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_13_28_port, QN => n_1387);
   regs_r_reg_13_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N861, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_13_27_port, QN => n_1388);
   regs_r_reg_13_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N860, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_13_26_port, QN => n_1389);
   regs_r_reg_13_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N859, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_13_25_port, QN => n_1390);
   regs_r_reg_13_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N858, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_13_24_port, QN => n_1391);
   regs_r_reg_13_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N857, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_13_23_port, QN => n_1392);
   regs_r_reg_13_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N856, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_13_22_port, QN => n_1393);
   regs_r_reg_13_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N855, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_13_21_port, QN => n_1394);
   regs_r_reg_13_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N854, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_13_20_port, QN => n_1395);
   regs_r_reg_13_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N853, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_13_19_port, QN => n_1396);
   regs_r_reg_13_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N852, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_13_18_port, QN => n_1397);
   regs_r_reg_13_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N851, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_13_17_port, QN => n_1398);
   regs_r_reg_13_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N850, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_13_16_port, QN => n_1399);
   regs_r_reg_13_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N849, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_13_15_port, QN => n_1400);
   regs_r_reg_13_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N848, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_13_14_port, QN => n_1401);
   regs_r_reg_13_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N847, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_13_13_port, QN => n_1402);
   regs_r_reg_13_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N846, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_13_12_port, QN => n_1403);
   regs_r_reg_13_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N845, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_13_11_port, QN => n_1404);
   regs_r_reg_13_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N844, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_13_10_port, QN => n_1405);
   regs_r_reg_13_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N843, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_13_9_port, QN => n_1406);
   regs_r_reg_13_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N842, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_13_8_port, QN => n_1407);
   regs_r_reg_13_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N841, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_13_7_port, QN => n_1408);
   regs_r_reg_13_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N840, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_13_6_port, QN => n_1409);
   regs_r_reg_13_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N839, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_13_5_port, QN => n_1410);
   regs_r_reg_13_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N838, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_13_4_port, QN => n_1411);
   regs_r_reg_13_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N837, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_13_3_port, QN => n_1412);
   regs_r_reg_13_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N836, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_13_2_port, QN => n_1413);
   regs_r_reg_13_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N835, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_13_1_port, QN => n_1414);
   regs_r_reg_13_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N834, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_13_0_port, QN => n_1415);
   regs_r_reg_14_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N833, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_14_31_port, QN => n_1416);
   regs_r_reg_14_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N832, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_14_30_port, QN => n_1417);
   regs_r_reg_14_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N831, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_14_29_port, QN => n_1418);
   regs_r_reg_14_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N830, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_14_28_port, QN => n_1419);
   regs_r_reg_14_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N829, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_14_27_port, QN => n_1420);
   regs_r_reg_14_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N828, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_14_26_port, QN => n_1421);
   regs_r_reg_14_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N827, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_14_25_port, QN => n_1422);
   regs_r_reg_14_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N826, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_14_24_port, QN => n_1423);
   regs_r_reg_14_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N825, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_14_23_port, QN => n_1424);
   regs_r_reg_14_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N824, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_14_22_port, QN => n_1425);
   regs_r_reg_14_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N823, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_14_21_port, QN => n_1426);
   regs_r_reg_14_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N822, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_14_20_port, QN => n_1427);
   regs_r_reg_14_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N821, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_14_19_port, QN => n_1428);
   regs_r_reg_14_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N820, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_14_18_port, QN => n_1429);
   regs_r_reg_14_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N819, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_14_17_port, QN => n_1430);
   regs_r_reg_14_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N818, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_14_16_port, QN => n_1431);
   regs_r_reg_14_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N817, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_14_15_port, QN => n_1432);
   regs_r_reg_14_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N816, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_14_14_port, QN => n_1433);
   regs_r_reg_14_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N815, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_14_13_port, QN => n_1434);
   regs_r_reg_14_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N814, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_14_12_port, QN => n_1435);
   regs_r_reg_14_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N813, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_14_11_port, QN => n_1436);
   regs_r_reg_14_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N812, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_14_10_port, QN => n_1437);
   regs_r_reg_14_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N811, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_14_9_port, QN => n_1438);
   regs_r_reg_14_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N810, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_14_8_port, QN => n_1439);
   regs_r_reg_14_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N809, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_14_7_port, QN => n_1440);
   regs_r_reg_14_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N808, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_14_6_port, QN => n_1441);
   regs_r_reg_14_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N807, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_14_5_port, QN => n_1442);
   regs_r_reg_14_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N806, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_14_4_port, QN => n_1443);
   regs_r_reg_14_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N805, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_14_3_port, QN => n_1444);
   regs_r_reg_14_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N804, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_14_2_port, QN => n_1445);
   regs_r_reg_14_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N803, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_14_1_port, QN => n_1446);
   regs_r_reg_14_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N802, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_14_0_port, QN => n_1447);
   regs_r_reg_15_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N801, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_15_31_port, QN => n_1448);
   regs_r_reg_15_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N800, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_15_30_port, QN => n_1449);
   regs_r_reg_15_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N799, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_15_29_port, QN => n_1450);
   regs_r_reg_15_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N798, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_15_28_port, QN => n_1451);
   regs_r_reg_15_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N797, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_15_27_port, QN => n_1452);
   regs_r_reg_15_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N796, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_15_26_port, QN => n_1453);
   regs_r_reg_15_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N795, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_15_25_port, QN => n_1454);
   regs_r_reg_15_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N794, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_15_24_port, QN => n_1455);
   regs_r_reg_15_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N793, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_15_23_port, QN => n_1456);
   regs_r_reg_15_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N792, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_15_22_port, QN => n_1457);
   regs_r_reg_15_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N791, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_15_21_port, QN => n_1458);
   regs_r_reg_15_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N790, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_15_20_port, QN => n_1459);
   regs_r_reg_15_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N789, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_15_19_port, QN => n_1460);
   regs_r_reg_15_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N788, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_15_18_port, QN => n_1461);
   regs_r_reg_15_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N787, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_15_17_port, QN => n_1462);
   regs_r_reg_15_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N786, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_15_16_port, QN => n_1463);
   regs_r_reg_15_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N785, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_15_15_port, QN => n_1464);
   regs_r_reg_15_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N784, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_15_14_port, QN => n_1465);
   regs_r_reg_15_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N783, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_15_13_port, QN => n_1466);
   regs_r_reg_15_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N782, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_15_12_port, QN => n_1467);
   regs_r_reg_15_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N781, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_15_11_port, QN => n_1468);
   regs_r_reg_15_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N780, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_15_10_port, QN => n_1469);
   regs_r_reg_15_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N779, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_15_9_port, QN => n_1470);
   regs_r_reg_15_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N778, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_15_8_port, QN => n_1471);
   regs_r_reg_15_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N777, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_15_7_port, QN => n_1472);
   regs_r_reg_15_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N776, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_15_6_port, QN => n_1473);
   regs_r_reg_15_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N775, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_15_5_port, QN => n_1474);
   regs_r_reg_15_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N774, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_15_4_port, QN => n_1475);
   regs_r_reg_15_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N773, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_15_3_port, QN => n_1476);
   regs_r_reg_15_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N772, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_15_2_port, QN => n_1477);
   regs_r_reg_15_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N771, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_15_1_port, QN => n_1478);
   regs_r_reg_15_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N770, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_15_0_port, QN => n_1479);
   regs_r_reg_16_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N769, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_16_31_port, QN => n_1480);
   regs_r_reg_16_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N768, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_16_30_port, QN => n_1481);
   regs_r_reg_16_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N767, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_16_29_port, QN => n_1482);
   regs_r_reg_16_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N766, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_16_28_port, QN => n_1483);
   regs_r_reg_16_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N765, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_16_27_port, QN => n_1484);
   regs_r_reg_16_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N764, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_16_26_port, QN => n_1485);
   regs_r_reg_16_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N763, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_16_25_port, QN => n_1486);
   regs_r_reg_16_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N762, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_16_24_port, QN => n_1487);
   regs_r_reg_16_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N761, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_16_23_port, QN => n_1488);
   regs_r_reg_16_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N760, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_16_22_port, QN => n_1489);
   regs_r_reg_16_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N759, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_16_21_port, QN => n_1490);
   regs_r_reg_16_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N758, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_16_20_port, QN => n_1491);
   regs_r_reg_16_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N757, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_16_19_port, QN => n_1492);
   regs_r_reg_16_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N756, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_16_18_port, QN => n_1493);
   regs_r_reg_16_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N755, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_16_17_port, QN => n_1494);
   regs_r_reg_16_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N754, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_16_16_port, QN => n_1495);
   regs_r_reg_16_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N753, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_16_15_port, QN => n_1496);
   regs_r_reg_16_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N752, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_16_14_port, QN => n_1497);
   regs_r_reg_16_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N751, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_16_13_port, QN => n_1498);
   regs_r_reg_16_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N750, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_16_12_port, QN => n_1499);
   regs_r_reg_16_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N749, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_16_11_port, QN => n_1500);
   regs_r_reg_16_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N748, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_16_10_port, QN => n_1501);
   regs_r_reg_16_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N747, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_16_9_port, QN => n_1502);
   regs_r_reg_16_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N746, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_16_8_port, QN => n_1503);
   regs_r_reg_16_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N745, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_16_7_port, QN => n_1504);
   regs_r_reg_16_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N744, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_16_6_port, QN => n_1505);
   regs_r_reg_16_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N743, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_16_5_port, QN => n_1506);
   regs_r_reg_16_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N742, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_16_4_port, QN => n_1507);
   regs_r_reg_16_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N741, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_16_3_port, QN => n_1508);
   regs_r_reg_16_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N740, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_16_2_port, QN => n_1509);
   regs_r_reg_16_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N739, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_16_1_port, QN => n_1510);
   regs_r_reg_16_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N738, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_16_0_port, QN => n_1511);
   regs_r_reg_17_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N737, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_17_31_port, QN => n_1512);
   regs_r_reg_17_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N736, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_17_30_port, QN => n_1513);
   regs_r_reg_17_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N735, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_17_29_port, QN => n_1514);
   regs_r_reg_17_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N734, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_17_28_port, QN => n_1515);
   regs_r_reg_17_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N733, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_17_27_port, QN => n_1516);
   regs_r_reg_17_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N732, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_17_26_port, QN => n_1517);
   regs_r_reg_17_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N731, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_17_25_port, QN => n_1518);
   regs_r_reg_17_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N730, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_17_24_port, QN => n_1519);
   regs_r_reg_17_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N729, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_17_23_port, QN => n_1520);
   regs_r_reg_17_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N728, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_17_22_port, QN => n_1521);
   regs_r_reg_17_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N727, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_17_21_port, QN => n_1522);
   regs_r_reg_17_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N726, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_17_20_port, QN => n_1523);
   regs_r_reg_17_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N725, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_17_19_port, QN => n_1524);
   regs_r_reg_17_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N724, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_17_18_port, QN => n_1525);
   regs_r_reg_17_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N723, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_17_17_port, QN => n_1526);
   regs_r_reg_17_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N722, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_17_16_port, QN => n_1527);
   regs_r_reg_17_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N721, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_17_15_port, QN => n_1528);
   regs_r_reg_17_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N720, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_17_14_port, QN => n_1529);
   regs_r_reg_17_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N719, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_17_13_port, QN => n_1530);
   regs_r_reg_17_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N718, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_17_12_port, QN => n_1531);
   regs_r_reg_17_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N717, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_17_11_port, QN => n_1532);
   regs_r_reg_17_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N716, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_17_10_port, QN => n_1533);
   regs_r_reg_17_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N715, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_17_9_port, QN => n_1534);
   regs_r_reg_17_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N714, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_17_8_port, QN => n_1535);
   regs_r_reg_17_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N713, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_17_7_port, QN => n_1536);
   regs_r_reg_17_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N712, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_17_6_port, QN => n_1537);
   regs_r_reg_17_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N711, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_17_5_port, QN => n_1538);
   regs_r_reg_17_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N710, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_17_4_port, QN => n_1539);
   regs_r_reg_17_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N709, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_17_3_port, QN => n_1540);
   regs_r_reg_17_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N708, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_17_2_port, QN => n_1541);
   regs_r_reg_17_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N707, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_17_1_port, QN => n_1542);
   regs_r_reg_17_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N706, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_17_0_port, QN => n_1543);
   regs_r_reg_18_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N705, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_18_31_port, QN => n_1544);
   regs_r_reg_18_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N704, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_18_30_port, QN => n_1545);
   regs_r_reg_18_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N703, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_18_29_port, QN => n_1546);
   regs_r_reg_18_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N702, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_18_28_port, QN => n_1547);
   regs_r_reg_18_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N701, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_18_27_port, QN => n_1548);
   regs_r_reg_18_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N700, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_18_26_port, QN => n_1549);
   regs_r_reg_18_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N699, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_18_25_port, QN => n_1550);
   regs_r_reg_18_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N698, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_18_24_port, QN => n_1551);
   regs_r_reg_18_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N697, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_18_23_port, QN => n_1552);
   regs_r_reg_18_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N696, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_18_22_port, QN => n_1553);
   regs_r_reg_18_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N695, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_18_21_port, QN => n_1554);
   regs_r_reg_18_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N694, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_18_20_port, QN => n_1555);
   regs_r_reg_18_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N693, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_18_19_port, QN => n_1556);
   regs_r_reg_18_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N692, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_18_18_port, QN => n_1557);
   regs_r_reg_18_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N691, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_18_17_port, QN => n_1558);
   regs_r_reg_18_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N690, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_18_16_port, QN => n_1559);
   regs_r_reg_18_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N689, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_18_15_port, QN => n_1560);
   regs_r_reg_18_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N688, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_18_14_port, QN => n_1561);
   regs_r_reg_18_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N687, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_18_13_port, QN => n_1562);
   regs_r_reg_18_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N686, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_18_12_port, QN => n_1563);
   regs_r_reg_18_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N685, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_18_11_port, QN => n_1564);
   regs_r_reg_18_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N684, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_18_10_port, QN => n_1565);
   regs_r_reg_18_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N683, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_18_9_port, QN => n_1566);
   regs_r_reg_18_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N682, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_18_8_port, QN => n_1567);
   regs_r_reg_18_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N681, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_18_7_port, QN => n_1568);
   regs_r_reg_18_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N680, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_18_6_port, QN => n_1569);
   regs_r_reg_18_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N679, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_18_5_port, QN => n_1570);
   regs_r_reg_18_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N678, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_18_4_port, QN => n_1571);
   regs_r_reg_18_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N677, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_18_3_port, QN => n_1572);
   regs_r_reg_18_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N676, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_18_2_port, QN => n_1573);
   regs_r_reg_18_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N675, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_18_1_port, QN => n_1574);
   regs_r_reg_18_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N674, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_18_0_port, QN => n_1575);
   regs_r_reg_19_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N673, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_19_31_port, QN => n_1576);
   regs_r_reg_19_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N672, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_19_30_port, QN => n_1577);
   regs_r_reg_19_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N671, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_19_29_port, QN => n_1578);
   regs_r_reg_19_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N670, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_19_28_port, QN => n_1579);
   regs_r_reg_19_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N669, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_19_27_port, QN => n_1580);
   regs_r_reg_19_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N668, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_19_26_port, QN => n_1581);
   regs_r_reg_19_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N667, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_19_25_port, QN => n_1582);
   regs_r_reg_19_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N666, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_19_24_port, QN => n_1583);
   regs_r_reg_19_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N665, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_19_23_port, QN => n_1584);
   regs_r_reg_19_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N664, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_19_22_port, QN => n_1585);
   regs_r_reg_19_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N663, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_19_21_port, QN => n_1586);
   regs_r_reg_19_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N662, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_19_20_port, QN => n_1587);
   regs_r_reg_19_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N661, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_19_19_port, QN => n_1588);
   regs_r_reg_19_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N660, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_19_18_port, QN => n_1589);
   regs_r_reg_19_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N659, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_19_17_port, QN => n_1590);
   regs_r_reg_19_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N658, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_19_16_port, QN => n_1591);
   regs_r_reg_19_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N657, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_19_15_port, QN => n_1592);
   regs_r_reg_19_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N656, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_19_14_port, QN => n_1593);
   regs_r_reg_19_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N655, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_19_13_port, QN => n_1594);
   regs_r_reg_19_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N654, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_19_12_port, QN => n_1595);
   regs_r_reg_19_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N653, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_19_11_port, QN => n_1596);
   regs_r_reg_19_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N652, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_19_10_port, QN => n_1597);
   regs_r_reg_19_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N651, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_19_9_port, QN => n_1598);
   regs_r_reg_19_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N650, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_19_8_port, QN => n_1599);
   regs_r_reg_19_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N649, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_19_7_port, QN => n_1600);
   regs_r_reg_19_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N648, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_19_6_port, QN => n_1601);
   regs_r_reg_19_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N647, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_19_5_port, QN => n_1602);
   regs_r_reg_19_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N646, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_19_4_port, QN => n_1603);
   regs_r_reg_19_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N645, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_19_3_port, QN => n_1604);
   regs_r_reg_19_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N644, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_19_2_port, QN => n_1605);
   regs_r_reg_19_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N643, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_19_1_port, QN => n_1606);
   regs_r_reg_19_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N642, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_19_0_port, QN => n_1607);
   regs_r_reg_20_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N641, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_20_31_port, QN => n_1608);
   regs_r_reg_20_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N640, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_20_30_port, QN => n_1609);
   regs_r_reg_20_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N639, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_20_29_port, QN => n_1610);
   regs_r_reg_20_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N638, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_20_28_port, QN => n_1611);
   regs_r_reg_20_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N637, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_20_27_port, QN => n_1612);
   regs_r_reg_20_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N636, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_20_26_port, QN => n_1613);
   regs_r_reg_20_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N635, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_20_25_port, QN => n_1614);
   regs_r_reg_20_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N634, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_20_24_port, QN => n_1615);
   regs_r_reg_20_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N633, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_20_23_port, QN => n_1616);
   regs_r_reg_20_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N632, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_20_22_port, QN => n_1617);
   regs_r_reg_20_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N631, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_20_21_port, QN => n_1618);
   regs_r_reg_20_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N630, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_20_20_port, QN => n_1619);
   regs_r_reg_20_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N629, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_20_19_port, QN => n_1620);
   regs_r_reg_20_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N628, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_20_18_port, QN => n_1621);
   regs_r_reg_20_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N627, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_20_17_port, QN => n_1622);
   regs_r_reg_20_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N626, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_20_16_port, QN => n_1623);
   regs_r_reg_20_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N625, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_20_15_port, QN => n_1624);
   regs_r_reg_20_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N624, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_20_14_port, QN => n_1625);
   regs_r_reg_20_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N623, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_20_13_port, QN => n_1626);
   regs_r_reg_20_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N622, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_20_12_port, QN => n_1627);
   regs_r_reg_20_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N621, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_20_11_port, QN => n_1628);
   regs_r_reg_20_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N620, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_20_10_port, QN => n_1629);
   regs_r_reg_20_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N619, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_20_9_port, QN => n_1630);
   regs_r_reg_20_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N618, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_20_8_port, QN => n_1631);
   regs_r_reg_20_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N617, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_20_7_port, QN => n_1632);
   regs_r_reg_20_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N616, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_20_6_port, QN => n_1633);
   regs_r_reg_20_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N615, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_20_5_port, QN => n_1634);
   regs_r_reg_20_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N614, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_20_4_port, QN => n_1635);
   regs_r_reg_20_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N613, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_20_3_port, QN => n_1636);
   regs_r_reg_20_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N612, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_20_2_port, QN => n_1637);
   regs_r_reg_20_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N611, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_20_1_port, QN => n_1638);
   regs_r_reg_20_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N610, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_20_0_port, QN => n_1639);
   regs_r_reg_21_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N609, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_21_31_port, QN => n_1640);
   regs_r_reg_21_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N608, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_21_30_port, QN => n_1641);
   regs_r_reg_21_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N607, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_21_29_port, QN => n_1642);
   regs_r_reg_21_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N606, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_21_28_port, QN => n_1643);
   regs_r_reg_21_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N605, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_21_27_port, QN => n_1644);
   regs_r_reg_21_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N604, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_21_26_port, QN => n_1645);
   regs_r_reg_21_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N603, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_21_25_port, QN => n_1646);
   regs_r_reg_21_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N602, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_21_24_port, QN => n_1647);
   regs_r_reg_21_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N601, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_21_23_port, QN => n_1648);
   regs_r_reg_21_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N600, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_21_22_port, QN => n_1649);
   regs_r_reg_21_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N599, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_21_21_port, QN => n_1650);
   regs_r_reg_21_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N598, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_21_20_port, QN => n_1651);
   regs_r_reg_21_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N597, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_21_19_port, QN => n_1652);
   regs_r_reg_21_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N596, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_21_18_port, QN => n_1653);
   regs_r_reg_21_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N595, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_21_17_port, QN => n_1654);
   regs_r_reg_21_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N594, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_21_16_port, QN => n_1655);
   regs_r_reg_21_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N593, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_21_15_port, QN => n_1656);
   regs_r_reg_21_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N592, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_21_14_port, QN => n_1657);
   regs_r_reg_21_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N591, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_21_13_port, QN => n_1658);
   regs_r_reg_21_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N590, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_21_12_port, QN => n_1659);
   regs_r_reg_21_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N589, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_21_11_port, QN => n_1660);
   regs_r_reg_21_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N588, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_21_10_port, QN => n_1661);
   regs_r_reg_21_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N587, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_21_9_port, QN => n_1662);
   regs_r_reg_21_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N586, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_21_8_port, QN => n_1663);
   regs_r_reg_21_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N585, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_21_7_port, QN => n_1664);
   regs_r_reg_21_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N584, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_21_6_port, QN => n_1665);
   regs_r_reg_21_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N583, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_21_5_port, QN => n_1666);
   regs_r_reg_21_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N582, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_21_4_port, QN => n_1667);
   regs_r_reg_21_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N581, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_21_3_port, QN => n_1668);
   regs_r_reg_21_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N580, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_21_2_port, QN => n_1669);
   regs_r_reg_21_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N579, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_21_1_port, QN => n_1670);
   regs_r_reg_21_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N578, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_21_0_port, QN => n_1671);
   regs_r_reg_22_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N577, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_22_31_port, QN => n_1672);
   regs_r_reg_22_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N576, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_22_30_port, QN => n_1673);
   regs_r_reg_22_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N575, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_22_29_port, QN => n_1674);
   regs_r_reg_22_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N574, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_22_28_port, QN => n_1675);
   regs_r_reg_22_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N573, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_22_27_port, QN => n_1676);
   regs_r_reg_22_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N572, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_22_26_port, QN => n_1677);
   regs_r_reg_22_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N571, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_22_25_port, QN => n_1678);
   regs_r_reg_22_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N570, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_22_24_port, QN => n_1679);
   regs_r_reg_22_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N569, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_22_23_port, QN => n_1680);
   regs_r_reg_22_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N568, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_22_22_port, QN => n_1681);
   regs_r_reg_22_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N567, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_22_21_port, QN => n_1682);
   regs_r_reg_22_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N566, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_22_20_port, QN => n_1683);
   regs_r_reg_22_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N565, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_22_19_port, QN => n_1684);
   regs_r_reg_22_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N564, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_22_18_port, QN => n_1685);
   regs_r_reg_22_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N563, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_22_17_port, QN => n_1686);
   regs_r_reg_22_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N562, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_22_16_port, QN => n_1687);
   regs_r_reg_22_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N561, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_22_15_port, QN => n_1688);
   regs_r_reg_22_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N560, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_22_14_port, QN => n_1689);
   regs_r_reg_22_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N559, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_22_13_port, QN => n_1690);
   regs_r_reg_22_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N558, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_22_12_port, QN => n_1691);
   regs_r_reg_22_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N557, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_22_11_port, QN => n_1692);
   regs_r_reg_22_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N556, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_22_10_port, QN => n_1693);
   regs_r_reg_22_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N555, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_22_9_port, QN => n_1694);
   regs_r_reg_22_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N554, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_22_8_port, QN => n_1695);
   regs_r_reg_22_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N553, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_22_7_port, QN => n_1696);
   regs_r_reg_22_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N552, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_22_6_port, QN => n_1697);
   regs_r_reg_22_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N551, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_22_5_port, QN => n_1698);
   regs_r_reg_22_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N550, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_22_4_port, QN => n_1699);
   regs_r_reg_22_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N549, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_22_3_port, QN => n_1700);
   regs_r_reg_22_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N548, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_22_2_port, QN => n_1701);
   regs_r_reg_22_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N547, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_22_1_port, QN => n_1702);
   regs_r_reg_22_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N546, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_22_0_port, QN => n_1703);
   regs_r_reg_23_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N545, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_23_31_port, QN => n_1704);
   regs_r_reg_23_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N544, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_23_30_port, QN => n_1705);
   regs_r_reg_23_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N543, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_23_29_port, QN => n_1706);
   regs_r_reg_23_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N542, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_23_28_port, QN => n_1707);
   regs_r_reg_23_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N541, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_23_27_port, QN => n_1708);
   regs_r_reg_23_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N540, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_23_26_port, QN => n_1709);
   regs_r_reg_23_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N539, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_23_25_port, QN => n_1710);
   regs_r_reg_23_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N538, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_23_24_port, QN => n_1711);
   regs_r_reg_23_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N537, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_23_23_port, QN => n_1712);
   regs_r_reg_23_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N536, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_23_22_port, QN => n_1713);
   regs_r_reg_23_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N535, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_23_21_port, QN => n_1714);
   regs_r_reg_23_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N534, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_23_20_port, QN => n_1715);
   regs_r_reg_23_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N533, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_23_19_port, QN => n_1716);
   regs_r_reg_23_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N532, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_23_18_port, QN => n_1717);
   regs_r_reg_23_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N531, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_23_17_port, QN => n_1718);
   regs_r_reg_23_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N530, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_23_16_port, QN => n_1719);
   regs_r_reg_23_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N529, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_23_15_port, QN => n_1720);
   regs_r_reg_23_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N528, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_23_14_port, QN => n_1721);
   regs_r_reg_23_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N527, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_23_13_port, QN => n_1722);
   regs_r_reg_23_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N526, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_23_12_port, QN => n_1723);
   regs_r_reg_23_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N525, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_23_11_port, QN => n_1724);
   regs_r_reg_23_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N524, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_23_10_port, QN => n_1725);
   regs_r_reg_23_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N523, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_23_9_port, QN => n_1726);
   regs_r_reg_23_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N522, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_23_8_port, QN => n_1727);
   regs_r_reg_23_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N521, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_23_7_port, QN => n_1728);
   regs_r_reg_23_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N520, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_23_6_port, QN => n_1729);
   regs_r_reg_23_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N519, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_23_5_port, QN => n_1730);
   regs_r_reg_23_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N518, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_23_4_port, QN => n_1731);
   regs_r_reg_23_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N517, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_23_3_port, QN => n_1732);
   regs_r_reg_23_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N516, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_23_2_port, QN => n_1733);
   regs_r_reg_23_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N515, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_23_1_port, QN => n_1734);
   regs_r_reg_23_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N514, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_23_0_port, QN => n_1735);
   regs_r_reg_24_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N513, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_24_31_port, QN => n_1736);
   regs_r_reg_24_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N512, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_24_30_port, QN => n_1737);
   regs_r_reg_24_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N511, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_24_29_port, QN => n_1738);
   regs_r_reg_24_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N510, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_24_28_port, QN => n_1739);
   regs_r_reg_24_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N509, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_24_27_port, QN => n_1740);
   regs_r_reg_24_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N508, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_24_26_port, QN => n_1741);
   regs_r_reg_24_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N507, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_24_25_port, QN => n_1742);
   regs_r_reg_24_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N506, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_24_24_port, QN => n_1743);
   regs_r_reg_24_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N505, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_24_23_port, QN => n_1744);
   regs_r_reg_24_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N504, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_24_22_port, QN => n_1745);
   regs_r_reg_24_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N503, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_24_21_port, QN => n_1746);
   regs_r_reg_24_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N502, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_24_20_port, QN => n_1747);
   regs_r_reg_24_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N501, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_24_19_port, QN => n_1748);
   regs_r_reg_24_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N500, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_24_18_port, QN => n_1749);
   regs_r_reg_24_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N499, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_24_17_port, QN => n_1750);
   regs_r_reg_24_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N498, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_24_16_port, QN => n_1751);
   regs_r_reg_24_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N497, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_24_15_port, QN => n_1752);
   regs_r_reg_24_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N496, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_24_14_port, QN => n_1753);
   regs_r_reg_24_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N495, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_24_13_port, QN => n_1754);
   regs_r_reg_24_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N494, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_24_12_port, QN => n_1755);
   regs_r_reg_24_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N493, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_24_11_port, QN => n_1756);
   regs_r_reg_24_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N492, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_24_10_port, QN => n_1757);
   regs_r_reg_24_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N491, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_24_9_port, QN => n_1758);
   regs_r_reg_24_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N490, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_24_8_port, QN => n_1759);
   regs_r_reg_24_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N489, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_24_7_port, QN => n_1760);
   regs_r_reg_24_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N488, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_24_6_port, QN => n_1761);
   regs_r_reg_24_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N487, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_24_5_port, QN => n_1762);
   regs_r_reg_24_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N486, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_24_4_port, QN => n_1763);
   regs_r_reg_24_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N485, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_24_3_port, QN => n_1764);
   regs_r_reg_24_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N484, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_24_2_port, QN => n_1765);
   regs_r_reg_24_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N483, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_24_1_port, QN => n_1766);
   regs_r_reg_24_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N482, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_24_0_port, QN => n_1767);
   regs_r_reg_25_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N481, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_25_31_port, QN => n_1768);
   regs_r_reg_25_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N480, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_25_30_port, QN => n_1769);
   regs_r_reg_25_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N479, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_25_29_port, QN => n_1770);
   regs_r_reg_25_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N478, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_25_28_port, QN => n_1771);
   regs_r_reg_25_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N477, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_25_27_port, QN => n_1772);
   regs_r_reg_25_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N476, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_25_26_port, QN => n_1773);
   regs_r_reg_25_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N475, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_25_25_port, QN => n_1774);
   regs_r_reg_25_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N474, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_25_24_port, QN => n_1775);
   regs_r_reg_25_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N473, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_25_23_port, QN => n_1776);
   regs_r_reg_25_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N472, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_25_22_port, QN => n_1777);
   regs_r_reg_25_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N471, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_25_21_port, QN => n_1778);
   regs_r_reg_25_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N470, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_25_20_port, QN => n_1779);
   regs_r_reg_25_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N469, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_25_19_port, QN => n_1780);
   regs_r_reg_25_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N468, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_25_18_port, QN => n_1781);
   regs_r_reg_25_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N467, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_25_17_port, QN => n_1782);
   regs_r_reg_25_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N466, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_25_16_port, QN => n_1783);
   regs_r_reg_25_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N465, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_25_15_port, QN => n_1784);
   regs_r_reg_25_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N464, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_25_14_port, QN => n_1785);
   regs_r_reg_25_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N463, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_25_13_port, QN => n_1786);
   regs_r_reg_25_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N462, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_25_12_port, QN => n_1787);
   regs_r_reg_25_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N461, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_25_11_port, QN => n_1788);
   regs_r_reg_25_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N460, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_25_10_port, QN => n_1789);
   regs_r_reg_25_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N459, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_25_9_port, QN => n_1790);
   regs_r_reg_25_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N458, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_25_8_port, QN => n_1791);
   regs_r_reg_25_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N457, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_25_7_port, QN => n_1792);
   regs_r_reg_25_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N456, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_25_6_port, QN => n_1793);
   regs_r_reg_25_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N455, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_25_5_port, QN => n_1794);
   regs_r_reg_25_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N454, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_25_4_port, QN => n_1795);
   regs_r_reg_25_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N453, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_25_3_port, QN => n_1796);
   regs_r_reg_25_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N452, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_25_2_port, QN => n_1797);
   regs_r_reg_25_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N451, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_25_1_port, QN => n_1798);
   regs_r_reg_25_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N450, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_25_0_port, QN => n_1799);
   regs_r_reg_26_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N449, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_26_31_port, QN => n_1800);
   regs_r_reg_26_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N448, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_26_30_port, QN => n_1801);
   regs_r_reg_26_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N447, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_26_29_port, QN => n_1802);
   regs_r_reg_26_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N446, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_26_28_port, QN => n_1803);
   regs_r_reg_26_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N445, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_26_27_port, QN => n_1804);
   regs_r_reg_26_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N444, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_26_26_port, QN => n_1805);
   regs_r_reg_26_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N443, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_26_25_port, QN => n_1806);
   regs_r_reg_26_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N442, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_26_24_port, QN => n_1807);
   regs_r_reg_26_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N441, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_26_23_port, QN => n_1808);
   regs_r_reg_26_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N440, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_26_22_port, QN => n_1809);
   regs_r_reg_26_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N439, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_26_21_port, QN => n_1810);
   regs_r_reg_26_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N438, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_26_20_port, QN => n_1811);
   regs_r_reg_26_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N437, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_26_19_port, QN => n_1812);
   regs_r_reg_26_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N436, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_26_18_port, QN => n_1813);
   regs_r_reg_26_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N435, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_26_17_port, QN => n_1814);
   regs_r_reg_26_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N434, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_26_16_port, QN => n_1815);
   regs_r_reg_26_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N433, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_26_15_port, QN => n_1816);
   regs_r_reg_26_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N432, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_26_14_port, QN => n_1817);
   regs_r_reg_26_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N431, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_26_13_port, QN => n_1818);
   regs_r_reg_26_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N430, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_26_12_port, QN => n_1819);
   regs_r_reg_26_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N429, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_26_11_port, QN => n_1820);
   regs_r_reg_26_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N428, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_26_10_port, QN => n_1821);
   regs_r_reg_26_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N427, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_26_9_port, QN => n_1822);
   regs_r_reg_26_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N426, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_26_8_port, QN => n_1823);
   regs_r_reg_26_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N425, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_26_7_port, QN => n_1824);
   regs_r_reg_26_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N424, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_26_6_port, QN => n_1825);
   regs_r_reg_26_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N423, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_26_5_port, QN => n_1826);
   regs_r_reg_26_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N422, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_26_4_port, QN => n_1827);
   regs_r_reg_26_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N421, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_26_3_port, QN => n_1828);
   regs_r_reg_26_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N420, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_26_2_port, QN => n_1829);
   regs_r_reg_26_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N419, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_26_1_port, QN => n_1830);
   regs_r_reg_26_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N418, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_26_0_port, QN => n_1831);
   regs_r_reg_27_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N417, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_27_31_port, QN => n_1832);
   regs_r_reg_27_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N416, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_27_30_port, QN => n_1833);
   regs_r_reg_27_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N415, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_27_29_port, QN => n_1834);
   regs_r_reg_27_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N414, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_27_28_port, QN => n_1835);
   regs_r_reg_27_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N413, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_27_27_port, QN => n_1836);
   regs_r_reg_27_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N412, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_27_26_port, QN => n_1837);
   regs_r_reg_27_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N411, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_27_25_port, QN => n_1838);
   regs_r_reg_27_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N410, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_27_24_port, QN => n_1839);
   regs_r_reg_27_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N409, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_27_23_port, QN => n_1840);
   regs_r_reg_27_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N408, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_27_22_port, QN => n_1841);
   regs_r_reg_27_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N407, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_27_21_port, QN => n_1842);
   regs_r_reg_27_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N406, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_27_20_port, QN => n_1843);
   regs_r_reg_27_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N405, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_27_19_port, QN => n_1844);
   regs_r_reg_27_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N404, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_27_18_port, QN => n_1845);
   regs_r_reg_27_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N403, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_27_17_port, QN => n_1846);
   regs_r_reg_27_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N402, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_27_16_port, QN => n_1847);
   regs_r_reg_27_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N401, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_27_15_port, QN => n_1848);
   regs_r_reg_27_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N400, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_27_14_port, QN => n_1849);
   regs_r_reg_27_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N399, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_27_13_port, QN => n_1850);
   regs_r_reg_27_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N398, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_27_12_port, QN => n_1851);
   regs_r_reg_27_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N397, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_27_11_port, QN => n_1852);
   regs_r_reg_27_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N396, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_27_10_port, QN => n_1853);
   regs_r_reg_27_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N395, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_27_9_port, QN => n_1854);
   regs_r_reg_27_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N394, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_27_8_port, QN => n_1855);
   regs_r_reg_27_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N393, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_27_7_port, QN => n_1856);
   regs_r_reg_27_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N392, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_27_6_port, QN => n_1857);
   regs_r_reg_27_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N391, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_27_5_port, QN => n_1858);
   regs_r_reg_27_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N390, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_27_4_port, QN => n_1859);
   regs_r_reg_27_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N389, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_27_3_port, QN => n_1860);
   regs_r_reg_27_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N388, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_27_2_port, QN => n_1861);
   regs_r_reg_27_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N387, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_27_1_port, QN => n_1862);
   regs_r_reg_27_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N386, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_27_0_port, QN => n_1863);
   regs_r_reg_28_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N385, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_28_31_port, QN => n_1864);
   regs_r_reg_28_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N384, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_28_30_port, QN => n_1865);
   regs_r_reg_28_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N383, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_28_29_port, QN => n_1866);
   regs_r_reg_28_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N382, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_28_28_port, QN => n_1867);
   regs_r_reg_28_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N381, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_28_27_port, QN => n_1868);
   regs_r_reg_28_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N380, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_28_26_port, QN => n_1869);
   regs_r_reg_28_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N379, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_28_25_port, QN => n_1870);
   regs_r_reg_28_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N378, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_28_24_port, QN => n_1871);
   regs_r_reg_28_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N377, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_28_23_port, QN => n_1872);
   regs_r_reg_28_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N376, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_28_22_port, QN => n_1873);
   regs_r_reg_28_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N375, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_28_21_port, QN => n_1874);
   regs_r_reg_28_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N374, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_28_20_port, QN => n_1875);
   regs_r_reg_28_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N373, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_28_19_port, QN => n_1876);
   regs_r_reg_28_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N372, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_28_18_port, QN => n_1877);
   regs_r_reg_28_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N371, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_28_17_port, QN => n_1878);
   regs_r_reg_28_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N370, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_28_16_port, QN => n_1879);
   regs_r_reg_28_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N369, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_28_15_port, QN => n_1880);
   regs_r_reg_28_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N368, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_28_14_port, QN => n_1881);
   regs_r_reg_28_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N367, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_28_13_port, QN => n_1882);
   regs_r_reg_28_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N366, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_28_12_port, QN => n_1883);
   regs_r_reg_28_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N365, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_28_11_port, QN => n_1884);
   regs_r_reg_28_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N364, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_28_10_port, QN => n_1885);
   regs_r_reg_28_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N363, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_28_9_port, QN => n_1886);
   regs_r_reg_28_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N362, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_28_8_port, QN => n_1887);
   regs_r_reg_28_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N361, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_28_7_port, QN => n_1888);
   regs_r_reg_28_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N360, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_28_6_port, QN => n_1889);
   regs_r_reg_28_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N359, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_28_5_port, QN => n_1890);
   regs_r_reg_28_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N358, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_28_4_port, QN => n_1891);
   regs_r_reg_28_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N357, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_28_3_port, QN => n_1892);
   regs_r_reg_28_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N356, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_28_2_port, QN => n_1893);
   regs_r_reg_28_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N355, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_28_1_port, QN => n_1894);
   regs_r_reg_28_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N354, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_28_0_port, QN => n_1895);
   regs_r_reg_29_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N353, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_29_31_port, QN => n_1896);
   regs_r_reg_29_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N352, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_29_30_port, QN => n_1897);
   regs_r_reg_29_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N351, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_29_29_port, QN => n_1898);
   regs_r_reg_29_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N350, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_29_28_port, QN => n_1899);
   regs_r_reg_29_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N349, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_29_27_port, QN => n_1900);
   regs_r_reg_29_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N348, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_29_26_port, QN => n_1901);
   regs_r_reg_29_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N347, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_29_25_port, QN => n_1902);
   regs_r_reg_29_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N346, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_29_24_port, QN => n_1903);
   regs_r_reg_29_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N345, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_29_23_port, QN => n_1904);
   regs_r_reg_29_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N344, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_29_22_port, QN => n_1905);
   regs_r_reg_29_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N343, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_29_21_port, QN => n_1906);
   regs_r_reg_29_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N342, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_29_20_port, QN => n_1907);
   regs_r_reg_29_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N341, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_29_19_port, QN => n_1908);
   regs_r_reg_29_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N340, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_29_18_port, QN => n_1909);
   regs_r_reg_29_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N339, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_29_17_port, QN => n_1910);
   regs_r_reg_29_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N338, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_29_16_port, QN => n_1911);
   regs_r_reg_29_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N337, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_29_15_port, QN => n_1912);
   regs_r_reg_29_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N336, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_29_14_port, QN => n_1913);
   regs_r_reg_29_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N335, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_29_13_port, QN => n_1914);
   regs_r_reg_29_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N334, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_29_12_port, QN => n_1915);
   regs_r_reg_29_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N333, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_29_11_port, QN => n_1916);
   regs_r_reg_29_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N332, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_29_10_port, QN => n_1917);
   regs_r_reg_29_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N331, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_29_9_port, QN => n_1918);
   regs_r_reg_29_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N330, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_29_8_port, QN => n_1919);
   regs_r_reg_29_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N329, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_29_7_port, QN => n_1920);
   regs_r_reg_29_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N328, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_29_6_port, QN => n_1921);
   regs_r_reg_29_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N327, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_29_5_port, QN => n_1922);
   regs_r_reg_29_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N326, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_29_4_port, QN => n_1923);
   regs_r_reg_29_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N325, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_29_3_port, QN => n_1924);
   regs_r_reg_29_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N324, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_29_2_port, QN => n_1925);
   regs_r_reg_29_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N323, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_29_1_port, QN => n_1926);
   regs_r_reg_29_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N322, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_29_0_port, QN => n_1927);
   regs_r_reg_30_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N321, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_30_31_port, QN => n_1928);
   regs_r_reg_30_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N320, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_30_30_port, QN => n_1929);
   regs_r_reg_30_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N319, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_30_29_port, QN => n_1930);
   regs_r_reg_30_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N318, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_30_28_port, QN => n_1931);
   regs_r_reg_30_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N317, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_30_27_port, QN => n_1932);
   regs_r_reg_30_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N316, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_30_26_port, QN => n_1933);
   regs_r_reg_30_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N315, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_30_25_port, QN => n_1934);
   regs_r_reg_30_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N314, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_30_24_port, QN => n_1935);
   regs_r_reg_30_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N313, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_30_23_port, QN => n_1936);
   regs_r_reg_30_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N312, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_30_22_port, QN => n_1937);
   regs_r_reg_30_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N311, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_30_21_port, QN => n_1938);
   regs_r_reg_30_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N310, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_30_20_port, QN => n_1939);
   regs_r_reg_30_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N309, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_30_19_port, QN => n_1940);
   regs_r_reg_30_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N308, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_30_18_port, QN => n_1941);
   regs_r_reg_30_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N307, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_30_17_port, QN => n_1942);
   regs_r_reg_30_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N306, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_30_16_port, QN => n_1943);
   regs_r_reg_30_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N305, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_30_15_port, QN => n_1944);
   regs_r_reg_30_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N304, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_30_14_port, QN => n_1945);
   regs_r_reg_30_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N303, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_30_13_port, QN => n_1946);
   regs_r_reg_30_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N302, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_30_12_port, QN => n_1947);
   regs_r_reg_30_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N301, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_30_11_port, QN => n_1948);
   regs_r_reg_30_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N300, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_30_10_port, QN => n_1949);
   regs_r_reg_30_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N299, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_30_9_port, QN => n_1950);
   regs_r_reg_30_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N298, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_30_8_port, QN => n_1951);
   regs_r_reg_30_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N297, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_30_7_port, QN => n_1952);
   regs_r_reg_30_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N296, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_30_6_port, QN => n_1953);
   regs_r_reg_30_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N295, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_30_5_port, QN => n_1954);
   regs_r_reg_30_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N294, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_30_4_port, QN => n_1955);
   regs_r_reg_30_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N293, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_30_3_port, QN => n_1956);
   regs_r_reg_30_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N292, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_30_2_port, QN => n_1957);
   regs_r_reg_30_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N291, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_30_1_port, QN => n_1958);
   regs_r_reg_30_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N290, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_30_0_port, QN => n_1959);
   regs_r_reg_31_31_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N289, next_state => wdata_31_port
               , clocked_on => clk_port, Q => regs_r_31_31_port, QN => n_1960);
   regs_r_reg_31_30_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N288, next_state => wdata_30_port
               , clocked_on => clk_port, Q => regs_r_31_30_port, QN => n_1961);
   regs_r_reg_31_29_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N287, next_state => wdata_29_port
               , clocked_on => clk_port, Q => regs_r_31_29_port, QN => n_1962);
   regs_r_reg_31_28_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N286, next_state => wdata_28_port
               , clocked_on => clk_port, Q => regs_r_31_28_port, QN => n_1963);
   regs_r_reg_31_27_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N285, next_state => wdata_27_port
               , clocked_on => clk_port, Q => regs_r_31_27_port, QN => n_1964);
   regs_r_reg_31_26_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N284, next_state => wdata_26_port
               , clocked_on => clk_port, Q => regs_r_31_26_port, QN => n_1965);
   regs_r_reg_31_25_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N283, next_state => wdata_25_port
               , clocked_on => clk_port, Q => regs_r_31_25_port, QN => n_1966);
   regs_r_reg_31_24_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N282, next_state => wdata_24_port
               , clocked_on => clk_port, Q => regs_r_31_24_port, QN => n_1967);
   regs_r_reg_31_23_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N281, next_state => wdata_23_port
               , clocked_on => clk_port, Q => regs_r_31_23_port, QN => n_1968);
   regs_r_reg_31_22_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N280, next_state => wdata_22_port
               , clocked_on => clk_port, Q => regs_r_31_22_port, QN => n_1969);
   regs_r_reg_31_21_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N279, next_state => wdata_21_port
               , clocked_on => clk_port, Q => regs_r_31_21_port, QN => n_1970);
   regs_r_reg_31_20_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N278, next_state => wdata_20_port
               , clocked_on => clk_port, Q => regs_r_31_20_port, QN => n_1971);
   regs_r_reg_31_19_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N277, next_state => wdata_19_port
               , clocked_on => clk_port, Q => regs_r_31_19_port, QN => n_1972);
   regs_r_reg_31_18_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N276, next_state => wdata_18_port
               , clocked_on => clk_port, Q => regs_r_31_18_port, QN => n_1973);
   regs_r_reg_31_17_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N275, next_state => wdata_17_port
               , clocked_on => clk_port, Q => regs_r_31_17_port, QN => n_1974);
   regs_r_reg_31_16_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N274, next_state => wdata_16_port
               , clocked_on => clk_port, Q => regs_r_31_16_port, QN => n_1975);
   regs_r_reg_31_15_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N273, next_state => wdata_15_port
               , clocked_on => clk_port, Q => regs_r_31_15_port, QN => n_1976);
   regs_r_reg_31_14_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N272, next_state => wdata_14_port
               , clocked_on => clk_port, Q => regs_r_31_14_port, QN => n_1977);
   regs_r_reg_31_13_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N271, next_state => wdata_13_port
               , clocked_on => clk_port, Q => regs_r_31_13_port, QN => n_1978);
   regs_r_reg_31_12_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N270, next_state => wdata_12_port
               , clocked_on => clk_port, Q => regs_r_31_12_port, QN => n_1979);
   regs_r_reg_31_11_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N269, next_state => wdata_11_port
               , clocked_on => clk_port, Q => regs_r_31_11_port, QN => n_1980);
   regs_r_reg_31_10_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N268, next_state => wdata_10_port
               , clocked_on => clk_port, Q => regs_r_31_10_port, QN => n_1981);
   regs_r_reg_31_9_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N267, next_state => wdata_9_port,
               clocked_on => clk_port, Q => regs_r_31_9_port, QN => n_1982);
   regs_r_reg_31_8_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N266, next_state => wdata_8_port,
               clocked_on => clk_port, Q => regs_r_31_8_port, QN => n_1983);
   regs_r_reg_31_7_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N265, next_state => wdata_7_port,
               clocked_on => clk_port, Q => regs_r_31_7_port, QN => n_1984);
   regs_r_reg_31_6_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N264, next_state => wdata_6_port,
               clocked_on => clk_port, Q => regs_r_31_6_port, QN => n_1985);
   regs_r_reg_31_5_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N263, next_state => wdata_5_port,
               clocked_on => clk_port, Q => regs_r_31_5_port, QN => n_1986);
   regs_r_reg_31_4_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N262, next_state => wdata_4_port,
               clocked_on => clk_port, Q => regs_r_31_4_port, QN => n_1987);
   regs_r_reg_31_3_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N261, next_state => wdata_3_port,
               clocked_on => clk_port, Q => regs_r_31_3_port, QN => n_1988);
   regs_r_reg_31_2_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N260, next_state => wdata_2_port,
               clocked_on => clk_port, Q => regs_r_31_2_port, QN => n_1989);
   regs_r_reg_31_1_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N259, next_state => wdata_1_port,
               clocked_on => clk_port, Q => regs_r_31_1_port, QN => n_1990);
   regs_r_reg_31_0_inst : SYNOPSYS_BASIC_SEQUENTIAL_ELEMENT
         generic map ( ac_as_q => 1, ac_as_qn => 2, sc_ss_q => 5 )
         port map ( clear => N1376, preset => X_Logic0_port, enable => 
               X_Logic0_port, data_in => X_Logic0_port, synch_clear => 
               X_Logic0_port, synch_preset => X_Logic0_port, synch_toggle => 
               X_Logic0_port, synch_enable => N258, next_state => wdata_0_port,
               clocked_on => clk_port, Q => regs_r_31_0_port, QN => n_1991);
   I_0 : GTECH_NOT port map( A => rst0, Z => N1376);
   C4275 : GTECH_OR2 port map( A => rdRegNum1(3), B => rdRegNum1(4), Z => N1377
                           );
   C4276 : GTECH_OR2 port map( A => rdRegNum1(2), B => N1377, Z => N1378);
   C4277 : GTECH_OR2 port map( A => rdRegNum1(1), B => N1378, Z => N1379);
   C4278 : GTECH_OR2 port map( A => rdRegNum1(0), B => N1379, Z => N1380);
   I_1 : GTECH_NOT port map( A => N1380, Z => N1381);
   C4280 : GTECH_OR2 port map( A => rdRegNum2(3), B => rdRegNum2(4), Z => N1382
                           );
   C4281 : GTECH_OR2 port map( A => rdRegNum2(2), B => N1382, Z => N1383);
   C4282 : GTECH_OR2 port map( A => rdRegNum2(1), B => N1383, Z => N1384);
   C4283 : GTECH_OR2 port map( A => rdRegNum2(0), B => N1384, Z => N1385);
   I_2 : GTECH_NOT port map( A => N1385, Z => N1386);
   C4286 : GTECH_OR2 port map( A => wrRegNum(3), B => wrRegNum(4), Z => N1387);
   C4287 : GTECH_OR2 port map( A => wrRegNum(2), B => N1387, Z => N1388);
   C4288 : GTECH_OR2 port map( A => wrRegNum(1), B => N1388, Z => N1389);
   C4289 : GTECH_OR2 port map( A => wrRegNum(0), B => N1389, Z => N1390);
   C4356 : GTECH_AND2 port map( A => wrRegNum(3), B => wrRegNum(4), Z => N1391)
                           ;
   C4357 : GTECH_AND2 port map( A => N0, B => wrRegNum(4), Z => N1392);
   I_3 : GTECH_NOT port map( A => wrRegNum(3), Z => N0);
   C4358 : GTECH_AND2 port map( A => wrRegNum(3), B => N1, Z => N1393);
   I_4 : GTECH_NOT port map( A => wrRegNum(4), Z => N1);
   C4359 : GTECH_AND2 port map( A => N2, B => N3, Z => N1394);
   I_5 : GTECH_NOT port map( A => wrRegNum(3), Z => N2);
   I_6 : GTECH_NOT port map( A => wrRegNum(4), Z => N3);
   I_7 : GTECH_NOT port map( A => wrRegNum(2), Z => N1395);
   C4361 : GTECH_AND2 port map( A => wrRegNum(0), B => wrRegNum(1), Z => N1396)
                           ;
   C4362 : GTECH_AND2 port map( A => N4, B => wrRegNum(1), Z => N1397);
   I_8 : GTECH_NOT port map( A => wrRegNum(0), Z => N4);
   C4363 : GTECH_AND2 port map( A => wrRegNum(0), B => N5, Z => N1398);
   I_9 : GTECH_NOT port map( A => wrRegNum(1), Z => N5);
   C4364 : GTECH_AND2 port map( A => N6, B => N7, Z => N1399);
   I_10 : GTECH_NOT port map( A => wrRegNum(0), Z => N6);
   I_11 : GTECH_NOT port map( A => wrRegNum(1), Z => N7);
   C4365 : GTECH_AND2 port map( A => wrRegNum(2), B => N1396, Z => N1400);
   C4366 : GTECH_AND2 port map( A => wrRegNum(2), B => N1397, Z => N1401);
   C4367 : GTECH_AND2 port map( A => wrRegNum(2), B => N1398, Z => N1402);
   C4368 : GTECH_AND2 port map( A => wrRegNum(2), B => N1399, Z => N1403);
   C4369 : GTECH_AND2 port map( A => N1395, B => N1396, Z => N1404);
   C4370 : GTECH_AND2 port map( A => N1395, B => N1397, Z => N1405);
   C4371 : GTECH_AND2 port map( A => N1395, B => N1398, Z => N1406);
   C4372 : GTECH_AND2 port map( A => N1395, B => N1399, Z => N1407);
   C4373 : GTECH_AND2 port map( A => N1391, B => N1400, Z => N257);
   C4374 : GTECH_AND2 port map( A => N1391, B => N1401, Z => N256);
   C4375 : GTECH_AND2 port map( A => N1391, B => N1402, Z => N255);
   C4376 : GTECH_AND2 port map( A => N1391, B => N1403, Z => N254);
   C4377 : GTECH_AND2 port map( A => N1391, B => N1404, Z => N253);
   C4378 : GTECH_AND2 port map( A => N1391, B => N1405, Z => N252);
   C4379 : GTECH_AND2 port map( A => N1391, B => N1406, Z => N251);
   C4380 : GTECH_AND2 port map( A => N1391, B => N1407, Z => N250);
   C4381 : GTECH_AND2 port map( A => N1392, B => N1400, Z => N249);
   C4382 : GTECH_AND2 port map( A => N1392, B => N1401, Z => N248);
   C4383 : GTECH_AND2 port map( A => N1392, B => N1402, Z => N247);
   C4384 : GTECH_AND2 port map( A => N1392, B => N1403, Z => N246);
   C4385 : GTECH_AND2 port map( A => N1392, B => N1404, Z => N245);
   C4386 : GTECH_AND2 port map( A => N1392, B => N1405, Z => N244);
   C4387 : GTECH_AND2 port map( A => N1392, B => N1406, Z => N243);
   C4388 : GTECH_AND2 port map( A => N1392, B => N1407, Z => N242);
   C4389 : GTECH_AND2 port map( A => N1393, B => N1400, Z => N241);
   C4390 : GTECH_AND2 port map( A => N1393, B => N1401, Z => N240);
   C4391 : GTECH_AND2 port map( A => N1393, B => N1402, Z => N239);
   C4392 : GTECH_AND2 port map( A => N1393, B => N1403, Z => N238);
   C4393 : GTECH_AND2 port map( A => N1393, B => N1404, Z => N237);
   C4394 : GTECH_AND2 port map( A => N1393, B => N1405, Z => N236);
   C4395 : GTECH_AND2 port map( A => N1393, B => N1406, Z => N235);
   C4396 : GTECH_AND2 port map( A => N1393, B => N1407, Z => N234);
   C4397 : GTECH_AND2 port map( A => N1394, B => N1400, Z => N233);
   C4398 : GTECH_AND2 port map( A => N1394, B => N1401, Z => N232);
   C4399 : GTECH_AND2 port map( A => N1394, B => N1402, Z => N231);
   C4400 : GTECH_AND2 port map( A => N1394, B => N1403, Z => N230);
   C4401 : GTECH_AND2 port map( A => N1394, B => N1404, Z => N229);
   C4402 : GTECH_AND2 port map( A => N1394, B => N1405, Z => N228);
   C4403 : GTECH_AND2 port map( A => N1394, B => N1406, Z => N227);
   C4405 : GTECH_AND4 port map( A => N8, B => N9, C => N10, D => N11, Z => 
                           N1251);
   I_12 : GTECH_NOT port map( A => rdRegNum1(4), Z => N8);
   I_13 : GTECH_NOT port map( A => rdRegNum1(3), Z => N9);
   I_14 : GTECH_NOT port map( A => rdRegNum1(2), Z => N10);
   I_15 : GTECH_NOT port map( A => rdRegNum1(1), Z => N11);
   C4406 : GTECH_AND5 port map( A => rdRegNum1(4), B => N12, C => rdRegNum1(0),
                           D => N13, E => N14, Z => N1252);
   I_16 : GTECH_NOT port map( A => rdRegNum1(3), Z => N12);
   I_17 : GTECH_NOT port map( A => rdRegNum1(2), Z => N13);
   I_18 : GTECH_NOT port map( A => rdRegNum1(1), Z => N14);
   C4408 : GTECH_AND4 port map( A => N15, B => N16, C => N17, D => N18, Z => 
                           N1253);
   I_19 : GTECH_NOT port map( A => rdRegNum1(4), Z => N15);
   I_20 : GTECH_NOT port map( A => rdRegNum1(3), Z => N16);
   I_21 : GTECH_NOT port map( A => rdRegNum1(2), Z => N17);
   I_22 : GTECH_NOT port map( A => rdRegNum1(0), Z => N18);
   C4409 : GTECH_AND5 port map( A => N19, B => N20, C => rdRegNum1(0), D => N21
                           , E => rdRegNum1(1), Z => N1255);
   I_23 : GTECH_NOT port map( A => rdRegNum1(4), Z => N19);
   I_24 : GTECH_NOT port map( A => rdRegNum1(3), Z => N20);
   I_25 : GTECH_NOT port map( A => rdRegNum1(2), Z => N21);
   C4410 : GTECH_AND4 port map( A => N22, B => N23, C => N24, D => N25, Z => 
                           N1257);
   I_26 : GTECH_NOT port map( A => rdRegNum1(4), Z => N22);
   I_27 : GTECH_NOT port map( A => rdRegNum1(3), Z => N23);
   I_28 : GTECH_NOT port map( A => rdRegNum1(1), Z => N24);
   I_29 : GTECH_NOT port map( A => rdRegNum1(0), Z => N25);
   C4411 : GTECH_AND5 port map( A => N26, B => N27, C => rdRegNum1(0), D => 
                           rdRegNum1(2), E => N28, Z => N1259);
   I_30 : GTECH_NOT port map( A => rdRegNum1(4), Z => N26);
   I_31 : GTECH_NOT port map( A => rdRegNum1(3), Z => N27);
   I_32 : GTECH_NOT port map( A => rdRegNum1(1), Z => N28);
   C4412 : GTECH_AND5 port map( A => N29, B => N30, C => N31, D => rdRegNum1(2)
                           , E => rdRegNum1(1), Z => N1261);
   I_33 : GTECH_NOT port map( A => rdRegNum1(4), Z => N29);
   I_34 : GTECH_NOT port map( A => rdRegNum1(3), Z => N30);
   I_35 : GTECH_NOT port map( A => rdRegNum1(0), Z => N31);
   C4413 : GTECH_AND5 port map( A => N32, B => N33, C => rdRegNum1(0), D => 
                           rdRegNum1(2), E => rdRegNum1(1), Z => N1263);
   I_36 : GTECH_NOT port map( A => rdRegNum1(4), Z => N32);
   I_37 : GTECH_NOT port map( A => rdRegNum1(3), Z => N33);
   C4414 : GTECH_AND4 port map( A => N34, B => N35, C => N36, D => N37, Z => 
                           N1265);
   I_38 : GTECH_NOT port map( A => rdRegNum1(4), Z => N34);
   I_39 : GTECH_NOT port map( A => rdRegNum1(2), Z => N35);
   I_40 : GTECH_NOT port map( A => rdRegNum1(1), Z => N36);
   I_41 : GTECH_NOT port map( A => rdRegNum1(0), Z => N37);
   C4415 : GTECH_AND5 port map( A => N38, B => rdRegNum1(3), C => rdRegNum1(0),
                           D => N39, E => N40, Z => N1267);
   I_42 : GTECH_NOT port map( A => rdRegNum1(4), Z => N38);
   I_43 : GTECH_NOT port map( A => rdRegNum1(2), Z => N39);
   I_44 : GTECH_NOT port map( A => rdRegNum1(1), Z => N40);
   C4416 : GTECH_AND5 port map( A => N41, B => rdRegNum1(3), C => N42, D => N43
                           , E => rdRegNum1(1), Z => N1269);
   I_45 : GTECH_NOT port map( A => rdRegNum1(4), Z => N41);
   I_46 : GTECH_NOT port map( A => rdRegNum1(0), Z => N42);
   I_47 : GTECH_NOT port map( A => rdRegNum1(2), Z => N43);
   C4417 : GTECH_AND5 port map( A => N44, B => rdRegNum1(3), C => rdRegNum1(0),
                           D => N45, E => rdRegNum1(1), Z => N1271);
   I_48 : GTECH_NOT port map( A => rdRegNum1(4), Z => N44);
   I_49 : GTECH_NOT port map( A => rdRegNum1(2), Z => N45);
   C4418 : GTECH_AND5 port map( A => N46, B => rdRegNum1(3), C => N47, D => 
                           rdRegNum1(2), E => N48, Z => N1273);
   I_50 : GTECH_NOT port map( A => rdRegNum1(4), Z => N46);
   I_51 : GTECH_NOT port map( A => rdRegNum1(0), Z => N47);
   I_52 : GTECH_NOT port map( A => rdRegNum1(1), Z => N48);
   C4419 : GTECH_AND5 port map( A => N49, B => rdRegNum1(3), C => rdRegNum1(0),
                           D => rdRegNum1(2), E => N50, Z => N1275);
   I_53 : GTECH_NOT port map( A => rdRegNum1(4), Z => N49);
   I_54 : GTECH_NOT port map( A => rdRegNum1(1), Z => N50);
   C4420 : GTECH_AND5 port map( A => N51, B => rdRegNum1(3), C => N52, D => 
                           rdRegNum1(2), E => rdRegNum1(1), Z => N1277);
   I_55 : GTECH_NOT port map( A => rdRegNum1(4), Z => N51);
   I_56 : GTECH_NOT port map( A => rdRegNum1(0), Z => N52);
   C4421 : GTECH_AND5 port map( A => N53, B => rdRegNum1(3), C => rdRegNum1(0),
                           D => rdRegNum1(2), E => rdRegNum1(1), Z => N1279);
   I_57 : GTECH_NOT port map( A => rdRegNum1(4), Z => N53);
   C4422 : GTECH_AND4 port map( A => N54, B => N55, C => N56, D => N57, Z => 
                           N1250);
   I_58 : GTECH_NOT port map( A => rdRegNum1(3), Z => N54);
   I_59 : GTECH_NOT port map( A => rdRegNum1(2), Z => N55);
   I_60 : GTECH_NOT port map( A => rdRegNum1(1), Z => N56);
   I_61 : GTECH_NOT port map( A => rdRegNum1(0), Z => N57);
   C4423 : GTECH_AND5 port map( A => rdRegNum1(4), B => N58, C => N59, D => N60
                           , E => rdRegNum1(1), Z => N1254);
   I_62 : GTECH_NOT port map( A => rdRegNum1(3), Z => N58);
   I_63 : GTECH_NOT port map( A => rdRegNum1(0), Z => N59);
   I_64 : GTECH_NOT port map( A => rdRegNum1(2), Z => N60);
   C4424 : GTECH_AND5 port map( A => rdRegNum1(4), B => N61, C => rdRegNum1(0),
                           D => N62, E => rdRegNum1(1), Z => N1256);
   I_65 : GTECH_NOT port map( A => rdRegNum1(3), Z => N61);
   I_66 : GTECH_NOT port map( A => rdRegNum1(2), Z => N62);
   C4425 : GTECH_AND5 port map( A => rdRegNum1(4), B => N63, C => N64, D => 
                           rdRegNum1(2), E => N65, Z => N1258);
   I_67 : GTECH_NOT port map( A => rdRegNum1(3), Z => N63);
   I_68 : GTECH_NOT port map( A => rdRegNum1(0), Z => N64);
   I_69 : GTECH_NOT port map( A => rdRegNum1(1), Z => N65);
   C4426 : GTECH_AND5 port map( A => rdRegNum1(4), B => N66, C => rdRegNum1(0),
                           D => rdRegNum1(2), E => N67, Z => N1260);
   I_70 : GTECH_NOT port map( A => rdRegNum1(3), Z => N66);
   I_71 : GTECH_NOT port map( A => rdRegNum1(1), Z => N67);
   C4427 : GTECH_AND5 port map( A => rdRegNum1(4), B => N68, C => N69, D => 
                           rdRegNum1(2), E => rdRegNum1(1), Z => N1262);
   I_72 : GTECH_NOT port map( A => rdRegNum1(3), Z => N68);
   I_73 : GTECH_NOT port map( A => rdRegNum1(0), Z => N69);
   C4428 : GTECH_AND5 port map( A => rdRegNum1(4), B => N70, C => rdRegNum1(0),
                           D => rdRegNum1(2), E => rdRegNum1(1), Z => N1264);
   I_74 : GTECH_NOT port map( A => rdRegNum1(3), Z => N70);
   C4429 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => N71,
                           D => N72, E => N73, Z => N1266);
   I_75 : GTECH_NOT port map( A => rdRegNum1(0), Z => N71);
   I_76 : GTECH_NOT port map( A => rdRegNum1(2), Z => N72);
   I_77 : GTECH_NOT port map( A => rdRegNum1(1), Z => N73);
   C4430 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => 
                           rdRegNum1(0), D => N74, E => N75, Z => N1268);
   I_78 : GTECH_NOT port map( A => rdRegNum1(2), Z => N74);
   I_79 : GTECH_NOT port map( A => rdRegNum1(1), Z => N75);
   C4431 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => N76,
                           D => N77, E => rdRegNum1(1), Z => N1270);
   I_80 : GTECH_NOT port map( A => rdRegNum1(0), Z => N76);
   I_81 : GTECH_NOT port map( A => rdRegNum1(2), Z => N77);
   C4432 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => 
                           rdRegNum1(0), D => N78, E => rdRegNum1(1), Z => 
                           N1272);
   I_82 : GTECH_NOT port map( A => rdRegNum1(2), Z => N78);
   C4433 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => N79,
                           D => rdRegNum1(2), E => N80, Z => N1274);
   I_83 : GTECH_NOT port map( A => rdRegNum1(0), Z => N79);
   I_84 : GTECH_NOT port map( A => rdRegNum1(1), Z => N80);
   C4434 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => 
                           rdRegNum1(0), D => rdRegNum1(2), E => N81, Z => 
                           N1276);
   I_85 : GTECH_NOT port map( A => rdRegNum1(1), Z => N81);
   C4435 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => N82,
                           D => rdRegNum1(2), E => rdRegNum1(1), Z => N1278);
   I_86 : GTECH_NOT port map( A => rdRegNum1(0), Z => N82);
   C4436 : GTECH_AND5 port map( A => rdRegNum1(4), B => rdRegNum1(3), C => 
                           rdRegNum1(0), D => rdRegNum1(2), E => rdRegNum1(1), 
                           Z => N1280);
   C4437 : GTECH_AND4 port map( A => N83, B => N84, C => N85, D => N86, Z => 
                           N1314);
   I_87 : GTECH_NOT port map( A => rdRegNum2(4), Z => N83);
   I_88 : GTECH_NOT port map( A => rdRegNum2(3), Z => N84);
   I_89 : GTECH_NOT port map( A => rdRegNum2(2), Z => N85);
   I_90 : GTECH_NOT port map( A => rdRegNum2(1), Z => N86);
   C4438 : GTECH_AND5 port map( A => rdRegNum2(4), B => N87, C => rdRegNum2(0),
                           D => N88, E => N89, Z => N1315);
   I_91 : GTECH_NOT port map( A => rdRegNum2(3), Z => N87);
   I_92 : GTECH_NOT port map( A => rdRegNum2(2), Z => N88);
   I_93 : GTECH_NOT port map( A => rdRegNum2(1), Z => N89);
   C4440 : GTECH_AND4 port map( A => N90, B => N91, C => N92, D => N93, Z => 
                           N1316);
   I_94 : GTECH_NOT port map( A => rdRegNum2(4), Z => N90);
   I_95 : GTECH_NOT port map( A => rdRegNum2(3), Z => N91);
   I_96 : GTECH_NOT port map( A => rdRegNum2(2), Z => N92);
   I_97 : GTECH_NOT port map( A => rdRegNum2(0), Z => N93);
   C4441 : GTECH_AND5 port map( A => N94, B => N95, C => rdRegNum2(0), D => N96
                           , E => rdRegNum2(1), Z => N1318);
   I_98 : GTECH_NOT port map( A => rdRegNum2(4), Z => N94);
   I_99 : GTECH_NOT port map( A => rdRegNum2(3), Z => N95);
   I_100 : GTECH_NOT port map( A => rdRegNum2(2), Z => N96);
   C4442 : GTECH_AND4 port map( A => N97, B => N98, C => N99, D => N100, Z => 
                           N1320);
   I_101 : GTECH_NOT port map( A => rdRegNum2(4), Z => N97);
   I_102 : GTECH_NOT port map( A => rdRegNum2(3), Z => N98);
   I_103 : GTECH_NOT port map( A => rdRegNum2(1), Z => N99);
   I_104 : GTECH_NOT port map( A => rdRegNum2(0), Z => N100);
   C4443 : GTECH_AND5 port map( A => N101, B => N102, C => rdRegNum2(0), D => 
                           rdRegNum2(2), E => N103, Z => N1322);
   I_105 : GTECH_NOT port map( A => rdRegNum2(4), Z => N101);
   I_106 : GTECH_NOT port map( A => rdRegNum2(3), Z => N102);
   I_107 : GTECH_NOT port map( A => rdRegNum2(1), Z => N103);
   C4444 : GTECH_AND5 port map( A => N104, B => N105, C => N106, D => 
                           rdRegNum2(2), E => rdRegNum2(1), Z => N1324);
   I_108 : GTECH_NOT port map( A => rdRegNum2(4), Z => N104);
   I_109 : GTECH_NOT port map( A => rdRegNum2(3), Z => N105);
   I_110 : GTECH_NOT port map( A => rdRegNum2(0), Z => N106);
   C4445 : GTECH_AND5 port map( A => N107, B => N108, C => rdRegNum2(0), D => 
                           rdRegNum2(2), E => rdRegNum2(1), Z => N1326);
   I_111 : GTECH_NOT port map( A => rdRegNum2(4), Z => N107);
   I_112 : GTECH_NOT port map( A => rdRegNum2(3), Z => N108);
   C4446 : GTECH_AND4 port map( A => N109, B => N110, C => N111, D => N112, Z 
                           => N1328);
   I_113 : GTECH_NOT port map( A => rdRegNum2(4), Z => N109);
   I_114 : GTECH_NOT port map( A => rdRegNum2(2), Z => N110);
   I_115 : GTECH_NOT port map( A => rdRegNum2(1), Z => N111);
   I_116 : GTECH_NOT port map( A => rdRegNum2(0), Z => N112);
   C4447 : GTECH_AND5 port map( A => N113, B => rdRegNum2(3), C => rdRegNum2(0)
                           , D => N114, E => N115, Z => N1330);
   I_117 : GTECH_NOT port map( A => rdRegNum2(4), Z => N113);
   I_118 : GTECH_NOT port map( A => rdRegNum2(2), Z => N114);
   I_119 : GTECH_NOT port map( A => rdRegNum2(1), Z => N115);
   C4448 : GTECH_AND5 port map( A => N116, B => rdRegNum2(3), C => N117, D => 
                           N118, E => rdRegNum2(1), Z => N1332);
   I_120 : GTECH_NOT port map( A => rdRegNum2(4), Z => N116);
   I_121 : GTECH_NOT port map( A => rdRegNum2(0), Z => N117);
   I_122 : GTECH_NOT port map( A => rdRegNum2(2), Z => N118);
   C4449 : GTECH_AND5 port map( A => N119, B => rdRegNum2(3), C => rdRegNum2(0)
                           , D => N120, E => rdRegNum2(1), Z => N1334);
   I_123 : GTECH_NOT port map( A => rdRegNum2(4), Z => N119);
   I_124 : GTECH_NOT port map( A => rdRegNum2(2), Z => N120);
   C4450 : GTECH_AND5 port map( A => N121, B => rdRegNum2(3), C => N122, D => 
                           rdRegNum2(2), E => N123, Z => N1336);
   I_125 : GTECH_NOT port map( A => rdRegNum2(4), Z => N121);
   I_126 : GTECH_NOT port map( A => rdRegNum2(0), Z => N122);
   I_127 : GTECH_NOT port map( A => rdRegNum2(1), Z => N123);
   C4451 : GTECH_AND5 port map( A => N124, B => rdRegNum2(3), C => rdRegNum2(0)
                           , D => rdRegNum2(2), E => N125, Z => N1338);
   I_128 : GTECH_NOT port map( A => rdRegNum2(4), Z => N124);
   I_129 : GTECH_NOT port map( A => rdRegNum2(1), Z => N125);
   C4452 : GTECH_AND5 port map( A => N126, B => rdRegNum2(3), C => N127, D => 
                           rdRegNum2(2), E => rdRegNum2(1), Z => N1340);
   I_130 : GTECH_NOT port map( A => rdRegNum2(4), Z => N126);
   I_131 : GTECH_NOT port map( A => rdRegNum2(0), Z => N127);
   C4453 : GTECH_AND5 port map( A => N128, B => rdRegNum2(3), C => rdRegNum2(0)
                           , D => rdRegNum2(2), E => rdRegNum2(1), Z => N1342);
   I_132 : GTECH_NOT port map( A => rdRegNum2(4), Z => N128);
   C4454 : GTECH_AND4 port map( A => N129, B => N130, C => N131, D => N132, Z 
                           => N1313);
   I_133 : GTECH_NOT port map( A => rdRegNum2(3), Z => N129);
   I_134 : GTECH_NOT port map( A => rdRegNum2(2), Z => N130);
   I_135 : GTECH_NOT port map( A => rdRegNum2(1), Z => N131);
   I_136 : GTECH_NOT port map( A => rdRegNum2(0), Z => N132);
   C4455 : GTECH_AND5 port map( A => rdRegNum2(4), B => N133, C => N134, D => 
                           N135, E => rdRegNum2(1), Z => N1317);
   I_137 : GTECH_NOT port map( A => rdRegNum2(3), Z => N133);
   I_138 : GTECH_NOT port map( A => rdRegNum2(0), Z => N134);
   I_139 : GTECH_NOT port map( A => rdRegNum2(2), Z => N135);
   C4456 : GTECH_AND5 port map( A => rdRegNum2(4), B => N136, C => rdRegNum2(0)
                           , D => N137, E => rdRegNum2(1), Z => N1319);
   I_140 : GTECH_NOT port map( A => rdRegNum2(3), Z => N136);
   I_141 : GTECH_NOT port map( A => rdRegNum2(2), Z => N137);
   C4457 : GTECH_AND5 port map( A => rdRegNum2(4), B => N138, C => N139, D => 
                           rdRegNum2(2), E => N140, Z => N1321);
   I_142 : GTECH_NOT port map( A => rdRegNum2(3), Z => N138);
   I_143 : GTECH_NOT port map( A => rdRegNum2(0), Z => N139);
   I_144 : GTECH_NOT port map( A => rdRegNum2(1), Z => N140);
   C4458 : GTECH_AND5 port map( A => rdRegNum2(4), B => N141, C => rdRegNum2(0)
                           , D => rdRegNum2(2), E => N142, Z => N1323);
   I_145 : GTECH_NOT port map( A => rdRegNum2(3), Z => N141);
   I_146 : GTECH_NOT port map( A => rdRegNum2(1), Z => N142);
   C4459 : GTECH_AND5 port map( A => rdRegNum2(4), B => N143, C => N144, D => 
                           rdRegNum2(2), E => rdRegNum2(1), Z => N1325);
   I_147 : GTECH_NOT port map( A => rdRegNum2(3), Z => N143);
   I_148 : GTECH_NOT port map( A => rdRegNum2(0), Z => N144);
   C4460 : GTECH_AND5 port map( A => rdRegNum2(4), B => N145, C => rdRegNum2(0)
                           , D => rdRegNum2(2), E => rdRegNum2(1), Z => N1327);
   I_149 : GTECH_NOT port map( A => rdRegNum2(3), Z => N145);
   C4461 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => N146
                           , D => N147, E => N148, Z => N1329);
   I_150 : GTECH_NOT port map( A => rdRegNum2(0), Z => N146);
   I_151 : GTECH_NOT port map( A => rdRegNum2(2), Z => N147);
   I_152 : GTECH_NOT port map( A => rdRegNum2(1), Z => N148);
   C4462 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => 
                           rdRegNum2(0), D => N149, E => N150, Z => N1331);
   I_153 : GTECH_NOT port map( A => rdRegNum2(2), Z => N149);
   I_154 : GTECH_NOT port map( A => rdRegNum2(1), Z => N150);
   C4463 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => N151
                           , D => N152, E => rdRegNum2(1), Z => N1333);
   I_155 : GTECH_NOT port map( A => rdRegNum2(0), Z => N151);
   I_156 : GTECH_NOT port map( A => rdRegNum2(2), Z => N152);
   C4464 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => 
                           rdRegNum2(0), D => N153, E => rdRegNum2(1), Z => 
                           N1335);
   I_157 : GTECH_NOT port map( A => rdRegNum2(2), Z => N153);
   C4465 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => N154
                           , D => rdRegNum2(2), E => N155, Z => N1337);
   I_158 : GTECH_NOT port map( A => rdRegNum2(0), Z => N154);
   I_159 : GTECH_NOT port map( A => rdRegNum2(1), Z => N155);
   C4466 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => 
                           rdRegNum2(0), D => rdRegNum2(2), E => N156, Z => 
                           N1339);
   I_160 : GTECH_NOT port map( A => rdRegNum2(1), Z => N156);
   C4467 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => N157
                           , D => rdRegNum2(2), E => rdRegNum2(1), Z => N1341);
   I_161 : GTECH_NOT port map( A => rdRegNum2(0), Z => N157);
   C4468 : GTECH_AND5 port map( A => rdRegNum2(4), B => rdRegNum2(3), C => 
                           rdRegNum2(0), D => rdRegNum2(2), E => rdRegNum2(1), 
                           Z => N1343);
   C4469_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 992 )
      port map(
         -- Connections to port 'DATA1'
         DATA(991) => N227, DATA(990) => N227, DATA(989) => N227, DATA(988) => 
               N227, DATA(987) => N227, DATA(986) => N227, DATA(985) => N227, 
               DATA(984) => N227, DATA(983) => N227, DATA(982) => N227, 
               DATA(981) => N227, DATA(980) => N227, DATA(979) => N227, 
               DATA(978) => N227, DATA(977) => N227, DATA(976) => N227, 
               DATA(975) => N227, DATA(974) => N227, DATA(973) => N227, 
               DATA(972) => N227, DATA(971) => N227, DATA(970) => N227, 
               DATA(969) => N227, DATA(968) => N227, DATA(967) => N227, 
               DATA(966) => N227, DATA(965) => N227, DATA(964) => N227, 
               DATA(963) => N227, DATA(962) => N227, DATA(961) => N227, 
               DATA(960) => N227, DATA(959) => N228, DATA(958) => N228, 
               DATA(957) => N228, DATA(956) => N228, DATA(955) => N228, 
               DATA(954) => N228, DATA(953) => N228, DATA(952) => N228, 
               DATA(951) => N228, DATA(950) => N228, DATA(949) => N228, 
               DATA(948) => N228, DATA(947) => N228, DATA(946) => N228, 
               DATA(945) => N228, DATA(944) => N228, DATA(943) => N228, 
               DATA(942) => N228, DATA(941) => N228, DATA(940) => N228, 
               DATA(939) => N228, DATA(938) => N228, DATA(937) => N228, 
               DATA(936) => N228, DATA(935) => N228, DATA(934) => N228, 
               DATA(933) => N228, DATA(932) => N228, DATA(931) => N228, 
               DATA(930) => N228, DATA(929) => N228, DATA(928) => N228, 
               DATA(927) => N229, DATA(926) => N229, DATA(925) => N229, 
               DATA(924) => N229, DATA(923) => N229, DATA(922) => N229, 
               DATA(921) => N229, DATA(920) => N229, DATA(919) => N229, 
               DATA(918) => N229, DATA(917) => N229, DATA(916) => N229, 
               DATA(915) => N229, DATA(914) => N229, DATA(913) => N229, 
               DATA(912) => N229, DATA(911) => N229, DATA(910) => N229, 
               DATA(909) => N229, DATA(908) => N229, DATA(907) => N229, 
               DATA(906) => N229, DATA(905) => N229, DATA(904) => N229, 
               DATA(903) => N229, DATA(902) => N229, DATA(901) => N229, 
               DATA(900) => N229, DATA(899) => N229, DATA(898) => N229, 
               DATA(897) => N229, DATA(896) => N229, DATA(895) => N230, 
               DATA(894) => N230, DATA(893) => N230, DATA(892) => N230, 
               DATA(891) => N230, DATA(890) => N230, DATA(889) => N230, 
               DATA(888) => N230, DATA(887) => N230, DATA(886) => N230, 
               DATA(885) => N230, DATA(884) => N230, DATA(883) => N230, 
               DATA(882) => N230, DATA(881) => N230, DATA(880) => N230, 
               DATA(879) => N230, DATA(878) => N230, DATA(877) => N230, 
               DATA(876) => N230, DATA(875) => N230, DATA(874) => N230, 
               DATA(873) => N230, DATA(872) => N230, DATA(871) => N230, 
               DATA(870) => N230, DATA(869) => N230, DATA(868) => N230, 
               DATA(867) => N230, DATA(866) => N230, DATA(865) => N230, 
               DATA(864) => N230, DATA(863) => N231, DATA(862) => N231, 
               DATA(861) => N231, DATA(860) => N231, DATA(859) => N231, 
               DATA(858) => N231, DATA(857) => N231, DATA(856) => N231, 
               DATA(855) => N231, DATA(854) => N231, DATA(853) => N231, 
               DATA(852) => N231, DATA(851) => N231, DATA(850) => N231, 
               DATA(849) => N231, DATA(848) => N231, DATA(847) => N231, 
               DATA(846) => N231, DATA(845) => N231, DATA(844) => N231, 
               DATA(843) => N231, DATA(842) => N231, DATA(841) => N231, 
               DATA(840) => N231, DATA(839) => N231, DATA(838) => N231, 
               DATA(837) => N231, DATA(836) => N231, DATA(835) => N231, 
               DATA(834) => N231, DATA(833) => N231, DATA(832) => N231, 
               DATA(831) => N232, DATA(830) => N232, DATA(829) => N232, 
               DATA(828) => N232, DATA(827) => N232, DATA(826) => N232, 
               DATA(825) => N232, DATA(824) => N232, DATA(823) => N232, 
               DATA(822) => N232, DATA(821) => N232, DATA(820) => N232, 
               DATA(819) => N232, DATA(818) => N232, DATA(817) => N232, 
               DATA(816) => N232, DATA(815) => N232, DATA(814) => N232, 
               DATA(813) => N232, DATA(812) => N232, DATA(811) => N232, 
               DATA(810) => N232, DATA(809) => N232, DATA(808) => N232, 
               DATA(807) => N232, DATA(806) => N232, DATA(805) => N232, 
               DATA(804) => N232, DATA(803) => N232, DATA(802) => N232, 
               DATA(801) => N232, DATA(800) => N232, DATA(799) => N233, 
               DATA(798) => N233, DATA(797) => N233, DATA(796) => N233, 
               DATA(795) => N233, DATA(794) => N233, DATA(793) => N233, 
               DATA(792) => N233, DATA(791) => N233, DATA(790) => N233, 
               DATA(789) => N233, DATA(788) => N233, DATA(787) => N233, 
               DATA(786) => N233, DATA(785) => N233, DATA(784) => N233, 
               DATA(783) => N233, DATA(782) => N233, DATA(781) => N233, 
               DATA(780) => N233, DATA(779) => N233, DATA(778) => N233, 
               DATA(777) => N233, DATA(776) => N233, DATA(775) => N233, 
               DATA(774) => N233, DATA(773) => N233, DATA(772) => N233, 
               DATA(771) => N233, DATA(770) => N233, DATA(769) => N233, 
               DATA(768) => N233, DATA(767) => N234, DATA(766) => N234, 
               DATA(765) => N234, DATA(764) => N234, DATA(763) => N234, 
               DATA(762) => N234, DATA(761) => N234, DATA(760) => N234, 
               DATA(759) => N234, DATA(758) => N234, DATA(757) => N234, 
               DATA(756) => N234, DATA(755) => N234, DATA(754) => N234, 
               DATA(753) => N234, DATA(752) => N234, DATA(751) => N234, 
               DATA(750) => N234, DATA(749) => N234, DATA(748) => N234, 
               DATA(747) => N234, DATA(746) => N234, DATA(745) => N234, 
               DATA(744) => N234, DATA(743) => N234, DATA(742) => N234, 
               DATA(741) => N234, DATA(740) => N234, DATA(739) => N234, 
               DATA(738) => N234, DATA(737) => N234, DATA(736) => N234, 
               DATA(735) => N235, DATA(734) => N235, DATA(733) => N235, 
               DATA(732) => N235, DATA(731) => N235, DATA(730) => N235, 
               DATA(729) => N235, DATA(728) => N235, DATA(727) => N235, 
               DATA(726) => N235, DATA(725) => N235, DATA(724) => N235, 
               DATA(723) => N235, DATA(722) => N235, DATA(721) => N235, 
               DATA(720) => N235, DATA(719) => N235, DATA(718) => N235, 
               DATA(717) => N235, DATA(716) => N235, DATA(715) => N235, 
               DATA(714) => N235, DATA(713) => N235, DATA(712) => N235, 
               DATA(711) => N235, DATA(710) => N235, DATA(709) => N235, 
               DATA(708) => N235, DATA(707) => N235, DATA(706) => N235, 
               DATA(705) => N235, DATA(704) => N235, DATA(703) => N236, 
               DATA(702) => N236, DATA(701) => N236, DATA(700) => N236, 
               DATA(699) => N236, DATA(698) => N236, DATA(697) => N236, 
               DATA(696) => N236, DATA(695) => N236, DATA(694) => N236, 
               DATA(693) => N236, DATA(692) => N236, DATA(691) => N236, 
               DATA(690) => N236, DATA(689) => N236, DATA(688) => N236, 
               DATA(687) => N236, DATA(686) => N236, DATA(685) => N236, 
               DATA(684) => N236, DATA(683) => N236, DATA(682) => N236, 
               DATA(681) => N236, DATA(680) => N236, DATA(679) => N236, 
               DATA(678) => N236, DATA(677) => N236, DATA(676) => N236, 
               DATA(675) => N236, DATA(674) => N236, DATA(673) => N236, 
               DATA(672) => N236, DATA(671) => N237, DATA(670) => N237, 
               DATA(669) => N237, DATA(668) => N237, DATA(667) => N237, 
               DATA(666) => N237, DATA(665) => N237, DATA(664) => N237, 
               DATA(663) => N237, DATA(662) => N237, DATA(661) => N237, 
               DATA(660) => N237, DATA(659) => N237, DATA(658) => N237, 
               DATA(657) => N237, DATA(656) => N237, DATA(655) => N237, 
               DATA(654) => N237, DATA(653) => N237, DATA(652) => N237, 
               DATA(651) => N237, DATA(650) => N237, DATA(649) => N237, 
               DATA(648) => N237, DATA(647) => N237, DATA(646) => N237, 
               DATA(645) => N237, DATA(644) => N237, DATA(643) => N237, 
               DATA(642) => N237, DATA(641) => N237, DATA(640) => N237, 
               DATA(639) => N238, DATA(638) => N238, DATA(637) => N238, 
               DATA(636) => N238, DATA(635) => N238, DATA(634) => N238, 
               DATA(633) => N238, DATA(632) => N238, DATA(631) => N238, 
               DATA(630) => N238, DATA(629) => N238, DATA(628) => N238, 
               DATA(627) => N238, DATA(626) => N238, DATA(625) => N238, 
               DATA(624) => N238, DATA(623) => N238, DATA(622) => N238, 
               DATA(621) => N238, DATA(620) => N238, DATA(619) => N238, 
               DATA(618) => N238, DATA(617) => N238, DATA(616) => N238, 
               DATA(615) => N238, DATA(614) => N238, DATA(613) => N238, 
               DATA(612) => N238, DATA(611) => N238, DATA(610) => N238, 
               DATA(609) => N238, DATA(608) => N238, DATA(607) => N239, 
               DATA(606) => N239, DATA(605) => N239, DATA(604) => N239, 
               DATA(603) => N239, DATA(602) => N239, DATA(601) => N239, 
               DATA(600) => N239, DATA(599) => N239, DATA(598) => N239, 
               DATA(597) => N239, DATA(596) => N239, DATA(595) => N239, 
               DATA(594) => N239, DATA(593) => N239, DATA(592) => N239, 
               DATA(591) => N239, DATA(590) => N239, DATA(589) => N239, 
               DATA(588) => N239, DATA(587) => N239, DATA(586) => N239, 
               DATA(585) => N239, DATA(584) => N239, DATA(583) => N239, 
               DATA(582) => N239, DATA(581) => N239, DATA(580) => N239, 
               DATA(579) => N239, DATA(578) => N239, DATA(577) => N239, 
               DATA(576) => N239, DATA(575) => N240, DATA(574) => N240, 
               DATA(573) => N240, DATA(572) => N240, DATA(571) => N240, 
               DATA(570) => N240, DATA(569) => N240, DATA(568) => N240, 
               DATA(567) => N240, DATA(566) => N240, DATA(565) => N240, 
               DATA(564) => N240, DATA(563) => N240, DATA(562) => N240, 
               DATA(561) => N240, DATA(560) => N240, DATA(559) => N240, 
               DATA(558) => N240, DATA(557) => N240, DATA(556) => N240, 
               DATA(555) => N240, DATA(554) => N240, DATA(553) => N240, 
               DATA(552) => N240, DATA(551) => N240, DATA(550) => N240, 
               DATA(549) => N240, DATA(548) => N240, DATA(547) => N240, 
               DATA(546) => N240, DATA(545) => N240, DATA(544) => N240, 
               DATA(543) => N241, DATA(542) => N241, DATA(541) => N241, 
               DATA(540) => N241, DATA(539) => N241, DATA(538) => N241, 
               DATA(537) => N241, DATA(536) => N241, DATA(535) => N241, 
               DATA(534) => N241, DATA(533) => N241, DATA(532) => N241, 
               DATA(531) => N241, DATA(530) => N241, DATA(529) => N241, 
               DATA(528) => N241, DATA(527) => N241, DATA(526) => N241, 
               DATA(525) => N241, DATA(524) => N241, DATA(523) => N241, 
               DATA(522) => N241, DATA(521) => N241, DATA(520) => N241, 
               DATA(519) => N241, DATA(518) => N241, DATA(517) => N241, 
               DATA(516) => N241, DATA(515) => N241, DATA(514) => N241, 
               DATA(513) => N241, DATA(512) => N241, DATA(511) => N242, 
               DATA(510) => N242, DATA(509) => N242, DATA(508) => N242, 
               DATA(507) => N242, DATA(506) => N242, DATA(505) => N242, 
               DATA(504) => N242, DATA(503) => N242, DATA(502) => N242, 
               DATA(501) => N242, DATA(500) => N242, DATA(499) => N242, 
               DATA(498) => N242, DATA(497) => N242, DATA(496) => N242, 
               DATA(495) => N242, DATA(494) => N242, DATA(493) => N242, 
               DATA(492) => N242, DATA(491) => N242, DATA(490) => N242, 
               DATA(489) => N242, DATA(488) => N242, DATA(487) => N242, 
               DATA(486) => N242, DATA(485) => N242, DATA(484) => N242, 
               DATA(483) => N242, DATA(482) => N242, DATA(481) => N242, 
               DATA(480) => N242, DATA(479) => N243, DATA(478) => N243, 
               DATA(477) => N243, DATA(476) => N243, DATA(475) => N243, 
               DATA(474) => N243, DATA(473) => N243, DATA(472) => N243, 
               DATA(471) => N243, DATA(470) => N243, DATA(469) => N243, 
               DATA(468) => N243, DATA(467) => N243, DATA(466) => N243, 
               DATA(465) => N243, DATA(464) => N243, DATA(463) => N243, 
               DATA(462) => N243, DATA(461) => N243, DATA(460) => N243, 
               DATA(459) => N243, DATA(458) => N243, DATA(457) => N243, 
               DATA(456) => N243, DATA(455) => N243, DATA(454) => N243, 
               DATA(453) => N243, DATA(452) => N243, DATA(451) => N243, 
               DATA(450) => N243, DATA(449) => N243, DATA(448) => N243, 
               DATA(447) => N244, DATA(446) => N244, DATA(445) => N244, 
               DATA(444) => N244, DATA(443) => N244, DATA(442) => N244, 
               DATA(441) => N244, DATA(440) => N244, DATA(439) => N244, 
               DATA(438) => N244, DATA(437) => N244, DATA(436) => N244, 
               DATA(435) => N244, DATA(434) => N244, DATA(433) => N244, 
               DATA(432) => N244, DATA(431) => N244, DATA(430) => N244, 
               DATA(429) => N244, DATA(428) => N244, DATA(427) => N244, 
               DATA(426) => N244, DATA(425) => N244, DATA(424) => N244, 
               DATA(423) => N244, DATA(422) => N244, DATA(421) => N244, 
               DATA(420) => N244, DATA(419) => N244, DATA(418) => N244, 
               DATA(417) => N244, DATA(416) => N244, DATA(415) => N245, 
               DATA(414) => N245, DATA(413) => N245, DATA(412) => N245, 
               DATA(411) => N245, DATA(410) => N245, DATA(409) => N245, 
               DATA(408) => N245, DATA(407) => N245, DATA(406) => N245, 
               DATA(405) => N245, DATA(404) => N245, DATA(403) => N245, 
               DATA(402) => N245, DATA(401) => N245, DATA(400) => N245, 
               DATA(399) => N245, DATA(398) => N245, DATA(397) => N245, 
               DATA(396) => N245, DATA(395) => N245, DATA(394) => N245, 
               DATA(393) => N245, DATA(392) => N245, DATA(391) => N245, 
               DATA(390) => N245, DATA(389) => N245, DATA(388) => N245, 
               DATA(387) => N245, DATA(386) => N245, DATA(385) => N245, 
               DATA(384) => N245, DATA(383) => N246, DATA(382) => N246, 
               DATA(381) => N246, DATA(380) => N246, DATA(379) => N246, 
               DATA(378) => N246, DATA(377) => N246, DATA(376) => N246, 
               DATA(375) => N246, DATA(374) => N246, DATA(373) => N246, 
               DATA(372) => N246, DATA(371) => N246, DATA(370) => N246, 
               DATA(369) => N246, DATA(368) => N246, DATA(367) => N246, 
               DATA(366) => N246, DATA(365) => N246, DATA(364) => N246, 
               DATA(363) => N246, DATA(362) => N246, DATA(361) => N246, 
               DATA(360) => N246, DATA(359) => N246, DATA(358) => N246, 
               DATA(357) => N246, DATA(356) => N246, DATA(355) => N246, 
               DATA(354) => N246, DATA(353) => N246, DATA(352) => N246, 
               DATA(351) => N247, DATA(350) => N247, DATA(349) => N247, 
               DATA(348) => N247, DATA(347) => N247, DATA(346) => N247, 
               DATA(345) => N247, DATA(344) => N247, DATA(343) => N247, 
               DATA(342) => N247, DATA(341) => N247, DATA(340) => N247, 
               DATA(339) => N247, DATA(338) => N247, DATA(337) => N247, 
               DATA(336) => N247, DATA(335) => N247, DATA(334) => N247, 
               DATA(333) => N247, DATA(332) => N247, DATA(331) => N247, 
               DATA(330) => N247, DATA(329) => N247, DATA(328) => N247, 
               DATA(327) => N247, DATA(326) => N247, DATA(325) => N247, 
               DATA(324) => N247, DATA(323) => N247, DATA(322) => N247, 
               DATA(321) => N247, DATA(320) => N247, DATA(319) => N248, 
               DATA(318) => N248, DATA(317) => N248, DATA(316) => N248, 
               DATA(315) => N248, DATA(314) => N248, DATA(313) => N248, 
               DATA(312) => N248, DATA(311) => N248, DATA(310) => N248, 
               DATA(309) => N248, DATA(308) => N248, DATA(307) => N248, 
               DATA(306) => N248, DATA(305) => N248, DATA(304) => N248, 
               DATA(303) => N248, DATA(302) => N248, DATA(301) => N248, 
               DATA(300) => N248, DATA(299) => N248, DATA(298) => N248, 
               DATA(297) => N248, DATA(296) => N248, DATA(295) => N248, 
               DATA(294) => N248, DATA(293) => N248, DATA(292) => N248, 
               DATA(291) => N248, DATA(290) => N248, DATA(289) => N248, 
               DATA(288) => N248, DATA(287) => N249, DATA(286) => N249, 
               DATA(285) => N249, DATA(284) => N249, DATA(283) => N249, 
               DATA(282) => N249, DATA(281) => N249, DATA(280) => N249, 
               DATA(279) => N249, DATA(278) => N249, DATA(277) => N249, 
               DATA(276) => N249, DATA(275) => N249, DATA(274) => N249, 
               DATA(273) => N249, DATA(272) => N249, DATA(271) => N249, 
               DATA(270) => N249, DATA(269) => N249, DATA(268) => N249, 
               DATA(267) => N249, DATA(266) => N249, DATA(265) => N249, 
               DATA(264) => N249, DATA(263) => N249, DATA(262) => N249, 
               DATA(261) => N249, DATA(260) => N249, DATA(259) => N249, 
               DATA(258) => N249, DATA(257) => N249, DATA(256) => N249, 
               DATA(255) => N250, DATA(254) => N250, DATA(253) => N250, 
               DATA(252) => N250, DATA(251) => N250, DATA(250) => N250, 
               DATA(249) => N250, DATA(248) => N250, DATA(247) => N250, 
               DATA(246) => N250, DATA(245) => N250, DATA(244) => N250, 
               DATA(243) => N250, DATA(242) => N250, DATA(241) => N250, 
               DATA(240) => N250, DATA(239) => N250, DATA(238) => N250, 
               DATA(237) => N250, DATA(236) => N250, DATA(235) => N250, 
               DATA(234) => N250, DATA(233) => N250, DATA(232) => N250, 
               DATA(231) => N250, DATA(230) => N250, DATA(229) => N250, 
               DATA(228) => N250, DATA(227) => N250, DATA(226) => N250, 
               DATA(225) => N250, DATA(224) => N250, DATA(223) => N251, 
               DATA(222) => N251, DATA(221) => N251, DATA(220) => N251, 
               DATA(219) => N251, DATA(218) => N251, DATA(217) => N251, 
               DATA(216) => N251, DATA(215) => N251, DATA(214) => N251, 
               DATA(213) => N251, DATA(212) => N251, DATA(211) => N251, 
               DATA(210) => N251, DATA(209) => N251, DATA(208) => N251, 
               DATA(207) => N251, DATA(206) => N251, DATA(205) => N251, 
               DATA(204) => N251, DATA(203) => N251, DATA(202) => N251, 
               DATA(201) => N251, DATA(200) => N251, DATA(199) => N251, 
               DATA(198) => N251, DATA(197) => N251, DATA(196) => N251, 
               DATA(195) => N251, DATA(194) => N251, DATA(193) => N251, 
               DATA(192) => N251, DATA(191) => N252, DATA(190) => N252, 
               DATA(189) => N252, DATA(188) => N252, DATA(187) => N252, 
               DATA(186) => N252, DATA(185) => N252, DATA(184) => N252, 
               DATA(183) => N252, DATA(182) => N252, DATA(181) => N252, 
               DATA(180) => N252, DATA(179) => N252, DATA(178) => N252, 
               DATA(177) => N252, DATA(176) => N252, DATA(175) => N252, 
               DATA(174) => N252, DATA(173) => N252, DATA(172) => N252, 
               DATA(171) => N252, DATA(170) => N252, DATA(169) => N252, 
               DATA(168) => N252, DATA(167) => N252, DATA(166) => N252, 
               DATA(165) => N252, DATA(164) => N252, DATA(163) => N252, 
               DATA(162) => N252, DATA(161) => N252, DATA(160) => N252, 
               DATA(159) => N253, DATA(158) => N253, DATA(157) => N253, 
               DATA(156) => N253, DATA(155) => N253, DATA(154) => N253, 
               DATA(153) => N253, DATA(152) => N253, DATA(151) => N253, 
               DATA(150) => N253, DATA(149) => N253, DATA(148) => N253, 
               DATA(147) => N253, DATA(146) => N253, DATA(145) => N253, 
               DATA(144) => N253, DATA(143) => N253, DATA(142) => N253, 
               DATA(141) => N253, DATA(140) => N253, DATA(139) => N253, 
               DATA(138) => N253, DATA(137) => N253, DATA(136) => N253, 
               DATA(135) => N253, DATA(134) => N253, DATA(133) => N253, 
               DATA(132) => N253, DATA(131) => N253, DATA(130) => N253, 
               DATA(129) => N253, DATA(128) => N253, DATA(127) => N254, 
               DATA(126) => N254, DATA(125) => N254, DATA(124) => N254, 
               DATA(123) => N254, DATA(122) => N254, DATA(121) => N254, 
               DATA(120) => N254, DATA(119) => N254, DATA(118) => N254, 
               DATA(117) => N254, DATA(116) => N254, DATA(115) => N254, 
               DATA(114) => N254, DATA(113) => N254, DATA(112) => N254, 
               DATA(111) => N254, DATA(110) => N254, DATA(109) => N254, 
               DATA(108) => N254, DATA(107) => N254, DATA(106) => N254, 
               DATA(105) => N254, DATA(104) => N254, DATA(103) => N254, 
               DATA(102) => N254, DATA(101) => N254, DATA(100) => N254, 
               DATA(99) => N254, DATA(98) => N254, DATA(97) => N254, DATA(96) 
               => N254, DATA(95) => N255, DATA(94) => N255, DATA(93) => N255, 
               DATA(92) => N255, DATA(91) => N255, DATA(90) => N255, DATA(89) 
               => N255, DATA(88) => N255, DATA(87) => N255, DATA(86) => N255, 
               DATA(85) => N255, DATA(84) => N255, DATA(83) => N255, DATA(82) 
               => N255, DATA(81) => N255, DATA(80) => N255, DATA(79) => N255, 
               DATA(78) => N255, DATA(77) => N255, DATA(76) => N255, DATA(75) 
               => N255, DATA(74) => N255, DATA(73) => N255, DATA(72) => N255, 
               DATA(71) => N255, DATA(70) => N255, DATA(69) => N255, DATA(68) 
               => N255, DATA(67) => N255, DATA(66) => N255, DATA(65) => N255, 
               DATA(64) => N255, DATA(63) => N256, DATA(62) => N256, DATA(61) 
               => N256, DATA(60) => N256, DATA(59) => N256, DATA(58) => N256, 
               DATA(57) => N256, DATA(56) => N256, DATA(55) => N256, DATA(54) 
               => N256, DATA(53) => N256, DATA(52) => N256, DATA(51) => N256, 
               DATA(50) => N256, DATA(49) => N256, DATA(48) => N256, DATA(47) 
               => N256, DATA(46) => N256, DATA(45) => N256, DATA(44) => N256, 
               DATA(43) => N256, DATA(42) => N256, DATA(41) => N256, DATA(40) 
               => N256, DATA(39) => N256, DATA(38) => N256, DATA(37) => N256, 
               DATA(36) => N256, DATA(35) => N256, DATA(34) => N256, DATA(33) 
               => N256, DATA(32) => N256, DATA(31) => N257, DATA(30) => N257, 
               DATA(29) => N257, DATA(28) => N257, DATA(27) => N257, DATA(26) 
               => N257, DATA(25) => N257, DATA(24) => N257, DATA(23) => N257, 
               DATA(22) => N257, DATA(21) => N257, DATA(20) => N257, DATA(19) 
               => N257, DATA(18) => N257, DATA(17) => N257, DATA(16) => N257, 
               DATA(15) => N257, DATA(14) => N257, DATA(13) => N257, DATA(12) 
               => N257, DATA(11) => N257, DATA(10) => N257, DATA(9) => N257, 
               DATA(8) => N257, DATA(7) => N257, DATA(6) => N257, DATA(5) => 
               N257, DATA(4) => N257, DATA(3) => N257, DATA(2) => N257, DATA(1)
               => N257, DATA(0) => N257, 
         -- Connections to port 'DATA2'
         DATA(1983) => X_Logic0_port, DATA(1982) => X_Logic0_port, DATA(1981) 
               => X_Logic0_port, DATA(1980) => X_Logic0_port, DATA(1979) => 
               X_Logic0_port, DATA(1978) => X_Logic0_port, DATA(1977) => 
               X_Logic0_port, DATA(1976) => X_Logic0_port, DATA(1975) => 
               X_Logic0_port, DATA(1974) => X_Logic0_port, DATA(1973) => 
               X_Logic0_port, DATA(1972) => X_Logic0_port, DATA(1971) => 
               X_Logic0_port, DATA(1970) => X_Logic0_port, DATA(1969) => 
               X_Logic0_port, DATA(1968) => X_Logic0_port, DATA(1967) => 
               X_Logic0_port, DATA(1966) => X_Logic0_port, DATA(1965) => 
               X_Logic0_port, DATA(1964) => X_Logic0_port, DATA(1963) => 
               X_Logic0_port, DATA(1962) => X_Logic0_port, DATA(1961) => 
               X_Logic0_port, DATA(1960) => X_Logic0_port, DATA(1959) => 
               X_Logic0_port, DATA(1958) => X_Logic0_port, DATA(1957) => 
               X_Logic0_port, DATA(1956) => X_Logic0_port, DATA(1955) => 
               X_Logic0_port, DATA(1954) => X_Logic0_port, DATA(1953) => 
               X_Logic0_port, DATA(1952) => X_Logic0_port, DATA(1951) => 
               X_Logic0_port, DATA(1950) => X_Logic0_port, DATA(1949) => 
               X_Logic0_port, DATA(1948) => X_Logic0_port, DATA(1947) => 
               X_Logic0_port, DATA(1946) => X_Logic0_port, DATA(1945) => 
               X_Logic0_port, DATA(1944) => X_Logic0_port, DATA(1943) => 
               X_Logic0_port, DATA(1942) => X_Logic0_port, DATA(1941) => 
               X_Logic0_port, DATA(1940) => X_Logic0_port, DATA(1939) => 
               X_Logic0_port, DATA(1938) => X_Logic0_port, DATA(1937) => 
               X_Logic0_port, DATA(1936) => X_Logic0_port, DATA(1935) => 
               X_Logic0_port, DATA(1934) => X_Logic0_port, DATA(1933) => 
               X_Logic0_port, DATA(1932) => X_Logic0_port, DATA(1931) => 
               X_Logic0_port, DATA(1930) => X_Logic0_port, DATA(1929) => 
               X_Logic0_port, DATA(1928) => X_Logic0_port, DATA(1927) => 
               X_Logic0_port, DATA(1926) => X_Logic0_port, DATA(1925) => 
               X_Logic0_port, DATA(1924) => X_Logic0_port, DATA(1923) => 
               X_Logic0_port, DATA(1922) => X_Logic0_port, DATA(1921) => 
               X_Logic0_port, DATA(1920) => X_Logic0_port, DATA(1919) => 
               X_Logic0_port, DATA(1918) => X_Logic0_port, DATA(1917) => 
               X_Logic0_port, DATA(1916) => X_Logic0_port, DATA(1915) => 
               X_Logic0_port, DATA(1914) => X_Logic0_port, DATA(1913) => 
               X_Logic0_port, DATA(1912) => X_Logic0_port, DATA(1911) => 
               X_Logic0_port, DATA(1910) => X_Logic0_port, DATA(1909) => 
               X_Logic0_port, DATA(1908) => X_Logic0_port, DATA(1907) => 
               X_Logic0_port, DATA(1906) => X_Logic0_port, DATA(1905) => 
               X_Logic0_port, DATA(1904) => X_Logic0_port, DATA(1903) => 
               X_Logic0_port, DATA(1902) => X_Logic0_port, DATA(1901) => 
               X_Logic0_port, DATA(1900) => X_Logic0_port, DATA(1899) => 
               X_Logic0_port, DATA(1898) => X_Logic0_port, DATA(1897) => 
               X_Logic0_port, DATA(1896) => X_Logic0_port, DATA(1895) => 
               X_Logic0_port, DATA(1894) => X_Logic0_port, DATA(1893) => 
               X_Logic0_port, DATA(1892) => X_Logic0_port, DATA(1891) => 
               X_Logic0_port, DATA(1890) => X_Logic0_port, DATA(1889) => 
               X_Logic0_port, DATA(1888) => X_Logic0_port, DATA(1887) => 
               X_Logic0_port, DATA(1886) => X_Logic0_port, DATA(1885) => 
               X_Logic0_port, DATA(1884) => X_Logic0_port, DATA(1883) => 
               X_Logic0_port, DATA(1882) => X_Logic0_port, DATA(1881) => 
               X_Logic0_port, DATA(1880) => X_Logic0_port, DATA(1879) => 
               X_Logic0_port, DATA(1878) => X_Logic0_port, DATA(1877) => 
               X_Logic0_port, DATA(1876) => X_Logic0_port, DATA(1875) => 
               X_Logic0_port, DATA(1874) => X_Logic0_port, DATA(1873) => 
               X_Logic0_port, DATA(1872) => X_Logic0_port, DATA(1871) => 
               X_Logic0_port, DATA(1870) => X_Logic0_port, DATA(1869) => 
               X_Logic0_port, DATA(1868) => X_Logic0_port, DATA(1867) => 
               X_Logic0_port, DATA(1866) => X_Logic0_port, DATA(1865) => 
               X_Logic0_port, DATA(1864) => X_Logic0_port, DATA(1863) => 
               X_Logic0_port, DATA(1862) => X_Logic0_port, DATA(1861) => 
               X_Logic0_port, DATA(1860) => X_Logic0_port, DATA(1859) => 
               X_Logic0_port, DATA(1858) => X_Logic0_port, DATA(1857) => 
               X_Logic0_port, DATA(1856) => X_Logic0_port, DATA(1855) => 
               X_Logic0_port, DATA(1854) => X_Logic0_port, DATA(1853) => 
               X_Logic0_port, DATA(1852) => X_Logic0_port, DATA(1851) => 
               X_Logic0_port, DATA(1850) => X_Logic0_port, DATA(1849) => 
               X_Logic0_port, DATA(1848) => X_Logic0_port, DATA(1847) => 
               X_Logic0_port, DATA(1846) => X_Logic0_port, DATA(1845) => 
               X_Logic0_port, DATA(1844) => X_Logic0_port, DATA(1843) => 
               X_Logic0_port, DATA(1842) => X_Logic0_port, DATA(1841) => 
               X_Logic0_port, DATA(1840) => X_Logic0_port, DATA(1839) => 
               X_Logic0_port, DATA(1838) => X_Logic0_port, DATA(1837) => 
               X_Logic0_port, DATA(1836) => X_Logic0_port, DATA(1835) => 
               X_Logic0_port, DATA(1834) => X_Logic0_port, DATA(1833) => 
               X_Logic0_port, DATA(1832) => X_Logic0_port, DATA(1831) => 
               X_Logic0_port, DATA(1830) => X_Logic0_port, DATA(1829) => 
               X_Logic0_port, DATA(1828) => X_Logic0_port, DATA(1827) => 
               X_Logic0_port, DATA(1826) => X_Logic0_port, DATA(1825) => 
               X_Logic0_port, DATA(1824) => X_Logic0_port, DATA(1823) => 
               X_Logic0_port, DATA(1822) => X_Logic0_port, DATA(1821) => 
               X_Logic0_port, DATA(1820) => X_Logic0_port, DATA(1819) => 
               X_Logic0_port, DATA(1818) => X_Logic0_port, DATA(1817) => 
               X_Logic0_port, DATA(1816) => X_Logic0_port, DATA(1815) => 
               X_Logic0_port, DATA(1814) => X_Logic0_port, DATA(1813) => 
               X_Logic0_port, DATA(1812) => X_Logic0_port, DATA(1811) => 
               X_Logic0_port, DATA(1810) => X_Logic0_port, DATA(1809) => 
               X_Logic0_port, DATA(1808) => X_Logic0_port, DATA(1807) => 
               X_Logic0_port, DATA(1806) => X_Logic0_port, DATA(1805) => 
               X_Logic0_port, DATA(1804) => X_Logic0_port, DATA(1803) => 
               X_Logic0_port, DATA(1802) => X_Logic0_port, DATA(1801) => 
               X_Logic0_port, DATA(1800) => X_Logic0_port, DATA(1799) => 
               X_Logic0_port, DATA(1798) => X_Logic0_port, DATA(1797) => 
               X_Logic0_port, DATA(1796) => X_Logic0_port, DATA(1795) => 
               X_Logic0_port, DATA(1794) => X_Logic0_port, DATA(1793) => 
               X_Logic0_port, DATA(1792) => X_Logic0_port, DATA(1791) => 
               X_Logic0_port, DATA(1790) => X_Logic0_port, DATA(1789) => 
               X_Logic0_port, DATA(1788) => X_Logic0_port, DATA(1787) => 
               X_Logic0_port, DATA(1786) => X_Logic0_port, DATA(1785) => 
               X_Logic0_port, DATA(1784) => X_Logic0_port, DATA(1783) => 
               X_Logic0_port, DATA(1782) => X_Logic0_port, DATA(1781) => 
               X_Logic0_port, DATA(1780) => X_Logic0_port, DATA(1779) => 
               X_Logic0_port, DATA(1778) => X_Logic0_port, DATA(1777) => 
               X_Logic0_port, DATA(1776) => X_Logic0_port, DATA(1775) => 
               X_Logic0_port, DATA(1774) => X_Logic0_port, DATA(1773) => 
               X_Logic0_port, DATA(1772) => X_Logic0_port, DATA(1771) => 
               X_Logic0_port, DATA(1770) => X_Logic0_port, DATA(1769) => 
               X_Logic0_port, DATA(1768) => X_Logic0_port, DATA(1767) => 
               X_Logic0_port, DATA(1766) => X_Logic0_port, DATA(1765) => 
               X_Logic0_port, DATA(1764) => X_Logic0_port, DATA(1763) => 
               X_Logic0_port, DATA(1762) => X_Logic0_port, DATA(1761) => 
               X_Logic0_port, DATA(1760) => X_Logic0_port, DATA(1759) => 
               X_Logic0_port, DATA(1758) => X_Logic0_port, DATA(1757) => 
               X_Logic0_port, DATA(1756) => X_Logic0_port, DATA(1755) => 
               X_Logic0_port, DATA(1754) => X_Logic0_port, DATA(1753) => 
               X_Logic0_port, DATA(1752) => X_Logic0_port, DATA(1751) => 
               X_Logic0_port, DATA(1750) => X_Logic0_port, DATA(1749) => 
               X_Logic0_port, DATA(1748) => X_Logic0_port, DATA(1747) => 
               X_Logic0_port, DATA(1746) => X_Logic0_port, DATA(1745) => 
               X_Logic0_port, DATA(1744) => X_Logic0_port, DATA(1743) => 
               X_Logic0_port, DATA(1742) => X_Logic0_port, DATA(1741) => 
               X_Logic0_port, DATA(1740) => X_Logic0_port, DATA(1739) => 
               X_Logic0_port, DATA(1738) => X_Logic0_port, DATA(1737) => 
               X_Logic0_port, DATA(1736) => X_Logic0_port, DATA(1735) => 
               X_Logic0_port, DATA(1734) => X_Logic0_port, DATA(1733) => 
               X_Logic0_port, DATA(1732) => X_Logic0_port, DATA(1731) => 
               X_Logic0_port, DATA(1730) => X_Logic0_port, DATA(1729) => 
               X_Logic0_port, DATA(1728) => X_Logic0_port, DATA(1727) => 
               X_Logic0_port, DATA(1726) => X_Logic0_port, DATA(1725) => 
               X_Logic0_port, DATA(1724) => X_Logic0_port, DATA(1723) => 
               X_Logic0_port, DATA(1722) => X_Logic0_port, DATA(1721) => 
               X_Logic0_port, DATA(1720) => X_Logic0_port, DATA(1719) => 
               X_Logic0_port, DATA(1718) => X_Logic0_port, DATA(1717) => 
               X_Logic0_port, DATA(1716) => X_Logic0_port, DATA(1715) => 
               X_Logic0_port, DATA(1714) => X_Logic0_port, DATA(1713) => 
               X_Logic0_port, DATA(1712) => X_Logic0_port, DATA(1711) => 
               X_Logic0_port, DATA(1710) => X_Logic0_port, DATA(1709) => 
               X_Logic0_port, DATA(1708) => X_Logic0_port, DATA(1707) => 
               X_Logic0_port, DATA(1706) => X_Logic0_port, DATA(1705) => 
               X_Logic0_port, DATA(1704) => X_Logic0_port, DATA(1703) => 
               X_Logic0_port, DATA(1702) => X_Logic0_port, DATA(1701) => 
               X_Logic0_port, DATA(1700) => X_Logic0_port, DATA(1699) => 
               X_Logic0_port, DATA(1698) => X_Logic0_port, DATA(1697) => 
               X_Logic0_port, DATA(1696) => X_Logic0_port, DATA(1695) => 
               X_Logic0_port, DATA(1694) => X_Logic0_port, DATA(1693) => 
               X_Logic0_port, DATA(1692) => X_Logic0_port, DATA(1691) => 
               X_Logic0_port, DATA(1690) => X_Logic0_port, DATA(1689) => 
               X_Logic0_port, DATA(1688) => X_Logic0_port, DATA(1687) => 
               X_Logic0_port, DATA(1686) => X_Logic0_port, DATA(1685) => 
               X_Logic0_port, DATA(1684) => X_Logic0_port, DATA(1683) => 
               X_Logic0_port, DATA(1682) => X_Logic0_port, DATA(1681) => 
               X_Logic0_port, DATA(1680) => X_Logic0_port, DATA(1679) => 
               X_Logic0_port, DATA(1678) => X_Logic0_port, DATA(1677) => 
               X_Logic0_port, DATA(1676) => X_Logic0_port, DATA(1675) => 
               X_Logic0_port, DATA(1674) => X_Logic0_port, DATA(1673) => 
               X_Logic0_port, DATA(1672) => X_Logic0_port, DATA(1671) => 
               X_Logic0_port, DATA(1670) => X_Logic0_port, DATA(1669) => 
               X_Logic0_port, DATA(1668) => X_Logic0_port, DATA(1667) => 
               X_Logic0_port, DATA(1666) => X_Logic0_port, DATA(1665) => 
               X_Logic0_port, DATA(1664) => X_Logic0_port, DATA(1663) => 
               X_Logic0_port, DATA(1662) => X_Logic0_port, DATA(1661) => 
               X_Logic0_port, DATA(1660) => X_Logic0_port, DATA(1659) => 
               X_Logic0_port, DATA(1658) => X_Logic0_port, DATA(1657) => 
               X_Logic0_port, DATA(1656) => X_Logic0_port, DATA(1655) => 
               X_Logic0_port, DATA(1654) => X_Logic0_port, DATA(1653) => 
               X_Logic0_port, DATA(1652) => X_Logic0_port, DATA(1651) => 
               X_Logic0_port, DATA(1650) => X_Logic0_port, DATA(1649) => 
               X_Logic0_port, DATA(1648) => X_Logic0_port, DATA(1647) => 
               X_Logic0_port, DATA(1646) => X_Logic0_port, DATA(1645) => 
               X_Logic0_port, DATA(1644) => X_Logic0_port, DATA(1643) => 
               X_Logic0_port, DATA(1642) => X_Logic0_port, DATA(1641) => 
               X_Logic0_port, DATA(1640) => X_Logic0_port, DATA(1639) => 
               X_Logic0_port, DATA(1638) => X_Logic0_port, DATA(1637) => 
               X_Logic0_port, DATA(1636) => X_Logic0_port, DATA(1635) => 
               X_Logic0_port, DATA(1634) => X_Logic0_port, DATA(1633) => 
               X_Logic0_port, DATA(1632) => X_Logic0_port, DATA(1631) => 
               X_Logic0_port, DATA(1630) => X_Logic0_port, DATA(1629) => 
               X_Logic0_port, DATA(1628) => X_Logic0_port, DATA(1627) => 
               X_Logic0_port, DATA(1626) => X_Logic0_port, DATA(1625) => 
               X_Logic0_port, DATA(1624) => X_Logic0_port, DATA(1623) => 
               X_Logic0_port, DATA(1622) => X_Logic0_port, DATA(1621) => 
               X_Logic0_port, DATA(1620) => X_Logic0_port, DATA(1619) => 
               X_Logic0_port, DATA(1618) => X_Logic0_port, DATA(1617) => 
               X_Logic0_port, DATA(1616) => X_Logic0_port, DATA(1615) => 
               X_Logic0_port, DATA(1614) => X_Logic0_port, DATA(1613) => 
               X_Logic0_port, DATA(1612) => X_Logic0_port, DATA(1611) => 
               X_Logic0_port, DATA(1610) => X_Logic0_port, DATA(1609) => 
               X_Logic0_port, DATA(1608) => X_Logic0_port, DATA(1607) => 
               X_Logic0_port, DATA(1606) => X_Logic0_port, DATA(1605) => 
               X_Logic0_port, DATA(1604) => X_Logic0_port, DATA(1603) => 
               X_Logic0_port, DATA(1602) => X_Logic0_port, DATA(1601) => 
               X_Logic0_port, DATA(1600) => X_Logic0_port, DATA(1599) => 
               X_Logic0_port, DATA(1598) => X_Logic0_port, DATA(1597) => 
               X_Logic0_port, DATA(1596) => X_Logic0_port, DATA(1595) => 
               X_Logic0_port, DATA(1594) => X_Logic0_port, DATA(1593) => 
               X_Logic0_port, DATA(1592) => X_Logic0_port, DATA(1591) => 
               X_Logic0_port, DATA(1590) => X_Logic0_port, DATA(1589) => 
               X_Logic0_port, DATA(1588) => X_Logic0_port, DATA(1587) => 
               X_Logic0_port, DATA(1586) => X_Logic0_port, DATA(1585) => 
               X_Logic0_port, DATA(1584) => X_Logic0_port, DATA(1583) => 
               X_Logic0_port, DATA(1582) => X_Logic0_port, DATA(1581) => 
               X_Logic0_port, DATA(1580) => X_Logic0_port, DATA(1579) => 
               X_Logic0_port, DATA(1578) => X_Logic0_port, DATA(1577) => 
               X_Logic0_port, DATA(1576) => X_Logic0_port, DATA(1575) => 
               X_Logic0_port, DATA(1574) => X_Logic0_port, DATA(1573) => 
               X_Logic0_port, DATA(1572) => X_Logic0_port, DATA(1571) => 
               X_Logic0_port, DATA(1570) => X_Logic0_port, DATA(1569) => 
               X_Logic0_port, DATA(1568) => X_Logic0_port, DATA(1567) => 
               X_Logic0_port, DATA(1566) => X_Logic0_port, DATA(1565) => 
               X_Logic0_port, DATA(1564) => X_Logic0_port, DATA(1563) => 
               X_Logic0_port, DATA(1562) => X_Logic0_port, DATA(1561) => 
               X_Logic0_port, DATA(1560) => X_Logic0_port, DATA(1559) => 
               X_Logic0_port, DATA(1558) => X_Logic0_port, DATA(1557) => 
               X_Logic0_port, DATA(1556) => X_Logic0_port, DATA(1555) => 
               X_Logic0_port, DATA(1554) => X_Logic0_port, DATA(1553) => 
               X_Logic0_port, DATA(1552) => X_Logic0_port, DATA(1551) => 
               X_Logic0_port, DATA(1550) => X_Logic0_port, DATA(1549) => 
               X_Logic0_port, DATA(1548) => X_Logic0_port, DATA(1547) => 
               X_Logic0_port, DATA(1546) => X_Logic0_port, DATA(1545) => 
               X_Logic0_port, DATA(1544) => X_Logic0_port, DATA(1543) => 
               X_Logic0_port, DATA(1542) => X_Logic0_port, DATA(1541) => 
               X_Logic0_port, DATA(1540) => X_Logic0_port, DATA(1539) => 
               X_Logic0_port, DATA(1538) => X_Logic0_port, DATA(1537) => 
               X_Logic0_port, DATA(1536) => X_Logic0_port, DATA(1535) => 
               X_Logic0_port, DATA(1534) => X_Logic0_port, DATA(1533) => 
               X_Logic0_port, DATA(1532) => X_Logic0_port, DATA(1531) => 
               X_Logic0_port, DATA(1530) => X_Logic0_port, DATA(1529) => 
               X_Logic0_port, DATA(1528) => X_Logic0_port, DATA(1527) => 
               X_Logic0_port, DATA(1526) => X_Logic0_port, DATA(1525) => 
               X_Logic0_port, DATA(1524) => X_Logic0_port, DATA(1523) => 
               X_Logic0_port, DATA(1522) => X_Logic0_port, DATA(1521) => 
               X_Logic0_port, DATA(1520) => X_Logic0_port, DATA(1519) => 
               X_Logic0_port, DATA(1518) => X_Logic0_port, DATA(1517) => 
               X_Logic0_port, DATA(1516) => X_Logic0_port, DATA(1515) => 
               X_Logic0_port, DATA(1514) => X_Logic0_port, DATA(1513) => 
               X_Logic0_port, DATA(1512) => X_Logic0_port, DATA(1511) => 
               X_Logic0_port, DATA(1510) => X_Logic0_port, DATA(1509) => 
               X_Logic0_port, DATA(1508) => X_Logic0_port, DATA(1507) => 
               X_Logic0_port, DATA(1506) => X_Logic0_port, DATA(1505) => 
               X_Logic0_port, DATA(1504) => X_Logic0_port, DATA(1503) => 
               X_Logic0_port, DATA(1502) => X_Logic0_port, DATA(1501) => 
               X_Logic0_port, DATA(1500) => X_Logic0_port, DATA(1499) => 
               X_Logic0_port, DATA(1498) => X_Logic0_port, DATA(1497) => 
               X_Logic0_port, DATA(1496) => X_Logic0_port, DATA(1495) => 
               X_Logic0_port, DATA(1494) => X_Logic0_port, DATA(1493) => 
               X_Logic0_port, DATA(1492) => X_Logic0_port, DATA(1491) => 
               X_Logic0_port, DATA(1490) => X_Logic0_port, DATA(1489) => 
               X_Logic0_port, DATA(1488) => X_Logic0_port, DATA(1487) => 
               X_Logic0_port, DATA(1486) => X_Logic0_port, DATA(1485) => 
               X_Logic0_port, DATA(1484) => X_Logic0_port, DATA(1483) => 
               X_Logic0_port, DATA(1482) => X_Logic0_port, DATA(1481) => 
               X_Logic0_port, DATA(1480) => X_Logic0_port, DATA(1479) => 
               X_Logic0_port, DATA(1478) => X_Logic0_port, DATA(1477) => 
               X_Logic0_port, DATA(1476) => X_Logic0_port, DATA(1475) => 
               X_Logic0_port, DATA(1474) => X_Logic0_port, DATA(1473) => 
               X_Logic0_port, DATA(1472) => X_Logic0_port, DATA(1471) => 
               X_Logic0_port, DATA(1470) => X_Logic0_port, DATA(1469) => 
               X_Logic0_port, DATA(1468) => X_Logic0_port, DATA(1467) => 
               X_Logic0_port, DATA(1466) => X_Logic0_port, DATA(1465) => 
               X_Logic0_port, DATA(1464) => X_Logic0_port, DATA(1463) => 
               X_Logic0_port, DATA(1462) => X_Logic0_port, DATA(1461) => 
               X_Logic0_port, DATA(1460) => X_Logic0_port, DATA(1459) => 
               X_Logic0_port, DATA(1458) => X_Logic0_port, DATA(1457) => 
               X_Logic0_port, DATA(1456) => X_Logic0_port, DATA(1455) => 
               X_Logic0_port, DATA(1454) => X_Logic0_port, DATA(1453) => 
               X_Logic0_port, DATA(1452) => X_Logic0_port, DATA(1451) => 
               X_Logic0_port, DATA(1450) => X_Logic0_port, DATA(1449) => 
               X_Logic0_port, DATA(1448) => X_Logic0_port, DATA(1447) => 
               X_Logic0_port, DATA(1446) => X_Logic0_port, DATA(1445) => 
               X_Logic0_port, DATA(1444) => X_Logic0_port, DATA(1443) => 
               X_Logic0_port, DATA(1442) => X_Logic0_port, DATA(1441) => 
               X_Logic0_port, DATA(1440) => X_Logic0_port, DATA(1439) => 
               X_Logic0_port, DATA(1438) => X_Logic0_port, DATA(1437) => 
               X_Logic0_port, DATA(1436) => X_Logic0_port, DATA(1435) => 
               X_Logic0_port, DATA(1434) => X_Logic0_port, DATA(1433) => 
               X_Logic0_port, DATA(1432) => X_Logic0_port, DATA(1431) => 
               X_Logic0_port, DATA(1430) => X_Logic0_port, DATA(1429) => 
               X_Logic0_port, DATA(1428) => X_Logic0_port, DATA(1427) => 
               X_Logic0_port, DATA(1426) => X_Logic0_port, DATA(1425) => 
               X_Logic0_port, DATA(1424) => X_Logic0_port, DATA(1423) => 
               X_Logic0_port, DATA(1422) => X_Logic0_port, DATA(1421) => 
               X_Logic0_port, DATA(1420) => X_Logic0_port, DATA(1419) => 
               X_Logic0_port, DATA(1418) => X_Logic0_port, DATA(1417) => 
               X_Logic0_port, DATA(1416) => X_Logic0_port, DATA(1415) => 
               X_Logic0_port, DATA(1414) => X_Logic0_port, DATA(1413) => 
               X_Logic0_port, DATA(1412) => X_Logic0_port, DATA(1411) => 
               X_Logic0_port, DATA(1410) => X_Logic0_port, DATA(1409) => 
               X_Logic0_port, DATA(1408) => X_Logic0_port, DATA(1407) => 
               X_Logic0_port, DATA(1406) => X_Logic0_port, DATA(1405) => 
               X_Logic0_port, DATA(1404) => X_Logic0_port, DATA(1403) => 
               X_Logic0_port, DATA(1402) => X_Logic0_port, DATA(1401) => 
               X_Logic0_port, DATA(1400) => X_Logic0_port, DATA(1399) => 
               X_Logic0_port, DATA(1398) => X_Logic0_port, DATA(1397) => 
               X_Logic0_port, DATA(1396) => X_Logic0_port, DATA(1395) => 
               X_Logic0_port, DATA(1394) => X_Logic0_port, DATA(1393) => 
               X_Logic0_port, DATA(1392) => X_Logic0_port, DATA(1391) => 
               X_Logic0_port, DATA(1390) => X_Logic0_port, DATA(1389) => 
               X_Logic0_port, DATA(1388) => X_Logic0_port, DATA(1387) => 
               X_Logic0_port, DATA(1386) => X_Logic0_port, DATA(1385) => 
               X_Logic0_port, DATA(1384) => X_Logic0_port, DATA(1383) => 
               X_Logic0_port, DATA(1382) => X_Logic0_port, DATA(1381) => 
               X_Logic0_port, DATA(1380) => X_Logic0_port, DATA(1379) => 
               X_Logic0_port, DATA(1378) => X_Logic0_port, DATA(1377) => 
               X_Logic0_port, DATA(1376) => X_Logic0_port, DATA(1375) => 
               X_Logic0_port, DATA(1374) => X_Logic0_port, DATA(1373) => 
               X_Logic0_port, DATA(1372) => X_Logic0_port, DATA(1371) => 
               X_Logic0_port, DATA(1370) => X_Logic0_port, DATA(1369) => 
               X_Logic0_port, DATA(1368) => X_Logic0_port, DATA(1367) => 
               X_Logic0_port, DATA(1366) => X_Logic0_port, DATA(1365) => 
               X_Logic0_port, DATA(1364) => X_Logic0_port, DATA(1363) => 
               X_Logic0_port, DATA(1362) => X_Logic0_port, DATA(1361) => 
               X_Logic0_port, DATA(1360) => X_Logic0_port, DATA(1359) => 
               X_Logic0_port, DATA(1358) => X_Logic0_port, DATA(1357) => 
               X_Logic0_port, DATA(1356) => X_Logic0_port, DATA(1355) => 
               X_Logic0_port, DATA(1354) => X_Logic0_port, DATA(1353) => 
               X_Logic0_port, DATA(1352) => X_Logic0_port, DATA(1351) => 
               X_Logic0_port, DATA(1350) => X_Logic0_port, DATA(1349) => 
               X_Logic0_port, DATA(1348) => X_Logic0_port, DATA(1347) => 
               X_Logic0_port, DATA(1346) => X_Logic0_port, DATA(1345) => 
               X_Logic0_port, DATA(1344) => X_Logic0_port, DATA(1343) => 
               X_Logic0_port, DATA(1342) => X_Logic0_port, DATA(1341) => 
               X_Logic0_port, DATA(1340) => X_Logic0_port, DATA(1339) => 
               X_Logic0_port, DATA(1338) => X_Logic0_port, DATA(1337) => 
               X_Logic0_port, DATA(1336) => X_Logic0_port, DATA(1335) => 
               X_Logic0_port, DATA(1334) => X_Logic0_port, DATA(1333) => 
               X_Logic0_port, DATA(1332) => X_Logic0_port, DATA(1331) => 
               X_Logic0_port, DATA(1330) => X_Logic0_port, DATA(1329) => 
               X_Logic0_port, DATA(1328) => X_Logic0_port, DATA(1327) => 
               X_Logic0_port, DATA(1326) => X_Logic0_port, DATA(1325) => 
               X_Logic0_port, DATA(1324) => X_Logic0_port, DATA(1323) => 
               X_Logic0_port, DATA(1322) => X_Logic0_port, DATA(1321) => 
               X_Logic0_port, DATA(1320) => X_Logic0_port, DATA(1319) => 
               X_Logic0_port, DATA(1318) => X_Logic0_port, DATA(1317) => 
               X_Logic0_port, DATA(1316) => X_Logic0_port, DATA(1315) => 
               X_Logic0_port, DATA(1314) => X_Logic0_port, DATA(1313) => 
               X_Logic0_port, DATA(1312) => X_Logic0_port, DATA(1311) => 
               X_Logic0_port, DATA(1310) => X_Logic0_port, DATA(1309) => 
               X_Logic0_port, DATA(1308) => X_Logic0_port, DATA(1307) => 
               X_Logic0_port, DATA(1306) => X_Logic0_port, DATA(1305) => 
               X_Logic0_port, DATA(1304) => X_Logic0_port, DATA(1303) => 
               X_Logic0_port, DATA(1302) => X_Logic0_port, DATA(1301) => 
               X_Logic0_port, DATA(1300) => X_Logic0_port, DATA(1299) => 
               X_Logic0_port, DATA(1298) => X_Logic0_port, DATA(1297) => 
               X_Logic0_port, DATA(1296) => X_Logic0_port, DATA(1295) => 
               X_Logic0_port, DATA(1294) => X_Logic0_port, DATA(1293) => 
               X_Logic0_port, DATA(1292) => X_Logic0_port, DATA(1291) => 
               X_Logic0_port, DATA(1290) => X_Logic0_port, DATA(1289) => 
               X_Logic0_port, DATA(1288) => X_Logic0_port, DATA(1287) => 
               X_Logic0_port, DATA(1286) => X_Logic0_port, DATA(1285) => 
               X_Logic0_port, DATA(1284) => X_Logic0_port, DATA(1283) => 
               X_Logic0_port, DATA(1282) => X_Logic0_port, DATA(1281) => 
               X_Logic0_port, DATA(1280) => X_Logic0_port, DATA(1279) => 
               X_Logic0_port, DATA(1278) => X_Logic0_port, DATA(1277) => 
               X_Logic0_port, DATA(1276) => X_Logic0_port, DATA(1275) => 
               X_Logic0_port, DATA(1274) => X_Logic0_port, DATA(1273) => 
               X_Logic0_port, DATA(1272) => X_Logic0_port, DATA(1271) => 
               X_Logic0_port, DATA(1270) => X_Logic0_port, DATA(1269) => 
               X_Logic0_port, DATA(1268) => X_Logic0_port, DATA(1267) => 
               X_Logic0_port, DATA(1266) => X_Logic0_port, DATA(1265) => 
               X_Logic0_port, DATA(1264) => X_Logic0_port, DATA(1263) => 
               X_Logic0_port, DATA(1262) => X_Logic0_port, DATA(1261) => 
               X_Logic0_port, DATA(1260) => X_Logic0_port, DATA(1259) => 
               X_Logic0_port, DATA(1258) => X_Logic0_port, DATA(1257) => 
               X_Logic0_port, DATA(1256) => X_Logic0_port, DATA(1255) => 
               X_Logic0_port, DATA(1254) => X_Logic0_port, DATA(1253) => 
               X_Logic0_port, DATA(1252) => X_Logic0_port, DATA(1251) => 
               X_Logic0_port, DATA(1250) => X_Logic0_port, DATA(1249) => 
               X_Logic0_port, DATA(1248) => X_Logic0_port, DATA(1247) => 
               X_Logic0_port, DATA(1246) => X_Logic0_port, DATA(1245) => 
               X_Logic0_port, DATA(1244) => X_Logic0_port, DATA(1243) => 
               X_Logic0_port, DATA(1242) => X_Logic0_port, DATA(1241) => 
               X_Logic0_port, DATA(1240) => X_Logic0_port, DATA(1239) => 
               X_Logic0_port, DATA(1238) => X_Logic0_port, DATA(1237) => 
               X_Logic0_port, DATA(1236) => X_Logic0_port, DATA(1235) => 
               X_Logic0_port, DATA(1234) => X_Logic0_port, DATA(1233) => 
               X_Logic0_port, DATA(1232) => X_Logic0_port, DATA(1231) => 
               X_Logic0_port, DATA(1230) => X_Logic0_port, DATA(1229) => 
               X_Logic0_port, DATA(1228) => X_Logic0_port, DATA(1227) => 
               X_Logic0_port, DATA(1226) => X_Logic0_port, DATA(1225) => 
               X_Logic0_port, DATA(1224) => X_Logic0_port, DATA(1223) => 
               X_Logic0_port, DATA(1222) => X_Logic0_port, DATA(1221) => 
               X_Logic0_port, DATA(1220) => X_Logic0_port, DATA(1219) => 
               X_Logic0_port, DATA(1218) => X_Logic0_port, DATA(1217) => 
               X_Logic0_port, DATA(1216) => X_Logic0_port, DATA(1215) => 
               X_Logic0_port, DATA(1214) => X_Logic0_port, DATA(1213) => 
               X_Logic0_port, DATA(1212) => X_Logic0_port, DATA(1211) => 
               X_Logic0_port, DATA(1210) => X_Logic0_port, DATA(1209) => 
               X_Logic0_port, DATA(1208) => X_Logic0_port, DATA(1207) => 
               X_Logic0_port, DATA(1206) => X_Logic0_port, DATA(1205) => 
               X_Logic0_port, DATA(1204) => X_Logic0_port, DATA(1203) => 
               X_Logic0_port, DATA(1202) => X_Logic0_port, DATA(1201) => 
               X_Logic0_port, DATA(1200) => X_Logic0_port, DATA(1199) => 
               X_Logic0_port, DATA(1198) => X_Logic0_port, DATA(1197) => 
               X_Logic0_port, DATA(1196) => X_Logic0_port, DATA(1195) => 
               X_Logic0_port, DATA(1194) => X_Logic0_port, DATA(1193) => 
               X_Logic0_port, DATA(1192) => X_Logic0_port, DATA(1191) => 
               X_Logic0_port, DATA(1190) => X_Logic0_port, DATA(1189) => 
               X_Logic0_port, DATA(1188) => X_Logic0_port, DATA(1187) => 
               X_Logic0_port, DATA(1186) => X_Logic0_port, DATA(1185) => 
               X_Logic0_port, DATA(1184) => X_Logic0_port, DATA(1183) => 
               X_Logic0_port, DATA(1182) => X_Logic0_port, DATA(1181) => 
               X_Logic0_port, DATA(1180) => X_Logic0_port, DATA(1179) => 
               X_Logic0_port, DATA(1178) => X_Logic0_port, DATA(1177) => 
               X_Logic0_port, DATA(1176) => X_Logic0_port, DATA(1175) => 
               X_Logic0_port, DATA(1174) => X_Logic0_port, DATA(1173) => 
               X_Logic0_port, DATA(1172) => X_Logic0_port, DATA(1171) => 
               X_Logic0_port, DATA(1170) => X_Logic0_port, DATA(1169) => 
               X_Logic0_port, DATA(1168) => X_Logic0_port, DATA(1167) => 
               X_Logic0_port, DATA(1166) => X_Logic0_port, DATA(1165) => 
               X_Logic0_port, DATA(1164) => X_Logic0_port, DATA(1163) => 
               X_Logic0_port, DATA(1162) => X_Logic0_port, DATA(1161) => 
               X_Logic0_port, DATA(1160) => X_Logic0_port, DATA(1159) => 
               X_Logic0_port, DATA(1158) => X_Logic0_port, DATA(1157) => 
               X_Logic0_port, DATA(1156) => X_Logic0_port, DATA(1155) => 
               X_Logic0_port, DATA(1154) => X_Logic0_port, DATA(1153) => 
               X_Logic0_port, DATA(1152) => X_Logic0_port, DATA(1151) => 
               X_Logic0_port, DATA(1150) => X_Logic0_port, DATA(1149) => 
               X_Logic0_port, DATA(1148) => X_Logic0_port, DATA(1147) => 
               X_Logic0_port, DATA(1146) => X_Logic0_port, DATA(1145) => 
               X_Logic0_port, DATA(1144) => X_Logic0_port, DATA(1143) => 
               X_Logic0_port, DATA(1142) => X_Logic0_port, DATA(1141) => 
               X_Logic0_port, DATA(1140) => X_Logic0_port, DATA(1139) => 
               X_Logic0_port, DATA(1138) => X_Logic0_port, DATA(1137) => 
               X_Logic0_port, DATA(1136) => X_Logic0_port, DATA(1135) => 
               X_Logic0_port, DATA(1134) => X_Logic0_port, DATA(1133) => 
               X_Logic0_port, DATA(1132) => X_Logic0_port, DATA(1131) => 
               X_Logic0_port, DATA(1130) => X_Logic0_port, DATA(1129) => 
               X_Logic0_port, DATA(1128) => X_Logic0_port, DATA(1127) => 
               X_Logic0_port, DATA(1126) => X_Logic0_port, DATA(1125) => 
               X_Logic0_port, DATA(1124) => X_Logic0_port, DATA(1123) => 
               X_Logic0_port, DATA(1122) => X_Logic0_port, DATA(1121) => 
               X_Logic0_port, DATA(1120) => X_Logic0_port, DATA(1119) => 
               X_Logic0_port, DATA(1118) => X_Logic0_port, DATA(1117) => 
               X_Logic0_port, DATA(1116) => X_Logic0_port, DATA(1115) => 
               X_Logic0_port, DATA(1114) => X_Logic0_port, DATA(1113) => 
               X_Logic0_port, DATA(1112) => X_Logic0_port, DATA(1111) => 
               X_Logic0_port, DATA(1110) => X_Logic0_port, DATA(1109) => 
               X_Logic0_port, DATA(1108) => X_Logic0_port, DATA(1107) => 
               X_Logic0_port, DATA(1106) => X_Logic0_port, DATA(1105) => 
               X_Logic0_port, DATA(1104) => X_Logic0_port, DATA(1103) => 
               X_Logic0_port, DATA(1102) => X_Logic0_port, DATA(1101) => 
               X_Logic0_port, DATA(1100) => X_Logic0_port, DATA(1099) => 
               X_Logic0_port, DATA(1098) => X_Logic0_port, DATA(1097) => 
               X_Logic0_port, DATA(1096) => X_Logic0_port, DATA(1095) => 
               X_Logic0_port, DATA(1094) => X_Logic0_port, DATA(1093) => 
               X_Logic0_port, DATA(1092) => X_Logic0_port, DATA(1091) => 
               X_Logic0_port, DATA(1090) => X_Logic0_port, DATA(1089) => 
               X_Logic0_port, DATA(1088) => X_Logic0_port, DATA(1087) => 
               X_Logic0_port, DATA(1086) => X_Logic0_port, DATA(1085) => 
               X_Logic0_port, DATA(1084) => X_Logic0_port, DATA(1083) => 
               X_Logic0_port, DATA(1082) => X_Logic0_port, DATA(1081) => 
               X_Logic0_port, DATA(1080) => X_Logic0_port, DATA(1079) => 
               X_Logic0_port, DATA(1078) => X_Logic0_port, DATA(1077) => 
               X_Logic0_port, DATA(1076) => X_Logic0_port, DATA(1075) => 
               X_Logic0_port, DATA(1074) => X_Logic0_port, DATA(1073) => 
               X_Logic0_port, DATA(1072) => X_Logic0_port, DATA(1071) => 
               X_Logic0_port, DATA(1070) => X_Logic0_port, DATA(1069) => 
               X_Logic0_port, DATA(1068) => X_Logic0_port, DATA(1067) => 
               X_Logic0_port, DATA(1066) => X_Logic0_port, DATA(1065) => 
               X_Logic0_port, DATA(1064) => X_Logic0_port, DATA(1063) => 
               X_Logic0_port, DATA(1062) => X_Logic0_port, DATA(1061) => 
               X_Logic0_port, DATA(1060) => X_Logic0_port, DATA(1059) => 
               X_Logic0_port, DATA(1058) => X_Logic0_port, DATA(1057) => 
               X_Logic0_port, DATA(1056) => X_Logic0_port, DATA(1055) => 
               X_Logic0_port, DATA(1054) => X_Logic0_port, DATA(1053) => 
               X_Logic0_port, DATA(1052) => X_Logic0_port, DATA(1051) => 
               X_Logic0_port, DATA(1050) => X_Logic0_port, DATA(1049) => 
               X_Logic0_port, DATA(1048) => X_Logic0_port, DATA(1047) => 
               X_Logic0_port, DATA(1046) => X_Logic0_port, DATA(1045) => 
               X_Logic0_port, DATA(1044) => X_Logic0_port, DATA(1043) => 
               X_Logic0_port, DATA(1042) => X_Logic0_port, DATA(1041) => 
               X_Logic0_port, DATA(1040) => X_Logic0_port, DATA(1039) => 
               X_Logic0_port, DATA(1038) => X_Logic0_port, DATA(1037) => 
               X_Logic0_port, DATA(1036) => X_Logic0_port, DATA(1035) => 
               X_Logic0_port, DATA(1034) => X_Logic0_port, DATA(1033) => 
               X_Logic0_port, DATA(1032) => X_Logic0_port, DATA(1031) => 
               X_Logic0_port, DATA(1030) => X_Logic0_port, DATA(1029) => 
               X_Logic0_port, DATA(1028) => X_Logic0_port, DATA(1027) => 
               X_Logic0_port, DATA(1026) => X_Logic0_port, DATA(1025) => 
               X_Logic0_port, DATA(1024) => X_Logic0_port, DATA(1023) => 
               X_Logic0_port, DATA(1022) => X_Logic0_port, DATA(1021) => 
               X_Logic0_port, DATA(1020) => X_Logic0_port, DATA(1019) => 
               X_Logic0_port, DATA(1018) => X_Logic0_port, DATA(1017) => 
               X_Logic0_port, DATA(1016) => X_Logic0_port, DATA(1015) => 
               X_Logic0_port, DATA(1014) => X_Logic0_port, DATA(1013) => 
               X_Logic0_port, DATA(1012) => X_Logic0_port, DATA(1011) => 
               X_Logic0_port, DATA(1010) => X_Logic0_port, DATA(1009) => 
               X_Logic0_port, DATA(1008) => X_Logic0_port, DATA(1007) => 
               X_Logic0_port, DATA(1006) => X_Logic0_port, DATA(1005) => 
               X_Logic0_port, DATA(1004) => X_Logic0_port, DATA(1003) => 
               X_Logic0_port, DATA(1002) => X_Logic0_port, DATA(1001) => 
               X_Logic0_port, DATA(1000) => X_Logic0_port, DATA(999) => 
               X_Logic0_port, DATA(998) => X_Logic0_port, DATA(997) => 
               X_Logic0_port, DATA(996) => X_Logic0_port, DATA(995) => 
               X_Logic0_port, DATA(994) => X_Logic0_port, DATA(993) => 
               X_Logic0_port, DATA(992) => X_Logic0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N158, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N226, 
         -- Connections to port 'Z'
         Z(991) => N1249, Z(990) => N1248, Z(989) => N1247, Z(988) => N1246, 
               Z(987) => N1245, Z(986) => N1244, Z(985) => N1243, Z(984) => 
               N1242, Z(983) => N1241, Z(982) => N1240, Z(981) => N1239, Z(980)
               => N1238, Z(979) => N1237, Z(978) => N1236, Z(977) => N1235, 
               Z(976) => N1234, Z(975) => N1233, Z(974) => N1232, Z(973) => 
               N1231, Z(972) => N1230, Z(971) => N1229, Z(970) => N1228, Z(969)
               => N1227, Z(968) => N1226, Z(967) => N1225, Z(966) => N1224, 
               Z(965) => N1223, Z(964) => N1222, Z(963) => N1221, Z(962) => 
               N1220, Z(961) => N1219, Z(960) => N1218, Z(959) => N1217, Z(958)
               => N1216, Z(957) => N1215, Z(956) => N1214, Z(955) => N1213, 
               Z(954) => N1212, Z(953) => N1211, Z(952) => N1210, Z(951) => 
               N1209, Z(950) => N1208, Z(949) => N1207, Z(948) => N1206, Z(947)
               => N1205, Z(946) => N1204, Z(945) => N1203, Z(944) => N1202, 
               Z(943) => N1201, Z(942) => N1200, Z(941) => N1199, Z(940) => 
               N1198, Z(939) => N1197, Z(938) => N1196, Z(937) => N1195, Z(936)
               => N1194, Z(935) => N1193, Z(934) => N1192, Z(933) => N1191, 
               Z(932) => N1190, Z(931) => N1189, Z(930) => N1188, Z(929) => 
               N1187, Z(928) => N1186, Z(927) => N1185, Z(926) => N1184, Z(925)
               => N1183, Z(924) => N1182, Z(923) => N1181, Z(922) => N1180, 
               Z(921) => N1179, Z(920) => N1178, Z(919) => N1177, Z(918) => 
               N1176, Z(917) => N1175, Z(916) => N1174, Z(915) => N1173, Z(914)
               => N1172, Z(913) => N1171, Z(912) => N1170, Z(911) => N1169, 
               Z(910) => N1168, Z(909) => N1167, Z(908) => N1166, Z(907) => 
               N1165, Z(906) => N1164, Z(905) => N1163, Z(904) => N1162, Z(903)
               => N1161, Z(902) => N1160, Z(901) => N1159, Z(900) => N1158, 
               Z(899) => N1157, Z(898) => N1156, Z(897) => N1155, Z(896) => 
               N1154, Z(895) => N1153, Z(894) => N1152, Z(893) => N1151, Z(892)
               => N1150, Z(891) => N1149, Z(890) => N1148, Z(889) => N1147, 
               Z(888) => N1146, Z(887) => N1145, Z(886) => N1144, Z(885) => 
               N1143, Z(884) => N1142, Z(883) => N1141, Z(882) => N1140, Z(881)
               => N1139, Z(880) => N1138, Z(879) => N1137, Z(878) => N1136, 
               Z(877) => N1135, Z(876) => N1134, Z(875) => N1133, Z(874) => 
               N1132, Z(873) => N1131, Z(872) => N1130, Z(871) => N1129, Z(870)
               => N1128, Z(869) => N1127, Z(868) => N1126, Z(867) => N1125, 
               Z(866) => N1124, Z(865) => N1123, Z(864) => N1122, Z(863) => 
               N1121, Z(862) => N1120, Z(861) => N1119, Z(860) => N1118, Z(859)
               => N1117, Z(858) => N1116, Z(857) => N1115, Z(856) => N1114, 
               Z(855) => N1113, Z(854) => N1112, Z(853) => N1111, Z(852) => 
               N1110, Z(851) => N1109, Z(850) => N1108, Z(849) => N1107, Z(848)
               => N1106, Z(847) => N1105, Z(846) => N1104, Z(845) => N1103, 
               Z(844) => N1102, Z(843) => N1101, Z(842) => N1100, Z(841) => 
               N1099, Z(840) => N1098, Z(839) => N1097, Z(838) => N1096, Z(837)
               => N1095, Z(836) => N1094, Z(835) => N1093, Z(834) => N1092, 
               Z(833) => N1091, Z(832) => N1090, Z(831) => N1089, Z(830) => 
               N1088, Z(829) => N1087, Z(828) => N1086, Z(827) => N1085, Z(826)
               => N1084, Z(825) => N1083, Z(824) => N1082, Z(823) => N1081, 
               Z(822) => N1080, Z(821) => N1079, Z(820) => N1078, Z(819) => 
               N1077, Z(818) => N1076, Z(817) => N1075, Z(816) => N1074, Z(815)
               => N1073, Z(814) => N1072, Z(813) => N1071, Z(812) => N1070, 
               Z(811) => N1069, Z(810) => N1068, Z(809) => N1067, Z(808) => 
               N1066, Z(807) => N1065, Z(806) => N1064, Z(805) => N1063, Z(804)
               => N1062, Z(803) => N1061, Z(802) => N1060, Z(801) => N1059, 
               Z(800) => N1058, Z(799) => N1057, Z(798) => N1056, Z(797) => 
               N1055, Z(796) => N1054, Z(795) => N1053, Z(794) => N1052, Z(793)
               => N1051, Z(792) => N1050, Z(791) => N1049, Z(790) => N1048, 
               Z(789) => N1047, Z(788) => N1046, Z(787) => N1045, Z(786) => 
               N1044, Z(785) => N1043, Z(784) => N1042, Z(783) => N1041, Z(782)
               => N1040, Z(781) => N1039, Z(780) => N1038, Z(779) => N1037, 
               Z(778) => N1036, Z(777) => N1035, Z(776) => N1034, Z(775) => 
               N1033, Z(774) => N1032, Z(773) => N1031, Z(772) => N1030, Z(771)
               => N1029, Z(770) => N1028, Z(769) => N1027, Z(768) => N1026, 
               Z(767) => N1025, Z(766) => N1024, Z(765) => N1023, Z(764) => 
               N1022, Z(763) => N1021, Z(762) => N1020, Z(761) => N1019, Z(760)
               => N1018, Z(759) => N1017, Z(758) => N1016, Z(757) => N1015, 
               Z(756) => N1014, Z(755) => N1013, Z(754) => N1012, Z(753) => 
               N1011, Z(752) => N1010, Z(751) => N1009, Z(750) => N1008, Z(749)
               => N1007, Z(748) => N1006, Z(747) => N1005, Z(746) => N1004, 
               Z(745) => N1003, Z(744) => N1002, Z(743) => N1001, Z(742) => 
               N1000, Z(741) => N999, Z(740) => N998, Z(739) => N997, Z(738) =>
               N996, Z(737) => N995, Z(736) => N994, Z(735) => N993, Z(734) => 
               N992, Z(733) => N991, Z(732) => N990, Z(731) => N989, Z(730) => 
               N988, Z(729) => N987, Z(728) => N986, Z(727) => N985, Z(726) => 
               N984, Z(725) => N983, Z(724) => N982, Z(723) => N981, Z(722) => 
               N980, Z(721) => N979, Z(720) => N978, Z(719) => N977, Z(718) => 
               N976, Z(717) => N975, Z(716) => N974, Z(715) => N973, Z(714) => 
               N972, Z(713) => N971, Z(712) => N970, Z(711) => N969, Z(710) => 
               N968, Z(709) => N967, Z(708) => N966, Z(707) => N965, Z(706) => 
               N964, Z(705) => N963, Z(704) => N962, Z(703) => N961, Z(702) => 
               N960, Z(701) => N959, Z(700) => N958, Z(699) => N957, Z(698) => 
               N956, Z(697) => N955, Z(696) => N954, Z(695) => N953, Z(694) => 
               N952, Z(693) => N951, Z(692) => N950, Z(691) => N949, Z(690) => 
               N948, Z(689) => N947, Z(688) => N946, Z(687) => N945, Z(686) => 
               N944, Z(685) => N943, Z(684) => N942, Z(683) => N941, Z(682) => 
               N940, Z(681) => N939, Z(680) => N938, Z(679) => N937, Z(678) => 
               N936, Z(677) => N935, Z(676) => N934, Z(675) => N933, Z(674) => 
               N932, Z(673) => N931, Z(672) => N930, Z(671) => N929, Z(670) => 
               N928, Z(669) => N927, Z(668) => N926, Z(667) => N925, Z(666) => 
               N924, Z(665) => N923, Z(664) => N922, Z(663) => N921, Z(662) => 
               N920, Z(661) => N919, Z(660) => N918, Z(659) => N917, Z(658) => 
               N916, Z(657) => N915, Z(656) => N914, Z(655) => N913, Z(654) => 
               N912, Z(653) => N911, Z(652) => N910, Z(651) => N909, Z(650) => 
               N908, Z(649) => N907, Z(648) => N906, Z(647) => N905, Z(646) => 
               N904, Z(645) => N903, Z(644) => N902, Z(643) => N901, Z(642) => 
               N900, Z(641) => N899, Z(640) => N898, Z(639) => N897, Z(638) => 
               N896, Z(637) => N895, Z(636) => N894, Z(635) => N893, Z(634) => 
               N892, Z(633) => N891, Z(632) => N890, Z(631) => N889, Z(630) => 
               N888, Z(629) => N887, Z(628) => N886, Z(627) => N885, Z(626) => 
               N884, Z(625) => N883, Z(624) => N882, Z(623) => N881, Z(622) => 
               N880, Z(621) => N879, Z(620) => N878, Z(619) => N877, Z(618) => 
               N876, Z(617) => N875, Z(616) => N874, Z(615) => N873, Z(614) => 
               N872, Z(613) => N871, Z(612) => N870, Z(611) => N869, Z(610) => 
               N868, Z(609) => N867, Z(608) => N866, Z(607) => N865, Z(606) => 
               N864, Z(605) => N863, Z(604) => N862, Z(603) => N861, Z(602) => 
               N860, Z(601) => N859, Z(600) => N858, Z(599) => N857, Z(598) => 
               N856, Z(597) => N855, Z(596) => N854, Z(595) => N853, Z(594) => 
               N852, Z(593) => N851, Z(592) => N850, Z(591) => N849, Z(590) => 
               N848, Z(589) => N847, Z(588) => N846, Z(587) => N845, Z(586) => 
               N844, Z(585) => N843, Z(584) => N842, Z(583) => N841, Z(582) => 
               N840, Z(581) => N839, Z(580) => N838, Z(579) => N837, Z(578) => 
               N836, Z(577) => N835, Z(576) => N834, Z(575) => N833, Z(574) => 
               N832, Z(573) => N831, Z(572) => N830, Z(571) => N829, Z(570) => 
               N828, Z(569) => N827, Z(568) => N826, Z(567) => N825, Z(566) => 
               N824, Z(565) => N823, Z(564) => N822, Z(563) => N821, Z(562) => 
               N820, Z(561) => N819, Z(560) => N818, Z(559) => N817, Z(558) => 
               N816, Z(557) => N815, Z(556) => N814, Z(555) => N813, Z(554) => 
               N812, Z(553) => N811, Z(552) => N810, Z(551) => N809, Z(550) => 
               N808, Z(549) => N807, Z(548) => N806, Z(547) => N805, Z(546) => 
               N804, Z(545) => N803, Z(544) => N802, Z(543) => N801, Z(542) => 
               N800, Z(541) => N799, Z(540) => N798, Z(539) => N797, Z(538) => 
               N796, Z(537) => N795, Z(536) => N794, Z(535) => N793, Z(534) => 
               N792, Z(533) => N791, Z(532) => N790, Z(531) => N789, Z(530) => 
               N788, Z(529) => N787, Z(528) => N786, Z(527) => N785, Z(526) => 
               N784, Z(525) => N783, Z(524) => N782, Z(523) => N781, Z(522) => 
               N780, Z(521) => N779, Z(520) => N778, Z(519) => N777, Z(518) => 
               N776, Z(517) => N775, Z(516) => N774, Z(515) => N773, Z(514) => 
               N772, Z(513) => N771, Z(512) => N770, Z(511) => N769, Z(510) => 
               N768, Z(509) => N767, Z(508) => N766, Z(507) => N765, Z(506) => 
               N764, Z(505) => N763, Z(504) => N762, Z(503) => N761, Z(502) => 
               N760, Z(501) => N759, Z(500) => N758, Z(499) => N757, Z(498) => 
               N756, Z(497) => N755, Z(496) => N754, Z(495) => N753, Z(494) => 
               N752, Z(493) => N751, Z(492) => N750, Z(491) => N749, Z(490) => 
               N748, Z(489) => N747, Z(488) => N746, Z(487) => N745, Z(486) => 
               N744, Z(485) => N743, Z(484) => N742, Z(483) => N741, Z(482) => 
               N740, Z(481) => N739, Z(480) => N738, Z(479) => N737, Z(478) => 
               N736, Z(477) => N735, Z(476) => N734, Z(475) => N733, Z(474) => 
               N732, Z(473) => N731, Z(472) => N730, Z(471) => N729, Z(470) => 
               N728, Z(469) => N727, Z(468) => N726, Z(467) => N725, Z(466) => 
               N724, Z(465) => N723, Z(464) => N722, Z(463) => N721, Z(462) => 
               N720, Z(461) => N719, Z(460) => N718, Z(459) => N717, Z(458) => 
               N716, Z(457) => N715, Z(456) => N714, Z(455) => N713, Z(454) => 
               N712, Z(453) => N711, Z(452) => N710, Z(451) => N709, Z(450) => 
               N708, Z(449) => N707, Z(448) => N706, Z(447) => N705, Z(446) => 
               N704, Z(445) => N703, Z(444) => N702, Z(443) => N701, Z(442) => 
               N700, Z(441) => N699, Z(440) => N698, Z(439) => N697, Z(438) => 
               N696, Z(437) => N695, Z(436) => N694, Z(435) => N693, Z(434) => 
               N692, Z(433) => N691, Z(432) => N690, Z(431) => N689, Z(430) => 
               N688, Z(429) => N687, Z(428) => N686, Z(427) => N685, Z(426) => 
               N684, Z(425) => N683, Z(424) => N682, Z(423) => N681, Z(422) => 
               N680, Z(421) => N679, Z(420) => N678, Z(419) => N677, Z(418) => 
               N676, Z(417) => N675, Z(416) => N674, Z(415) => N673, Z(414) => 
               N672, Z(413) => N671, Z(412) => N670, Z(411) => N669, Z(410) => 
               N668, Z(409) => N667, Z(408) => N666, Z(407) => N665, Z(406) => 
               N664, Z(405) => N663, Z(404) => N662, Z(403) => N661, Z(402) => 
               N660, Z(401) => N659, Z(400) => N658, Z(399) => N657, Z(398) => 
               N656, Z(397) => N655, Z(396) => N654, Z(395) => N653, Z(394) => 
               N652, Z(393) => N651, Z(392) => N650, Z(391) => N649, Z(390) => 
               N648, Z(389) => N647, Z(388) => N646, Z(387) => N645, Z(386) => 
               N644, Z(385) => N643, Z(384) => N642, Z(383) => N641, Z(382) => 
               N640, Z(381) => N639, Z(380) => N638, Z(379) => N637, Z(378) => 
               N636, Z(377) => N635, Z(376) => N634, Z(375) => N633, Z(374) => 
               N632, Z(373) => N631, Z(372) => N630, Z(371) => N629, Z(370) => 
               N628, Z(369) => N627, Z(368) => N626, Z(367) => N625, Z(366) => 
               N624, Z(365) => N623, Z(364) => N622, Z(363) => N621, Z(362) => 
               N620, Z(361) => N619, Z(360) => N618, Z(359) => N617, Z(358) => 
               N616, Z(357) => N615, Z(356) => N614, Z(355) => N613, Z(354) => 
               N612, Z(353) => N611, Z(352) => N610, Z(351) => N609, Z(350) => 
               N608, Z(349) => N607, Z(348) => N606, Z(347) => N605, Z(346) => 
               N604, Z(345) => N603, Z(344) => N602, Z(343) => N601, Z(342) => 
               N600, Z(341) => N599, Z(340) => N598, Z(339) => N597, Z(338) => 
               N596, Z(337) => N595, Z(336) => N594, Z(335) => N593, Z(334) => 
               N592, Z(333) => N591, Z(332) => N590, Z(331) => N589, Z(330) => 
               N588, Z(329) => N587, Z(328) => N586, Z(327) => N585, Z(326) => 
               N584, Z(325) => N583, Z(324) => N582, Z(323) => N581, Z(322) => 
               N580, Z(321) => N579, Z(320) => N578, Z(319) => N577, Z(318) => 
               N576, Z(317) => N575, Z(316) => N574, Z(315) => N573, Z(314) => 
               N572, Z(313) => N571, Z(312) => N570, Z(311) => N569, Z(310) => 
               N568, Z(309) => N567, Z(308) => N566, Z(307) => N565, Z(306) => 
               N564, Z(305) => N563, Z(304) => N562, Z(303) => N561, Z(302) => 
               N560, Z(301) => N559, Z(300) => N558, Z(299) => N557, Z(298) => 
               N556, Z(297) => N555, Z(296) => N554, Z(295) => N553, Z(294) => 
               N552, Z(293) => N551, Z(292) => N550, Z(291) => N549, Z(290) => 
               N548, Z(289) => N547, Z(288) => N546, Z(287) => N545, Z(286) => 
               N544, Z(285) => N543, Z(284) => N542, Z(283) => N541, Z(282) => 
               N540, Z(281) => N539, Z(280) => N538, Z(279) => N537, Z(278) => 
               N536, Z(277) => N535, Z(276) => N534, Z(275) => N533, Z(274) => 
               N532, Z(273) => N531, Z(272) => N530, Z(271) => N529, Z(270) => 
               N528, Z(269) => N527, Z(268) => N526, Z(267) => N525, Z(266) => 
               N524, Z(265) => N523, Z(264) => N522, Z(263) => N521, Z(262) => 
               N520, Z(261) => N519, Z(260) => N518, Z(259) => N517, Z(258) => 
               N516, Z(257) => N515, Z(256) => N514, Z(255) => N513, Z(254) => 
               N512, Z(253) => N511, Z(252) => N510, Z(251) => N509, Z(250) => 
               N508, Z(249) => N507, Z(248) => N506, Z(247) => N505, Z(246) => 
               N504, Z(245) => N503, Z(244) => N502, Z(243) => N501, Z(242) => 
               N500, Z(241) => N499, Z(240) => N498, Z(239) => N497, Z(238) => 
               N496, Z(237) => N495, Z(236) => N494, Z(235) => N493, Z(234) => 
               N492, Z(233) => N491, Z(232) => N490, Z(231) => N489, Z(230) => 
               N488, Z(229) => N487, Z(228) => N486, Z(227) => N485, Z(226) => 
               N484, Z(225) => N483, Z(224) => N482, Z(223) => N481, Z(222) => 
               N480, Z(221) => N479, Z(220) => N478, Z(219) => N477, Z(218) => 
               N476, Z(217) => N475, Z(216) => N474, Z(215) => N473, Z(214) => 
               N472, Z(213) => N471, Z(212) => N470, Z(211) => N469, Z(210) => 
               N468, Z(209) => N467, Z(208) => N466, Z(207) => N465, Z(206) => 
               N464, Z(205) => N463, Z(204) => N462, Z(203) => N461, Z(202) => 
               N460, Z(201) => N459, Z(200) => N458, Z(199) => N457, Z(198) => 
               N456, Z(197) => N455, Z(196) => N454, Z(195) => N453, Z(194) => 
               N452, Z(193) => N451, Z(192) => N450, Z(191) => N449, Z(190) => 
               N448, Z(189) => N447, Z(188) => N446, Z(187) => N445, Z(186) => 
               N444, Z(185) => N443, Z(184) => N442, Z(183) => N441, Z(182) => 
               N440, Z(181) => N439, Z(180) => N438, Z(179) => N437, Z(178) => 
               N436, Z(177) => N435, Z(176) => N434, Z(175) => N433, Z(174) => 
               N432, Z(173) => N431, Z(172) => N430, Z(171) => N429, Z(170) => 
               N428, Z(169) => N427, Z(168) => N426, Z(167) => N425, Z(166) => 
               N424, Z(165) => N423, Z(164) => N422, Z(163) => N421, Z(162) => 
               N420, Z(161) => N419, Z(160) => N418, Z(159) => N417, Z(158) => 
               N416, Z(157) => N415, Z(156) => N414, Z(155) => N413, Z(154) => 
               N412, Z(153) => N411, Z(152) => N410, Z(151) => N409, Z(150) => 
               N408, Z(149) => N407, Z(148) => N406, Z(147) => N405, Z(146) => 
               N404, Z(145) => N403, Z(144) => N402, Z(143) => N401, Z(142) => 
               N400, Z(141) => N399, Z(140) => N398, Z(139) => N397, Z(138) => 
               N396, Z(137) => N395, Z(136) => N394, Z(135) => N393, Z(134) => 
               N392, Z(133) => N391, Z(132) => N390, Z(131) => N389, Z(130) => 
               N388, Z(129) => N387, Z(128) => N386, Z(127) => N385, Z(126) => 
               N384, Z(125) => N383, Z(124) => N382, Z(123) => N381, Z(122) => 
               N380, Z(121) => N379, Z(120) => N378, Z(119) => N377, Z(118) => 
               N376, Z(117) => N375, Z(116) => N374, Z(115) => N373, Z(114) => 
               N372, Z(113) => N371, Z(112) => N370, Z(111) => N369, Z(110) => 
               N368, Z(109) => N367, Z(108) => N366, Z(107) => N365, Z(106) => 
               N364, Z(105) => N363, Z(104) => N362, Z(103) => N361, Z(102) => 
               N360, Z(101) => N359, Z(100) => N358, Z(99) => N357, Z(98) => 
               N356, Z(97) => N355, Z(96) => N354, Z(95) => N353, Z(94) => N352
               , Z(93) => N351, Z(92) => N350, Z(91) => N349, Z(90) => N348, 
               Z(89) => N347, Z(88) => N346, Z(87) => N345, Z(86) => N344, 
               Z(85) => N343, Z(84) => N342, Z(83) => N341, Z(82) => N340, 
               Z(81) => N339, Z(80) => N338, Z(79) => N337, Z(78) => N336, 
               Z(77) => N335, Z(76) => N334, Z(75) => N333, Z(74) => N332, 
               Z(73) => N331, Z(72) => N330, Z(71) => N329, Z(70) => N328, 
               Z(69) => N327, Z(68) => N326, Z(67) => N325, Z(66) => N324, 
               Z(65) => N323, Z(64) => N322, Z(63) => N321, Z(62) => N320, 
               Z(61) => N319, Z(60) => N318, Z(59) => N317, Z(58) => N316, 
               Z(57) => N315, Z(56) => N314, Z(55) => N313, Z(54) => N312, 
               Z(53) => N311, Z(52) => N310, Z(51) => N309, Z(50) => N308, 
               Z(49) => N307, Z(48) => N306, Z(47) => N305, Z(46) => N304, 
               Z(45) => N303, Z(44) => N302, Z(43) => N301, Z(42) => N300, 
               Z(41) => N299, Z(40) => N298, Z(39) => N297, Z(38) => N296, 
               Z(37) => N295, Z(36) => N294, Z(35) => N293, Z(34) => N292, 
               Z(33) => N291, Z(32) => N290, Z(31) => N289, Z(30) => N288, 
               Z(29) => N287, Z(28) => N286, Z(27) => N285, Z(26) => N284, 
               Z(25) => N283, Z(24) => N282, Z(23) => N281, Z(22) => N280, 
               Z(21) => N279, Z(20) => N278, Z(19) => N277, Z(18) => N276, 
               Z(17) => N275, Z(16) => N274, Z(15) => N273, Z(14) => N272, 
               Z(13) => N271, Z(12) => N270, Z(11) => N269, Z(10) => N268, Z(9)
               => N267, Z(8) => N266, Z(7) => N265, Z(6) => N264, Z(5) => N263,
               Z(4) => N262, Z(3) => N261, Z(2) => N260, Z(1) => N259, Z(0) => 
               N258 );
   B_0 : GTECH_BUF port map( A => N225, Z => N158);
   C4470_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 32 )
      port map(
         -- Connections to port 'DATA1'
         DATA(31) => X_Logic0_port, DATA(30) => X_Logic0_port, DATA(29) => 
               X_Logic0_port, DATA(28) => X_Logic0_port, DATA(27) => 
               X_Logic0_port, DATA(26) => X_Logic0_port, DATA(25) => 
               X_Logic0_port, DATA(24) => X_Logic0_port, DATA(23) => 
               X_Logic0_port, DATA(22) => X_Logic0_port, DATA(21) => 
               X_Logic0_port, DATA(20) => X_Logic0_port, DATA(19) => 
               X_Logic0_port, DATA(18) => X_Logic0_port, DATA(17) => 
               X_Logic0_port, DATA(16) => X_Logic0_port, DATA(15) => 
               X_Logic0_port, DATA(14) => X_Logic0_port, DATA(13) => 
               X_Logic0_port, DATA(12) => X_Logic0_port, DATA(11) => 
               X_Logic0_port, DATA(10) => X_Logic0_port, DATA(9) => 
               X_Logic0_port, DATA(8) => X_Logic0_port, DATA(7) => 
               X_Logic0_port, DATA(6) => X_Logic0_port, DATA(5) => 
               X_Logic0_port, DATA(4) => X_Logic0_port, DATA(3) => 
               X_Logic0_port, DATA(2) => X_Logic0_port, DATA(1) => 
               X_Logic0_port, DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(63) => N1281, DATA(62) => N1282, DATA(61) => N1283, DATA(60) => 
               N1284, DATA(59) => N1285, DATA(58) => N1286, DATA(57) => N1287, 
               DATA(56) => N1288, DATA(55) => N1289, DATA(54) => N1290, 
               DATA(53) => N1291, DATA(52) => N1292, DATA(51) => N1293, 
               DATA(50) => N1294, DATA(49) => N1295, DATA(48) => N1296, 
               DATA(47) => N1297, DATA(46) => N1298, DATA(45) => N1299, 
               DATA(44) => N1300, DATA(43) => N1301, DATA(42) => N1302, 
               DATA(41) => N1303, DATA(40) => N1304, DATA(39) => N1305, 
               DATA(38) => N1306, DATA(37) => N1307, DATA(36) => N1308, 
               DATA(35) => N1309, DATA(34) => N1310, DATA(33) => N1311, 
               DATA(32) => N1312, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N159, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N160, 
         -- Connections to port 'Z'
         Z(31) => rdata1_31_port, Z(30) => rdata1_30_port, Z(29) => 
               rdata1_29_port, Z(28) => rdata1_28_port, Z(27) => rdata1_27_port
               , Z(26) => rdata1_26_port, Z(25) => rdata1_25_port, Z(24) => 
               rdata1_24_port, Z(23) => rdata1_23_port, Z(22) => rdata1_22_port
               , Z(21) => rdata1_21_port, Z(20) => rdata1_20_port, Z(19) => 
               rdata1_19_port, Z(18) => rdata1_18_port, Z(17) => rdata1_17_port
               , Z(16) => rdata1_16_port, Z(15) => rdata1_15_port, Z(14) => 
               rdata1_14_port, Z(13) => rdata1_13_port, Z(12) => rdata1_12_port
               , Z(11) => rdata1_11_port, Z(10) => rdata1_10_port, Z(9) => 
               rdata1_9_port, Z(8) => rdata1_8_port, Z(7) => rdata1_7_port, 
               Z(6) => rdata1_6_port, Z(5) => rdata1_5_port, Z(4) => 
               rdata1_4_port, Z(3) => rdata1_3_port, Z(2) => rdata1_2_port, 
               Z(1) => rdata1_1_port, Z(0) => rdata1_0_port );
   B_1 : GTECH_BUF port map( A => N1381, Z => N159);
   B_2 : GTECH_BUF port map( A => N1380, Z => N160);
   C4471_cell : SELECT_OP
      generic map ( num_inputs => 2, input_width => 32 )
      port map(
         -- Connections to port 'DATA1'
         DATA(31) => X_Logic0_port, DATA(30) => X_Logic0_port, DATA(29) => 
               X_Logic0_port, DATA(28) => X_Logic0_port, DATA(27) => 
               X_Logic0_port, DATA(26) => X_Logic0_port, DATA(25) => 
               X_Logic0_port, DATA(24) => X_Logic0_port, DATA(23) => 
               X_Logic0_port, DATA(22) => X_Logic0_port, DATA(21) => 
               X_Logic0_port, DATA(20) => X_Logic0_port, DATA(19) => 
               X_Logic0_port, DATA(18) => X_Logic0_port, DATA(17) => 
               X_Logic0_port, DATA(16) => X_Logic0_port, DATA(15) => 
               X_Logic0_port, DATA(14) => X_Logic0_port, DATA(13) => 
               X_Logic0_port, DATA(12) => X_Logic0_port, DATA(11) => 
               X_Logic0_port, DATA(10) => X_Logic0_port, DATA(9) => 
               X_Logic0_port, DATA(8) => X_Logic0_port, DATA(7) => 
               X_Logic0_port, DATA(6) => X_Logic0_port, DATA(5) => 
               X_Logic0_port, DATA(4) => X_Logic0_port, DATA(3) => 
               X_Logic0_port, DATA(2) => X_Logic0_port, DATA(1) => 
               X_Logic0_port, DATA(0) => X_Logic0_port, 
         -- Connections to port 'DATA2'
         DATA(63) => N1344, DATA(62) => N1345, DATA(61) => N1346, DATA(60) => 
               N1347, DATA(59) => N1348, DATA(58) => N1349, DATA(57) => N1350, 
               DATA(56) => N1351, DATA(55) => N1352, DATA(54) => N1353, 
               DATA(53) => N1354, DATA(52) => N1355, DATA(51) => N1356, 
               DATA(50) => N1357, DATA(49) => N1358, DATA(48) => N1359, 
               DATA(47) => N1360, DATA(46) => N1361, DATA(45) => N1362, 
               DATA(44) => N1363, DATA(43) => N1364, DATA(42) => N1365, 
               DATA(41) => N1366, DATA(40) => N1367, DATA(39) => N1368, 
               DATA(38) => N1369, DATA(37) => N1370, DATA(36) => N1371, 
               DATA(35) => N1372, DATA(34) => N1373, DATA(33) => N1374, 
               DATA(32) => N1375, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N161, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N162, 
         -- Connections to port 'Z'
         Z(31) => rdata2_31_port, Z(30) => rdata2_30_port, Z(29) => 
               rdata2_29_port, Z(28) => rdata2_28_port, Z(27) => rdata2_27_port
               , Z(26) => rdata2_26_port, Z(25) => rdata2_25_port, Z(24) => 
               rdata2_24_port, Z(23) => rdata2_23_port, Z(22) => rdata2_22_port
               , Z(21) => rdata2_21_port, Z(20) => rdata2_20_port, Z(19) => 
               rdata2_19_port, Z(18) => rdata2_18_port, Z(17) => rdata2_17_port
               , Z(16) => rdata2_16_port, Z(15) => rdata2_15_port, Z(14) => 
               rdata2_14_port, Z(13) => rdata2_13_port, Z(12) => rdata2_12_port
               , Z(11) => rdata2_11_port, Z(10) => rdata2_10_port, Z(9) => 
               rdata2_9_port, Z(8) => rdata2_8_port, Z(7) => rdata2_7_port, 
               Z(6) => rdata2_6_port, Z(5) => rdata2_5_port, Z(4) => 
               rdata2_4_port, Z(3) => rdata2_3_port, Z(2) => rdata2_2_port, 
               Z(1) => rdata2_1_port, Z(0) => rdata2_0_port );
   B_3 : GTECH_BUF port map( A => N1386, Z => N161);
   B_4 : GTECH_BUF port map( A => N1385, Z => N162);
   C4472_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_31_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_31_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_31_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_31_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_31_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_31_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_31_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_31_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_31_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_31_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_31_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_31_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_31_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_31_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_31_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_31_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_31_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_31_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_31_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_31_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_31_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_31_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_31_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_31_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_31_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_31_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_31_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_31_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_31_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_31_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_31_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1281 );
   B_5 : GTECH_BUF port map( A => N1251, Z => N163);
   B_6 : GTECH_BUF port map( A => N1253, Z => N164);
   B_7 : GTECH_BUF port map( A => N1255, Z => N165);
   B_8 : GTECH_BUF port map( A => N1257, Z => N166);
   B_9 : GTECH_BUF port map( A => N1259, Z => N167);
   B_10 : GTECH_BUF port map( A => N1261, Z => N168);
   B_11 : GTECH_BUF port map( A => N1263, Z => N169);
   B_12 : GTECH_BUF port map( A => N1265, Z => N170);
   B_13 : GTECH_BUF port map( A => N1267, Z => N171);
   B_14 : GTECH_BUF port map( A => N1269, Z => N172);
   B_15 : GTECH_BUF port map( A => N1271, Z => N173);
   B_16 : GTECH_BUF port map( A => N1273, Z => N174);
   B_17 : GTECH_BUF port map( A => N1275, Z => N175);
   B_18 : GTECH_BUF port map( A => N1277, Z => N176);
   B_19 : GTECH_BUF port map( A => N1279, Z => N177);
   B_20 : GTECH_BUF port map( A => N1250, Z => N178);
   B_21 : GTECH_BUF port map( A => N1252, Z => N179);
   B_22 : GTECH_BUF port map( A => N1254, Z => N180);
   B_23 : GTECH_BUF port map( A => N1256, Z => N181);
   B_24 : GTECH_BUF port map( A => N1258, Z => N182);
   B_25 : GTECH_BUF port map( A => N1260, Z => N183);
   B_26 : GTECH_BUF port map( A => N1262, Z => N184);
   B_27 : GTECH_BUF port map( A => N1264, Z => N185);
   B_28 : GTECH_BUF port map( A => N1266, Z => N186);
   B_29 : GTECH_BUF port map( A => N1268, Z => N187);
   B_30 : GTECH_BUF port map( A => N1270, Z => N188);
   B_31 : GTECH_BUF port map( A => N1272, Z => N189);
   B_32 : GTECH_BUF port map( A => N1274, Z => N190);
   B_33 : GTECH_BUF port map( A => N1276, Z => N191);
   B_34 : GTECH_BUF port map( A => N1278, Z => N192);
   B_35 : GTECH_BUF port map( A => N1280, Z => N193);
   C4473_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_30_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_30_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_30_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_30_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_30_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_30_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_30_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_30_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_30_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_30_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_30_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_30_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_30_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_30_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_30_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_30_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_30_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_30_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_30_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_30_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_30_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_30_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_30_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_30_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_30_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_30_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_30_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_30_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_30_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_30_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_30_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1282 );
   C4474_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_29_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_29_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_29_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_29_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_29_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_29_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_29_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_29_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_29_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_29_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_29_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_29_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_29_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_29_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_29_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_29_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_29_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_29_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_29_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_29_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_29_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_29_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_29_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_29_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_29_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_29_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_29_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_29_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_29_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_29_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_29_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1283 );
   C4475_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_28_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_28_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_28_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_28_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_28_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_28_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_28_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_28_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_28_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_28_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_28_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_28_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_28_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_28_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_28_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_28_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_28_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_28_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_28_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_28_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_28_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_28_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_28_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_28_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_28_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_28_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_28_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_28_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_28_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_28_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_28_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1284 );
   C4476_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_27_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_27_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_27_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_27_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_27_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_27_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_27_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_27_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_27_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_27_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_27_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_27_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_27_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_27_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_27_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_27_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_27_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_27_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_27_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_27_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_27_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_27_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_27_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_27_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_27_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_27_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_27_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_27_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_27_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_27_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_27_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1285 );
   C4477_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_26_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_26_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_26_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_26_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_26_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_26_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_26_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_26_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_26_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_26_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_26_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_26_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_26_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_26_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_26_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_26_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_26_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_26_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_26_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_26_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_26_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_26_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_26_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_26_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_26_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_26_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_26_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_26_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_26_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_26_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_26_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1286 );
   C4478_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_25_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_25_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_25_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_25_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_25_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_25_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_25_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_25_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_25_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_25_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_25_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_25_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_25_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_25_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_25_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_25_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_25_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_25_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_25_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_25_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_25_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_25_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_25_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_25_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_25_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_25_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_25_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_25_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_25_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_25_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_25_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1287 );
   C4479_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_24_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_24_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_24_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_24_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_24_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_24_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_24_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_24_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_24_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_24_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_24_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_24_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_24_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_24_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_24_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_24_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_24_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_24_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_24_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_24_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_24_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_24_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_24_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_24_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_24_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_24_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_24_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_24_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_24_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_24_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_24_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1288 );
   C4480_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_23_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_23_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_23_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_23_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_23_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_23_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_23_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_23_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_23_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_23_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_23_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_23_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_23_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_23_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_23_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_23_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_23_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_23_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_23_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_23_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_23_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_23_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_23_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_23_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_23_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_23_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_23_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_23_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_23_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_23_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_23_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1289 );
   C4481_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_22_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_22_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_22_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_22_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_22_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_22_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_22_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_22_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_22_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_22_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_22_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_22_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_22_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_22_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_22_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_22_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_22_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_22_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_22_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_22_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_22_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_22_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_22_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_22_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_22_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_22_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_22_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_22_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_22_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_22_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_22_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1290 );
   C4482_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_21_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_21_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_21_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_21_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_21_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_21_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_21_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_21_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_21_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_21_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_21_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_21_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_21_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_21_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_21_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_21_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_21_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_21_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_21_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_21_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_21_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_21_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_21_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_21_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_21_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_21_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_21_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_21_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_21_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_21_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_21_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1291 );
   C4483_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_20_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_20_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_20_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_20_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_20_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_20_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_20_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_20_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_20_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_20_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_20_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_20_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_20_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_20_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_20_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_20_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_20_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_20_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_20_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_20_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_20_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_20_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_20_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_20_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_20_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_20_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_20_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_20_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_20_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_20_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_20_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1292 );
   C4484_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_19_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_19_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_19_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_19_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_19_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_19_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_19_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_19_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_19_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_19_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_19_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_19_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_19_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_19_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_19_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_19_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_19_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_19_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_19_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_19_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_19_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_19_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_19_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_19_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_19_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_19_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_19_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_19_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_19_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_19_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_19_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1293 );
   C4485_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_18_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_18_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_18_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_18_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_18_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_18_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_18_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_18_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_18_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_18_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_18_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_18_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_18_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_18_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_18_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_18_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_18_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_18_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_18_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_18_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_18_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_18_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_18_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_18_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_18_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_18_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_18_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_18_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_18_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_18_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_18_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1294 );
   C4486_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_17_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_17_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_17_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_17_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_17_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_17_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_17_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_17_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_17_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_17_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_17_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_17_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_17_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_17_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_17_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_17_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_17_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_17_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_17_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_17_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_17_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_17_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_17_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_17_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_17_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_17_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_17_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_17_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_17_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_17_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_17_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1295 );
   C4487_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_16_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_16_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_16_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_16_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_16_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_16_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_16_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_16_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_16_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_16_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_16_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_16_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_16_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_16_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_16_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_16_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_16_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_16_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_16_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_16_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_16_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_16_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_16_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_16_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_16_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_16_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_16_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_16_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_16_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_16_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_16_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1296 );
   C4488_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_15_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_15_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_15_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_15_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_15_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_15_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_15_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_15_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_15_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_15_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_15_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_15_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_15_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_15_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_15_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_15_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_15_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_15_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_15_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_15_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_15_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_15_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_15_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_15_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_15_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_15_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_15_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_15_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_15_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_15_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_15_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1297 );
   C4489_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_14_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_14_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_14_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_14_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_14_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_14_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_14_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_14_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_14_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_14_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_14_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_14_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_14_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_14_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_14_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_14_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_14_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_14_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_14_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_14_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_14_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_14_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_14_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_14_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_14_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_14_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_14_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_14_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_14_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_14_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_14_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1298 );
   C4490_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_13_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_13_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_13_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_13_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_13_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_13_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_13_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_13_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_13_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_13_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_13_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_13_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_13_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_13_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_13_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_13_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_13_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_13_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_13_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_13_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_13_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_13_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_13_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_13_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_13_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_13_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_13_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_13_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_13_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_13_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_13_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1299 );
   C4491_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_12_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_12_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_12_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_12_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_12_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_12_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_12_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_12_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_12_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_12_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_12_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_12_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_12_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_12_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_12_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_12_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_12_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_12_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_12_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_12_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_12_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_12_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_12_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_12_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_12_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_12_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_12_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_12_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_12_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_12_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_12_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1300 );
   C4492_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_11_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_11_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_11_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_11_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_11_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_11_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_11_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_11_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_11_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_11_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_11_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_11_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_11_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_11_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_11_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_11_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_11_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_11_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_11_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_11_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_11_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_11_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_11_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_11_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_11_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_11_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_11_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_11_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_11_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_11_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_11_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1301 );
   C4493_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_10_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_10_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_10_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_10_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_10_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_10_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_10_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_10_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_10_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_10_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_10_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_10_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_10_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_10_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_10_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_10_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_10_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_10_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_10_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_10_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_10_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_10_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_10_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_10_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_10_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_10_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_10_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_10_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_10_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_10_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_10_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1302 );
   C4494_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_9_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_9_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_9_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_9_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_9_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_9_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_9_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_9_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_9_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_9_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_9_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_9_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_9_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_9_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_9_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_9_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_9_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_9_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_9_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_9_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_9_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_9_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_9_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_9_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_9_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_9_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_9_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_9_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_9_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_9_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_9_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1303 );
   C4495_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_8_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_8_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_8_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_8_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_8_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_8_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_8_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_8_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_8_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_8_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_8_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_8_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_8_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_8_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_8_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_8_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_8_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_8_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_8_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_8_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_8_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_8_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_8_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_8_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_8_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_8_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_8_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_8_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_8_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_8_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_8_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1304 );
   C4496_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_7_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_7_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_7_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_7_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_7_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_7_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_7_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_7_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_7_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_7_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_7_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_7_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_7_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_7_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_7_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_7_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_7_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_7_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_7_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_7_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_7_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_7_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_7_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_7_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_7_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_7_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_7_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_7_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_7_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_7_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_7_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1305 );
   C4497_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_6_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_6_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_6_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_6_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_6_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_6_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_6_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_6_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_6_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_6_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_6_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_6_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_6_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_6_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_6_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_6_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_6_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_6_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_6_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_6_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_6_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_6_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_6_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_6_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_6_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_6_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_6_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_6_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_6_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_6_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_6_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1306 );
   C4498_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_5_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_5_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_5_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_5_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_5_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_5_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_5_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_5_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_5_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_5_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_5_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_5_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_5_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_5_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_5_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_5_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_5_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_5_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_5_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_5_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_5_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_5_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_5_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_5_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_5_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_5_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_5_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_5_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_5_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_5_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_5_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1307 );
   C4499_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_4_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_4_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_4_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_4_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_4_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_4_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_4_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_4_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_4_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_4_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_4_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_4_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_4_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_4_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_4_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_4_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_4_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_4_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_4_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_4_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_4_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_4_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_4_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_4_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_4_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_4_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_4_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_4_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_4_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_4_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_4_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1308 );
   C4500_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_3_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_3_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_3_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_3_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_3_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_3_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_3_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_3_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_3_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_3_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_3_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_3_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_3_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_3_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_3_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_3_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_3_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_3_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_3_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_3_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_3_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_3_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_3_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_3_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_3_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_3_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_3_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_3_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_3_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_3_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_3_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1309 );
   C4501_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_2_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_2_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_2_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_2_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_2_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_2_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_2_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_2_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_2_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_2_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_2_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_2_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_2_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_2_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_2_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_2_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_2_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_2_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_2_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_2_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_2_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_2_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_2_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_2_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_2_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_2_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_2_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_2_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_2_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_2_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_2_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1310 );
   C4502_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_1_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_1_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_1_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_1_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_1_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_1_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_1_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_1_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_1_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_1_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_1_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_1_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_1_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_1_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_1_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_1_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_1_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_1_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_1_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_1_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_1_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_1_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_1_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_1_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_1_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_1_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_1_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_1_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_1_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_1_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_1_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1311 );
   C4503_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_0_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_0_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_0_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_0_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_0_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_0_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_0_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_0_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_0_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_0_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_0_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_0_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_0_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_0_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_0_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_0_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_0_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_0_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_0_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_0_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_0_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_0_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_0_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_0_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_0_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_0_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_0_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_0_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_0_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_0_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N163, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N164, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N165, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N166, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N167, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N168, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N169, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N170, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N171, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N172, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N173, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N174, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N175, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N176, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N177, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N178, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N179, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N180, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N181, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N182, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N183, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N184, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N185, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N186, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N187, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N188, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N189, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N190, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N191, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N192, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N193, 
         -- Connections to port 'Z'
         Z(0) => N1312 );
   C4504_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_31_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_31_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_31_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_31_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_31_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_31_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_31_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_31_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_31_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_31_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_31_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_31_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_31_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_31_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_31_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_31_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_31_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_31_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_31_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_31_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_31_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_31_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_31_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_31_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_31_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_31_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_31_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_31_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_31_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_31_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_31_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1344 );
   B_36 : GTECH_BUF port map( A => N1314, Z => N194);
   B_37 : GTECH_BUF port map( A => N1316, Z => N195);
   B_38 : GTECH_BUF port map( A => N1318, Z => N196);
   B_39 : GTECH_BUF port map( A => N1320, Z => N197);
   B_40 : GTECH_BUF port map( A => N1322, Z => N198);
   B_41 : GTECH_BUF port map( A => N1324, Z => N199);
   B_42 : GTECH_BUF port map( A => N1326, Z => N200);
   B_43 : GTECH_BUF port map( A => N1328, Z => N201);
   B_44 : GTECH_BUF port map( A => N1330, Z => N202);
   B_45 : GTECH_BUF port map( A => N1332, Z => N203);
   B_46 : GTECH_BUF port map( A => N1334, Z => N204);
   B_47 : GTECH_BUF port map( A => N1336, Z => N205);
   B_48 : GTECH_BUF port map( A => N1338, Z => N206);
   B_49 : GTECH_BUF port map( A => N1340, Z => N207);
   B_50 : GTECH_BUF port map( A => N1342, Z => N208);
   B_51 : GTECH_BUF port map( A => N1313, Z => N209);
   B_52 : GTECH_BUF port map( A => N1315, Z => N210);
   B_53 : GTECH_BUF port map( A => N1317, Z => N211);
   B_54 : GTECH_BUF port map( A => N1319, Z => N212);
   B_55 : GTECH_BUF port map( A => N1321, Z => N213);
   B_56 : GTECH_BUF port map( A => N1323, Z => N214);
   B_57 : GTECH_BUF port map( A => N1325, Z => N215);
   B_58 : GTECH_BUF port map( A => N1327, Z => N216);
   B_59 : GTECH_BUF port map( A => N1329, Z => N217);
   B_60 : GTECH_BUF port map( A => N1331, Z => N218);
   B_61 : GTECH_BUF port map( A => N1333, Z => N219);
   B_62 : GTECH_BUF port map( A => N1335, Z => N220);
   B_63 : GTECH_BUF port map( A => N1337, Z => N221);
   B_64 : GTECH_BUF port map( A => N1339, Z => N222);
   B_65 : GTECH_BUF port map( A => N1341, Z => N223);
   B_66 : GTECH_BUF port map( A => N1343, Z => N224);
   C4505_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_30_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_30_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_30_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_30_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_30_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_30_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_30_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_30_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_30_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_30_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_30_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_30_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_30_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_30_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_30_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_30_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_30_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_30_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_30_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_30_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_30_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_30_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_30_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_30_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_30_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_30_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_30_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_30_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_30_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_30_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_30_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1345 );
   C4506_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_29_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_29_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_29_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_29_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_29_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_29_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_29_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_29_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_29_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_29_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_29_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_29_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_29_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_29_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_29_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_29_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_29_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_29_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_29_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_29_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_29_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_29_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_29_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_29_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_29_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_29_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_29_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_29_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_29_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_29_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_29_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1346 );
   C4507_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_28_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_28_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_28_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_28_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_28_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_28_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_28_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_28_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_28_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_28_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_28_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_28_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_28_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_28_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_28_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_28_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_28_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_28_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_28_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_28_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_28_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_28_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_28_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_28_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_28_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_28_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_28_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_28_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_28_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_28_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_28_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1347 );
   C4508_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_27_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_27_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_27_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_27_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_27_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_27_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_27_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_27_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_27_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_27_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_27_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_27_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_27_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_27_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_27_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_27_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_27_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_27_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_27_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_27_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_27_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_27_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_27_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_27_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_27_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_27_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_27_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_27_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_27_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_27_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_27_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1348 );
   C4509_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_26_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_26_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_26_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_26_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_26_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_26_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_26_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_26_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_26_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_26_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_26_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_26_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_26_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_26_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_26_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_26_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_26_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_26_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_26_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_26_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_26_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_26_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_26_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_26_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_26_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_26_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_26_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_26_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_26_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_26_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_26_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1349 );
   C4510_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_25_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_25_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_25_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_25_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_25_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_25_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_25_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_25_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_25_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_25_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_25_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_25_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_25_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_25_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_25_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_25_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_25_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_25_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_25_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_25_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_25_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_25_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_25_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_25_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_25_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_25_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_25_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_25_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_25_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_25_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_25_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1350 );
   C4511_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_24_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_24_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_24_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_24_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_24_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_24_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_24_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_24_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_24_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_24_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_24_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_24_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_24_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_24_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_24_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_24_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_24_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_24_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_24_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_24_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_24_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_24_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_24_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_24_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_24_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_24_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_24_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_24_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_24_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_24_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_24_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1351 );
   C4512_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_23_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_23_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_23_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_23_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_23_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_23_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_23_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_23_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_23_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_23_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_23_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_23_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_23_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_23_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_23_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_23_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_23_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_23_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_23_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_23_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_23_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_23_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_23_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_23_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_23_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_23_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_23_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_23_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_23_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_23_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_23_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1352 );
   C4513_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_22_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_22_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_22_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_22_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_22_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_22_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_22_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_22_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_22_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_22_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_22_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_22_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_22_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_22_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_22_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_22_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_22_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_22_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_22_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_22_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_22_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_22_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_22_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_22_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_22_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_22_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_22_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_22_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_22_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_22_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_22_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1353 );
   C4514_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_21_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_21_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_21_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_21_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_21_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_21_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_21_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_21_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_21_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_21_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_21_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_21_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_21_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_21_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_21_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_21_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_21_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_21_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_21_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_21_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_21_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_21_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_21_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_21_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_21_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_21_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_21_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_21_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_21_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_21_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_21_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1354 );
   C4515_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_20_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_20_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_20_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_20_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_20_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_20_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_20_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_20_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_20_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_20_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_20_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_20_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_20_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_20_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_20_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_20_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_20_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_20_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_20_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_20_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_20_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_20_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_20_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_20_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_20_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_20_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_20_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_20_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_20_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_20_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_20_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1355 );
   C4516_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_19_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_19_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_19_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_19_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_19_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_19_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_19_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_19_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_19_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_19_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_19_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_19_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_19_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_19_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_19_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_19_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_19_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_19_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_19_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_19_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_19_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_19_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_19_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_19_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_19_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_19_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_19_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_19_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_19_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_19_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_19_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1356 );
   C4517_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_18_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_18_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_18_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_18_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_18_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_18_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_18_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_18_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_18_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_18_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_18_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_18_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_18_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_18_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_18_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_18_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_18_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_18_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_18_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_18_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_18_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_18_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_18_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_18_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_18_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_18_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_18_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_18_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_18_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_18_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_18_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1357 );
   C4518_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_17_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_17_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_17_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_17_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_17_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_17_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_17_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_17_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_17_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_17_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_17_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_17_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_17_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_17_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_17_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_17_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_17_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_17_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_17_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_17_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_17_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_17_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_17_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_17_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_17_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_17_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_17_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_17_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_17_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_17_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_17_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1358 );
   C4519_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_16_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_16_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_16_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_16_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_16_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_16_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_16_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_16_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_16_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_16_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_16_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_16_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_16_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_16_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_16_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_16_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_16_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_16_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_16_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_16_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_16_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_16_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_16_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_16_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_16_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_16_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_16_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_16_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_16_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_16_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_16_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1359 );
   C4520_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_15_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_15_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_15_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_15_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_15_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_15_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_15_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_15_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_15_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_15_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_15_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_15_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_15_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_15_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_15_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_15_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_15_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_15_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_15_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_15_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_15_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_15_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_15_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_15_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_15_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_15_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_15_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_15_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_15_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_15_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_15_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1360 );
   C4521_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_14_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_14_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_14_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_14_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_14_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_14_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_14_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_14_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_14_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_14_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_14_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_14_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_14_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_14_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_14_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_14_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_14_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_14_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_14_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_14_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_14_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_14_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_14_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_14_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_14_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_14_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_14_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_14_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_14_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_14_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_14_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1361 );
   C4522_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_13_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_13_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_13_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_13_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_13_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_13_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_13_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_13_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_13_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_13_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_13_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_13_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_13_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_13_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_13_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_13_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_13_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_13_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_13_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_13_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_13_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_13_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_13_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_13_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_13_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_13_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_13_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_13_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_13_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_13_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_13_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1362 );
   C4523_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_12_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_12_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_12_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_12_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_12_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_12_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_12_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_12_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_12_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_12_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_12_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_12_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_12_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_12_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_12_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_12_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_12_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_12_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_12_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_12_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_12_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_12_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_12_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_12_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_12_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_12_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_12_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_12_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_12_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_12_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_12_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1363 );
   C4524_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_11_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_11_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_11_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_11_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_11_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_11_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_11_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_11_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_11_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_11_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_11_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_11_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_11_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_11_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_11_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_11_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_11_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_11_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_11_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_11_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_11_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_11_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_11_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_11_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_11_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_11_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_11_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_11_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_11_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_11_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_11_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1364 );
   C4525_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_10_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_10_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_10_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_10_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_10_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_10_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_10_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_10_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_10_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_10_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_10_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_10_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_10_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_10_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_10_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_10_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_10_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_10_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_10_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_10_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_10_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_10_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_10_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_10_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_10_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_10_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_10_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_10_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_10_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_10_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_10_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1365 );
   C4526_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_9_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_9_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_9_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_9_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_9_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_9_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_9_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_9_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_9_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_9_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_9_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_9_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_9_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_9_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_9_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_9_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_9_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_9_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_9_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_9_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_9_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_9_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_9_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_9_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_9_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_9_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_9_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_9_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_9_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_9_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_9_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1366 );
   C4527_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_8_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_8_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_8_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_8_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_8_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_8_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_8_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_8_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_8_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_8_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_8_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_8_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_8_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_8_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_8_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_8_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_8_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_8_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_8_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_8_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_8_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_8_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_8_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_8_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_8_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_8_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_8_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_8_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_8_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_8_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_8_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1367 );
   C4528_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_7_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_7_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_7_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_7_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_7_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_7_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_7_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_7_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_7_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_7_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_7_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_7_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_7_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_7_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_7_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_7_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_7_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_7_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_7_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_7_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_7_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_7_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_7_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_7_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_7_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_7_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_7_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_7_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_7_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_7_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_7_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1368 );
   C4529_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_6_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_6_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_6_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_6_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_6_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_6_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_6_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_6_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_6_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_6_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_6_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_6_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_6_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_6_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_6_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_6_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_6_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_6_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_6_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_6_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_6_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_6_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_6_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_6_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_6_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_6_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_6_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_6_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_6_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_6_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_6_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1369 );
   C4530_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_5_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_5_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_5_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_5_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_5_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_5_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_5_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_5_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_5_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_5_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_5_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_5_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_5_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_5_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_5_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_5_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_5_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_5_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_5_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_5_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_5_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_5_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_5_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_5_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_5_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_5_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_5_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_5_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_5_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_5_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_5_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1370 );
   C4531_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_4_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_4_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_4_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_4_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_4_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_4_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_4_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_4_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_4_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_4_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_4_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_4_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_4_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_4_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_4_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_4_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_4_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_4_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_4_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_4_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_4_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_4_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_4_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_4_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_4_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_4_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_4_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_4_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_4_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_4_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_4_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1371 );
   C4532_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_3_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_3_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_3_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_3_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_3_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_3_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_3_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_3_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_3_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_3_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_3_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_3_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_3_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_3_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_3_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_3_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_3_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_3_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_3_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_3_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_3_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_3_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_3_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_3_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_3_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_3_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_3_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_3_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_3_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_3_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_3_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1372 );
   C4533_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_2_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_2_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_2_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_2_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_2_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_2_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_2_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_2_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_2_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_2_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_2_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_2_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_2_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_2_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_2_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_2_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_2_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_2_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_2_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_2_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_2_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_2_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_2_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_2_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_2_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_2_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_2_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_2_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_2_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_2_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_2_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1373 );
   C4534_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_1_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_1_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_1_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_1_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_1_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_1_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_1_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_1_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_1_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_1_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_1_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_1_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_1_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_1_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_1_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_1_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_1_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_1_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_1_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_1_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_1_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_1_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_1_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_1_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_1_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_1_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_1_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_1_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_1_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_1_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_1_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1374 );
   C4535_cell : SELECT_OP
      generic map ( num_inputs => 31, input_width => 1 )
      port map(
         -- Connections to port 'DATA1'
         DATA(0) => regs_r_1_0_port, 
         -- Connections to port 'DATA2'
         DATA(1) => regs_r_2_0_port, 
         -- Connections to port 'DATA3'
         DATA(2) => regs_r_3_0_port, 
         -- Connections to port 'DATA4'
         DATA(3) => regs_r_4_0_port, 
         -- Connections to port 'DATA5'
         DATA(4) => regs_r_5_0_port, 
         -- Connections to port 'DATA6'
         DATA(5) => regs_r_6_0_port, 
         -- Connections to port 'DATA7'
         DATA(6) => regs_r_7_0_port, 
         -- Connections to port 'DATA8'
         DATA(7) => regs_r_8_0_port, 
         -- Connections to port 'DATA9'
         DATA(8) => regs_r_9_0_port, 
         -- Connections to port 'DATA10'
         DATA(9) => regs_r_10_0_port, 
         -- Connections to port 'DATA11'
         DATA(10) => regs_r_11_0_port, 
         -- Connections to port 'DATA12'
         DATA(11) => regs_r_12_0_port, 
         -- Connections to port 'DATA13'
         DATA(12) => regs_r_13_0_port, 
         -- Connections to port 'DATA14'
         DATA(13) => regs_r_14_0_port, 
         -- Connections to port 'DATA15'
         DATA(14) => regs_r_15_0_port, 
         -- Connections to port 'DATA16'
         DATA(15) => regs_r_16_0_port, 
         -- Connections to port 'DATA17'
         DATA(16) => regs_r_17_0_port, 
         -- Connections to port 'DATA18'
         DATA(17) => regs_r_18_0_port, 
         -- Connections to port 'DATA19'
         DATA(18) => regs_r_19_0_port, 
         -- Connections to port 'DATA20'
         DATA(19) => regs_r_20_0_port, 
         -- Connections to port 'DATA21'
         DATA(20) => regs_r_21_0_port, 
         -- Connections to port 'DATA22'
         DATA(21) => regs_r_22_0_port, 
         -- Connections to port 'DATA23'
         DATA(22) => regs_r_23_0_port, 
         -- Connections to port 'DATA24'
         DATA(23) => regs_r_24_0_port, 
         -- Connections to port 'DATA25'
         DATA(24) => regs_r_25_0_port, 
         -- Connections to port 'DATA26'
         DATA(25) => regs_r_26_0_port, 
         -- Connections to port 'DATA27'
         DATA(26) => regs_r_27_0_port, 
         -- Connections to port 'DATA28'
         DATA(27) => regs_r_28_0_port, 
         -- Connections to port 'DATA29'
         DATA(28) => regs_r_29_0_port, 
         -- Connections to port 'DATA30'
         DATA(29) => regs_r_30_0_port, 
         -- Connections to port 'DATA31'
         DATA(30) => regs_r_31_0_port, 
         -- Connections to port 'CONTROL1'
         CONTROL(0) => N194, 
         -- Connections to port 'CONTROL2'
         CONTROL(1) => N195, 
         -- Connections to port 'CONTROL3'
         CONTROL(2) => N196, 
         -- Connections to port 'CONTROL4'
         CONTROL(3) => N197, 
         -- Connections to port 'CONTROL5'
         CONTROL(4) => N198, 
         -- Connections to port 'CONTROL6'
         CONTROL(5) => N199, 
         -- Connections to port 'CONTROL7'
         CONTROL(6) => N200, 
         -- Connections to port 'CONTROL8'
         CONTROL(7) => N201, 
         -- Connections to port 'CONTROL9'
         CONTROL(8) => N202, 
         -- Connections to port 'CONTROL10'
         CONTROL(9) => N203, 
         -- Connections to port 'CONTROL11'
         CONTROL(10) => N204, 
         -- Connections to port 'CONTROL12'
         CONTROL(11) => N205, 
         -- Connections to port 'CONTROL13'
         CONTROL(12) => N206, 
         -- Connections to port 'CONTROL14'
         CONTROL(13) => N207, 
         -- Connections to port 'CONTROL15'
         CONTROL(14) => N208, 
         -- Connections to port 'CONTROL16'
         CONTROL(15) => N209, 
         -- Connections to port 'CONTROL17'
         CONTROL(16) => N210, 
         -- Connections to port 'CONTROL18'
         CONTROL(17) => N211, 
         -- Connections to port 'CONTROL19'
         CONTROL(18) => N212, 
         -- Connections to port 'CONTROL20'
         CONTROL(19) => N213, 
         -- Connections to port 'CONTROL21'
         CONTROL(20) => N214, 
         -- Connections to port 'CONTROL22'
         CONTROL(21) => N215, 
         -- Connections to port 'CONTROL23'
         CONTROL(22) => N216, 
         -- Connections to port 'CONTROL24'
         CONTROL(23) => N217, 
         -- Connections to port 'CONTROL25'
         CONTROL(24) => N218, 
         -- Connections to port 'CONTROL26'
         CONTROL(25) => N219, 
         -- Connections to port 'CONTROL27'
         CONTROL(26) => N220, 
         -- Connections to port 'CONTROL28'
         CONTROL(27) => N221, 
         -- Connections to port 'CONTROL29'
         CONTROL(28) => N222, 
         -- Connections to port 'CONTROL30'
         CONTROL(29) => N223, 
         -- Connections to port 'CONTROL31'
         CONTROL(30) => N224, 
         -- Connections to port 'Z'
         Z(0) => N1375 );
         X_Logic0_port <= '0';
   C4538 : GTECH_AND2 port map( A => wrRegEn, B => N1390, Z => N225);
   I_162 : GTECH_NOT port map( A => N225, Z => N226);

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
