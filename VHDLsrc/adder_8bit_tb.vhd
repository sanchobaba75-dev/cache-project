library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VLSI_TestBench_pkg.all;

entity adder_8bit_tb is
end adder_8bit_tb;

architecture testbench of adder_8bit_tb is

  
  component adder_8bit
    port (
      a    : in  std_logic_vector(7 downto 0);
      b    : in  std_logic_vector(7 downto 0);
      cin  : in  std_logic;
      sum  : out std_logic_vector(7 downto 0);
      cout : out std_logic
    );
  end component;

  
  signal a_s    : std_logic_vector(7 downto 0);
  signal b_s    : std_logic_vector(7 downto 0);
  signal cin_s  : std_logic;
  signal sum_s  : std_logic_vector(7 downto 0);
  signal cout_s : std_logic;

  
  type test_record is record
    a         : std_logic_vector(7 downto 0);
    b         : std_logic_vector(7 downto 0);
    cin       : std_logic;
    expect_s  : std_logic_vector(7 downto 0);
    expect_co : std_logic;
  end record;

  type test_array is array (positive range <>) of test_record;

  
  constant test_patterns : test_array := (
    ( a => x"00", b => x"00", cin => '0', expect_s => x"00", expect_co => '0' ),
    ( a => x"01", b => x"01", cin => '0', expect_s => x"02", expect_co => '0' ),
    ( a => x"0F", b => x"01", cin => '0', expect_s => x"10", expect_co => '0' ),
    ( a => x"FF", b => x"01", cin => '0', expect_s => x"00", expect_co => '1' ),
    ( a => x"AA", b => x"55", cin => '0', expect_s => x"FF", expect_co => '0' ),
    ( a => x"FF", b => x"FF", cin => '1', expect_s => x"FF", expect_co => '1' )
  );

begin

  dut: adder_8bit
    port map (
      a    => a_s,
      b    => b_s,
      cin  => cin_s,
      sum  => sum_s,
      cout => cout_s
    );

  
  test_proc : process
    variable vector : test_record;
  begin
    wait for 5 ns;

    for i in test_patterns'range loop
      vector := test_patterns(i);

      
      a_s   <= vector.a;
      b_s   <= vector.b;
      cin_s <= vector.cin;

      
      wait for 4 ns;

      
      assert (sum_s = vector.expect_s)
        report "SUM ERROR: a="
             & to_hstring(a_s)
             & " b=" & to_hstring(b_s)
             & " cin=" & to_string(cin_s)
             & " -> sum=" & to_hstring(sum_s)
             & " expected=" & to_hstring(vector.expect_s)
        severity warning;

      
      assert (cout_s = vector.expect_co)
        report "CARRY ERROR: a="
             & to_hstring(a_s)
             & " b=" & to_hstring(b_s)
             & " cin=" & to_string(cin_s)
             & " -> cout=" & to_string(cout_s)
             & " expected=" & to_string(vector.expect_co)
        severity warning;

      
      wait for 1 ns;
    end loop;

    assert false
      report "8-bit Adder Test Done"
      severity note;

    wait;
  end process;

end architecture testbench;


configuration Adder8TB_Config_structural of adder_8bit_tb is
  for testbench
    for dut : adder_8bit
      use entity work.adder_8bit(structural);
    end for;
  end for;
end configuration Adder8TB_Config_structural;

configuration Adder8TB_Config_equations of adder_8bit_tb is
  for testbench
    for dut : adder_8bit
      use entity work.adder_8bit(equations);
    end for;
  end for;
end configuration;
