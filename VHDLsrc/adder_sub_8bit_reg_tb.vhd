library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VLSI_TestBench_pkg.all;

entity adder_sub_8bit_reg_tb is
end entity;

architecture testbench of adder_sub_8bit_reg_tb is

  component adder_sub_8bit_reg
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
  end component;

  signal clk_s    : std_logic := '0';
  signal rst_s    : std_logic := '1';
  signal a_s      : std_logic_vector(7 downto 0);
  signal b_s      : std_logic_vector(7 downto 0);
  signal cin_s    : std_logic;
  signal A0_S1_s  : std_logic;
  signal sum_s    : std_logic_vector(7 downto 0);
  signal cout_s   : std_logic;

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
    -- test array for addition
    ( a => x"00", b => x"00", cin => '0', A0_S1 => '0', expect_s => x"00", expect_co => '0' ),
    ( a => x"01", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"02", expect_co => '0' ),
    ( a => x"0F", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"10", expect_co => '0' ),
    ( a => x"FF", b => x"01", cin => '0', A0_S1 => '0', expect_s => x"00", expect_co => '1' ),
    ( a => x"FF", b => x"FF", cin => '1', A0_S1 => '0', expect_s => x"FF", expect_co => '1' ),

    -- test array for subtraction
    ( a => x"10", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"0F", expect_co => '1' ),
    ( a => x"0F", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"0E", expect_co => '1' ),
    ( a => x"03", b => x"05", cin => '0', A0_S1 => '1', expect_s => x"FE", expect_co => '0' ),
    ( a => x"00", b => x"01", cin => '0', A0_S1 => '1', expect_s => x"FF", expect_co => '0' ),
    ( a => x"AA", b => x"55", cin => '0', A0_S1 => '1', expect_s => x"55", expect_co => '1' )
  );

begin

  clk_s <= not clk_s after 5 ns;

  dut: adder_sub_8bit_reg
    port map (
      clk   => clk_s,
      rst   => rst_s,
      a     => a_s,
      b     => b_s,
      cin   => cin_s,
      A0_S1 => A0_S1_s,
      sum   => sum_s,
      cout  => cout_s
    );

  stim : process
    variable prev_vec : test_record;
  begin
    
    rst_s <= '1';
    wait for 20 ns;
    rst_s <= '0';

    
    wait until rising_edge(clk_s);

    prev_vec := test_patterns(1);

    for i in test_patterns'range loop

      a_s     <= test_patterns(i).a;
      b_s     <= test_patterns(i).b;
      cin_s   <= test_patterns(i).cin;
      A0_S1_s <= test_patterns(i).A0_S1;

      wait until rising_edge(clk_s);
      wait for 1 ns;  

      if i > test_patterns'low then
        assert (sum_s = prev_vec.expect_s)
          report "SUM ERROR (reg): expected="
               & to_hstring(prev_vec.expect_s)
               & " got=" & to_hstring(sum_s)
          severity warning;

        assert (cout_s = prev_vec.expect_co)
          report "COUT ERROR (reg): expected="
               & to_string(prev_vec.expect_co)
               & " got=" & to_string(cout_s)
          severity warning;
      end if;

      prev_vec := test_patterns(i);
    end loop;

    wait for 20 ns;
    assert false report "add_sub_8bit_reg_tb done" severity note;
    
    assert false report "Simulation done" severity failure;
  end process;

end architecture;
