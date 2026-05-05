library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VLSI_TestBench_pkg.all;

entity dram_cntl_tb is
end dram_cntl_tb;

architecture testbench of dram_cntl_tb is
  component dram_cntl
    port (
      clk:       in std_logic;
      rst0:      in std_logic;

      addr:      in std_logic_vector(19 downto 0);

      start:     in std_logic;
      acc_type:  in std_logic_vector(1 downto 0);

      size:      in std_logic_vector(1 downto 0);

      r1w0:      in std_logic;

      ras_0:    out std_logic;
      cas_0:    out std_logic_vector(3 downto 0);
      we_0:     out std_logic;

      mux_addr: out std_logic_vector(8 downto 0)
    );
  end component;

  for g1: dram_cntl use entity work.dram_cntl(rtl);
  --for g1: dram_cntl use entity work.dram_cntl(gate);

  signal clk_s:      std_logic;
  signal rst_s:      std_logic;
  signal rst0_s:     std_logic;
  signal addr_s:     std_logic_vector(19 downto 0);

  signal start_s:    std_logic;
  signal acc_type_s: std_logic_vector(1 downto 0);
  signal size_s:     std_logic_vector(1 downto 0);

  signal r1w0_s:     std_logic;

  signal ras_0_s:    std_logic;
  signal cas_0_s:    std_logic_vector(3 downto 0);
  signal we_0_s:     std_logic;

  signal mux_addr_s: std_logic_vector(8 downto 0);

  type test_record is record
    a:            std_logic_vector(19 downto 0);

    st:           std_logic;
    ty:           std_logic_vector(1 downto 0);
    sz:           std_logic_vector(1 downto 0);

    rw:           std_logic;

    x_r_0:        std_logic;
    x_c_0:        std_logic_vector(3 downto 0);
    x_w_0:        std_logic;
                                                -- 3 full hex characters
    x_m:          std_logic_vector(11 downto 0);
  end record;

type test_array is array(positive range <>) of test_record;

constant test_patterns: test_array := (
                                     -- Reset and wait for start
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
                                     -- Start a single access write
  ( a => X"20c84", st => '1', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '0', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '0', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '0',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
                                     -- Start a single access read
  ( a => X"20c84", st => '1', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
                                     -- Start a page access read
  ( a => X"20c84", st => '1', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"122" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"122" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"123" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"123" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"120" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"120" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "01", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
                                     -- Start a refresh access
  ( a => X"00000", st => '1', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"0", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"0", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "10", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
  ( a => X"00000", st => '0', ty => "00", sz => "00", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"000" ),
                                     -- Start a single half-word access read
  ( a => X"20c84", st => '1', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"3", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c84", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
                                     -- Start a single half-word access read
  ( a => X"20c86", st => '1', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"c", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c86", st => '0', ty => "00", sz => "01", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
                                     -- Start a single byte access read
  ( a => X"20c85", st => '1', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '0', x_c_0 => X"b", x_w_0 => '1', x_m => X"121" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '0', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" ),
  ( a => X"20c85", st => '0', ty => "00", sz => "10", rw => '1',
                 x_r_0 => '1', x_c_0 => X"f", x_w_0 => '1', x_m => X"041" )
);

begin
  g1: dram_cntl
    port map (
      clk      => clk_s,
      rst0     => rst0_s,
      addr     => addr_s,
      start    => start_s,
      acc_type => acc_type_s,
      size     => size_s,
      r1w0     => r1w0_s,

      ras_0    => ras_0_s,
      cas_0    => cas_0_s,
      we_0     => we_0_s,
      mux_addr => mux_addr_s
    );


  clk_gen: process is
    begin
      if(clk_s = 'U') then
        clk_s     <= '0';
        wait for 20 ns;
      else
        clk_s     <= not clk_s;
        wait for 20 ns;
      end if;
    end process clk_gen;

  rst_gen: process is
    begin
      if(rst_s = 'U') then
        rst_s     <= '1';
        rst0_s    <= '0';
        wait for 90 ns;
      else
        rst_s     <= '0';
        rst0_s    <= '1';
        wait;
      end if;
    end process rst_gen;

  test: process
    variable vector:      test_record;
    variable found_error: boolean := false;
  begin
    wait for 40 ns;

    for I in test_patterns'range loop
      vector := test_patterns(i);

      wait for 5 ns;
                            -- Apply the values
      addr_s      <= vector.a;
      start_s     <= vector.st;
      acc_type_s  <= vector.ty;
      size_s      <= vector.sz;
      r1w0_s      <= vector.rw;

                            -- Wait for comb. Delay
      wait for 30 ns;
                            -- Check results
      assert (ras_0_s = vector.x_r_0)
        report "Error found during test:  ras_0 is "
             & to_string(ras_0_s)
             & " expecting: "
             & to_string(vector.x_r_0)
         severity warning;

      assert (cas_0_s = vector.x_c_0)
        report "Error found during test:  cas_0 is "
             & to_string(cas_0_s)
             & " expecting: "
             & to_string(vector.x_c_0)
         severity warning;

      assert (we_0_s = vector.x_w_0)
        report "Error found during test:  we_0 is "
             & to_string(we_0_s)
             & " expecting: "
             & to_string(vector.x_w_0)
         severity warning;

      assert (mux_addr_s = vector.x_m(8 downto 0))
        report "Error found during test:  mux_addr is "
             & to_string(mux_addr_s)
             & " expecting: "
             & to_string(vector.x_m(8 downto 0))
         severity warning;

                             -- Round out to 40 ns 
      wait for 5 ns;
    end loop;

    assert false
      report "Test done"
      severity note;
    wait;
  end process;
end architecture testbench;

