library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity regFile_tb is
end entity;

architecture testbench of regFile_tb is

  constant WIDTH : integer := 32;

  component regFile
    generic (
      width : integer := 32
    );
    port (
      rst0       : in  std_logic;
      clk        : in  std_logic;
      wrRegEn    : in  std_logic;
      wrRegNum   : in  std_logic_vector(4 downto 0);
      wdata      : in  std_logic_vector(WIDTH-1 downto 0);
      rdRegNum1  : in  std_logic_vector(4 downto 0);
      rdRegNum2  : in  std_logic_vector(4 downto 0);
      rdata1     : out std_logic_vector(WIDTH-1 downto 0);
      rdata2     : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component;

  signal rst0_s      : std_logic := '1';
  signal clk_s       : std_logic := '0';
  signal wrRegEn_s   : std_logic := '0';
  signal wrRegNum_s  : std_logic_vector(4 downto 0) := (others => '0');
  signal wdata_s     : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
  signal rdRegNum1_s : std_logic_vector(4 downto 0) := (others => '0');
  signal rdRegNum2_s : std_logic_vector(4 downto 0) := (others => '0');
  signal rdata1_s    : std_logic_vector(WIDTH-1 downto 0);
  signal rdata2_s    : std_logic_vector(WIDTH-1 downto 0);

  
  type test_record is record
    reg_num  : integer;
    value    : integer;
  end record;

  type test_array is array (positive range <>) of test_record;

  constant test_patterns : test_array := (
    ( reg_num => 1,  value => 16  ),
    ( reg_num => 2,  value => 32  ),
    ( reg_num => 3,  value => 48  ),
    ( reg_num => 4,  value => 64  ),
    ( reg_num => 5,  value => 80  ),
    ( reg_num => 10, value => 160 ),
    ( reg_num => 15, value => 240 ),
    ( reg_num => 20, value => 320 ),
    ( reg_num => 31, value => 496 )
  );

begin

  
  uut : regFile
    generic map (
      width => WIDTH
    )
    port map (
      rst0       => rst0_s,
      clk        => clk_s,
      wrRegEn    => wrRegEn_s,
      wrRegNum   => wrRegNum_s,
      wdata      => wdata_s,
      rdRegNum1  => rdRegNum1_s,
      rdRegNum2  => rdRegNum2_s,
      rdata1     => rdata1_s,
      rdata2     => rdata2_s
    );

  
  clk_s <= not clk_s after 5 ns;

  
  test : process
    variable vector : test_record;
  begin

    
    rst0_s <= '0';
    wrRegEn_s <= '0';
    wait for 20 ns;
    rst0_s <= '1';
    wait for 10 ns;

    
    for i in test_patterns'range loop

      vector := test_patterns(i);

    
      wrRegEn_s  <= '1';
      wrRegNum_s <= std_logic_vector(to_unsigned(vector.reg_num, 5));
      wdata_s    <= std_logic_vector(to_unsigned(vector.value, WIDTH));

      wait until rising_edge(clk_s);

      wrRegEn_s <= '0';
      wait for 2 ns;

      
      rdRegNum1_s <= std_logic_vector(to_unsigned(vector.reg_num, 5));
      rdRegNum2_s <= std_logic_vector(to_unsigned(vector.reg_num, 5));
      wait for 2 ns;

      assert (rdata1_s = std_logic_vector(to_unsigned(vector.value, WIDTH)))
        report "ERROR"
             & integer'image(vector.reg_num)
             & " expected "
             & integer'image(vector.value)
        severity warning;

      assert (rdata2_s = std_logic_vector(to_unsigned(vector.value, WIDTH)))
        report "ERROR"
             & integer'image(vector.reg_num)
             & " expected "
             & integer'image(vector.value)
        severity warning;

      wait for 5 ns;

    end loop;

    
    rdRegNum1_s <= "00000";
    rdRegNum2_s <= "00000";
    wait for 5 ns;

    assert (rdata1_s = std_logic_vector(to_unsigned(0, WIDTH)))

      report "ERROR"
      severity warning;

    assert (rdata2_s = std_logic_vector(to_unsigned(0, WIDTH)))

      report "ERROR"
      severity warning;

    
    assert false
      report "tb_regFile Test Completed"
      severity note;

    wait;
  end process;

end architecture testbench;
