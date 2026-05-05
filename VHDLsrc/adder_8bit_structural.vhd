library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


architecture structural of adder_8bit is

  
  signal c : std_logic_vector(8 downto 0);

  
  component full_adder
    port (
      a  : in  std_logic;
      b  : in  std_logic;
      ci : in  std_logic;
      s  : out std_logic;
      co : out std_logic
    );
  end component;

begin

  
  c(0) <= cin;

  -- bit 0
  FA0: full_adder
    port map (
      a  => a(0),
      b  => b(0),
      ci => c(0),
      s  => sum(0),
      co => c(1)
    );

  -- bit 1
  FA1: full_adder
    port map (
      a  => a(1),
      b  => b(1),
      ci => c(1),
      s  => sum(1),
      co => c(2)
    );

  -- bit 2
  FA2: full_adder
    port map (
      a  => a(2),
      b  => b(2),
      ci => c(2),
      s  => sum(2),
      co => c(3)
    );

  -- bit 3
  FA3: full_adder
    port map (
      a  => a(3),
      b  => b(3),
      ci => c(3),
      s  => sum(3),
      co => c(4)
    );

  -- bit 4
  FA4: full_adder
    port map (
      a  => a(4),
      b  => b(4),
      ci => c(4),
      s  => sum(4),
      co => c(5)
    );

  -- bit 5
  FA5: full_adder
    port map (
      a  => a(5),
      b  => b(5),
      ci => c(5),
      s  => sum(5),
      co => c(6)
    );

  -- bit 6
  FA6: full_adder
    port map (
      a  => a(6),
      b  => b(6),
      ci => c(6),
      s  => sum(6),
      co => c(7)
    );

  -- bit 7 
  FA7: full_adder
    port map (
      a  => a(7),
      b  => b(7),
      ci => c(7),
      s  => sum(7),
      co => c(8)
    );

  
  cout <= c(8);

end architecture structural;
