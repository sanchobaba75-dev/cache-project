library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VLSI_TestBench_pkg.all;

entity adder_sub_8bit_tb is
end adder_sub_8bit_tb;

architecture testbench of adder_sub_8bit_tb is

  
  component adder_sub_8bit
    port (
      a     : in  std_logic_vector(7 downto 0);
      b     : in  std_logic_vector(7 downto 0);
      cin   : in  std_logic;
      A0_S1 : in  std_logic;  
      sum   : out std_logic_vector(7 downto 0);
      cout  : out std_logic
    );
  end component;


  signal a_s     : std_logic_vector(7 downto 0);
  signal b_s     : std_logic_vector(7 downto 0);
  signal cin_s   : std_logic;
  signal A0_S1_s : std_logic;
  signal sum_s   : std_logic_vector(7 downto 0);
  signal cout_s  : std_logic;

  
  type test_record is record
    a         : std_logic_vector(7 downto 0);
    b         : std_logic_vector(7 downto 0);
    cin       : std_logic;
    A0_S1     : std_logic;
    expect_s  : std_logic_vector(7 downto 0);
    expect_co : std_logic;
  end record;

  type test_array is array (positive range <>) of test_record;

  
  constant test_patterns : test_array := (
    
    ( a => x"00", b => x"00", cin => '0', A0_S1 => '0', expect_s => x"00", expect_co => '0' ),
    ( a => x"01", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"02", expect_co => '0' ),
    ( a => x"0F", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"10", expect_co => '0' ),
    ( a => x"FF", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"00", expect_co => '1' ),
    ( a => x"FF", b => x"FF", cin => '1', A0_S1 => '0', expect_s => x"FF", expect_co => '1' ),

    
    ( a => x"10", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"0F", expect_co => '1' ),
    ( a => x"0F", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"0E", expect_co => '1' ),
    ( a => x"03", b => x"05", cin => '0', A0_S1 => '1', expect_s => x"FE", expect_co => '0' ),
    ( a => x"00", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"FF", expect_co => '0' ),
    ( a => x"AA", b => x"55", cin => '0', A0_S1 => '1', expect_s => x"55", expect_co => '1' )
  );

begin

  
  dut: adder_sub_8bit
    port map (
      a     => a_s,
      b     => b_s,
      cin   => cin_s,
      A0_S1 => A0_S1_s,
      sum   => sum_s,
      cout  => cout_s
    );

  
  test_proc : process
    variable vector : test_record;
  begin
    wait for 5 ns;

    for i in test_patterns'range loop
      vector := test_patterns(i);

      a_s     <= vector.a;
      b_s     <= vector.b;
      cin_s   <= vector.cin;
      A0_S1_s <= vector.A0_S1;

      wait for 4 ns;

      assert (sum_s = vector.expect_s)
        report "SUM ERROR: a="
             & to_hstring(a_s)
             & " b=" & to_hstring(b_s)
             & " cin=" & to_string(cin_s)
             & " A0_S1=" & to_string(A0_S1_s)
             & " -> sum=" & to_hstring(sum_s)
             & " expected=" & to_hstring(vector.expect_s)
        severity warning;

      assert (cout_s = vector.expect_co)
        report "CARRY ERROR: a="
             & to_hstring(a_s)
             & " b=" & to_hstring(b_s)
             & " cin=" & to_string(cin_s)
             & " A0_S1=" & to_string(A0_S1_s)
             & " -> cout=" & to_string(cout_s)
             & " expected=" & to_string(vector.expect_co)
        severity warning;

      wait for 1 ns;
    end loop;

    assert false
      report "8-bit Adder-Subtractor Test Done"
      severity note;

    wait;
  end process;

end architecture testbench;


configuration AdderSub8TB_Config_rtl of adder_sub_8bit_tb is
  for testbench
    for dut : adder_sub_8bit
      use entity work.adder_sub_8bit(rtl);
    end for;
  end for;
end configuration AdderSub8TB_Config_rtl;