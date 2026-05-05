library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VLSI_TestBench_pkg.all;

entity full_adder_tb is
end full_adder_tb;

architecture testbench of full_adder_tb is
  component full_adder
    port (
      a     :  in std_logic;
      b     :  in std_logic;
      ci    :  in std_logic;
      s     : out std_logic;
      co    : out std_logic
    );
  end component;

  signal a_s  :   std_logic;
  signal b_s  :   std_logic;
  signal ci_s :   std_logic;
  signal s_s  :   std_logic;
  signal co_s :   std_logic;

  type test_record is record
    a         :     std_logic;
    b         :     std_logic;
    ci        :     std_logic;
    expect_s  :     std_logic;
    expect_co :     std_logic;
  end record;

  type test_array is array(positive range <>) of test_record;

  constant test_patterns: test_array := (
    ( a => '0', b => '0', ci => '0', expect_s => '0', expect_co => '0' ),
    ( a => '0', b => '0', ci => '1', expect_s => '1', expect_co => '0' ),
    ( a => '0', b => '1', ci => '0', expect_s => '1', expect_co => '0' ),
    ( a => '0', b => '1', ci => '1', expect_s => '0', expect_co => '1' ),
    ( a => '1', b => '0', ci => '0', expect_s => '1', expect_co => '0' ),
    ( a => '1', b => '0', ci => '1', expect_s => '0', expect_co => '1' ),
    ( a => '1', b => '1', ci => '0', expect_s => '0', expect_co => '1' ),
    ( a => '1', b => '1', ci => '1', expect_s => '1', expect_co => '1' ),
    ( a => '1', b => '1', ci => '1', expect_s => '0', expect_co => '0' )
  );

begin

  fa1: full_adder
    port map (
      a  => a_s,
      b  => b_s,
      ci => ci_s,
      s  => s_s,
      co => co_s
    );

  test: process
  
    variable vector:      test_record;
    variable found_error: boolean := false;

  begin
    wait for 5 ns;

    for I in test_patterns'range loop
      vector := test_patterns(i);
                            
      a_s  <= vector.a;
      b_s  <= vector.b;
      ci_s <= vector.ci;
                            
      wait for 4 ns;
                            
      assert (s_s = vector.expect_s)
        report "Error found during test: "
             & to_string(a_s)
             & " "  & to_string(b_s)
             & " "  & to_string(ci_s)
             & " => " & to_string(s_s)
             & " "  & to_string(co_s)
             & " expecting: "
             & to_string(vector.expect_s)
             & " "  & to_string(vector.expect_co)
        severity warning;


      assert (co_s = vector.expect_co)
        report "Error found during test: "
             & to_string(a_s)
             & " "  & to_string(b_s)
             & " "  & to_string(ci_s)
             & " => " & to_string(s_s)
             & " "  & to_string(co_s)
             & " expecting: "
             & to_string(vector.expect_s)
             & " "  & to_string(vector.expect_co)
        severity warning;

                             
      wait for 1 ns;
    end loop;

    assert false
      report "Test done"
      severity note;
    wait;
  end process;
end architecture testbench;

configuration FullAdderTB_Config_gates of full_adder_tb is
  for testbench
    for fa1: full_adder use entity work.full_adder(gates); end for;
  end for;
end configuration FullAdderTB_Config_gates;

configuration FullAdderTB_Config_rtl of full_adder_tb is
  for testbench
    for fa1: full_adder use entity work.full_adder(equation); end for;
  end for;
end configuration FullAdderTB_Config_rtl;
