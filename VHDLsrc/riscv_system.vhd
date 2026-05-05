library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.VLSI_TestBench_pkg.all;


entity riscv_system is
  port (
    rst0             :  in std_logic;
    clk              :  in std_logic
  );
end riscv_system;

architecture rtl of riscv_system is
  component riscv_core
    port (
      rst0               :  in std_logic;
      clk                :  in std_logic;

      -- Instruction memory interface
      imem_cs            : out std_logic;
      imem_wr_en         : out std_logic_vector(3 downto 0);
      imem_addr          : out std_logic_vector(31 downto 0);
      imem_wdata         : out std_logic_vector(31 downto 0);
      imem_rdata         :  in std_logic_vector(31 downto 0);

      -- Data memory interface
      dmem_cs            : out std_logic;
      dmem_wr_en         : out std_logic_vector(3 downto 0);
      dmem_addr          : out std_logic_vector(31 downto 0);
      dmem_wdata         : out std_logic_vector(31 downto 0);
      dmem_rdata         :  in std_logic_vector(31 downto 0)
    );
  end component;

  component sync_sp_sram
    generic (
      ENDIAN                : integer := 1;      -- 0: Big; 1: Little
      WIDTH                 : integer := 32;     -- Number of data bits
      BITS_PER_WE           : integer := 8;      -- Number of data bits per wr_en
      WORDS                 : integer := 512;    -- Number of locations
      BASE_OFFSET           : integer := 0;      -- Offset from initialization address
      ADDR_BITS             : integer := 9;      -- Number of bits in the address bus
      DEFAULT_STATE         : std_logic := '0';  -- State to initialize bits
      SIM_INIT_FILE         : string  := "initfile.srec";
      INIT_FILE_INDIRECT    : integer := 0;
      RD_ACCESS             : time    := 4 ns    -- Read access delay time
    );
    port (
      clk                   :  in std_logic;
      cs                    :  in std_logic;
      wr_en                 :  in std_logic_vector(
                                      (WIDTH/BITS_PER_WE)-1 downto 0);
      addr                  :  in std_logic_vector(ADDR_BITS-1 downto 0);
      wdata                 :  in std_logic_vector(WIDTH-1 downto 0);
      rdata                 : out std_logic_vector(WIDTH-1 downto 0)
    );
  end component;

  signal clk_s              :  std_logic;
  signal rst0_s             :  std_logic;

  signal imem_cs_s          : std_logic;
  signal imem_wr_en_s       : std_logic_vector(3 downto 0);
  signal imem_addr_s        : std_logic_vector(8 downto 0);
  signal imem_wdata_s       : std_logic_vector(31 downto 0);
  signal imem_rdata_s       : std_logic_vector(31 downto 0);

  signal dmem_cs_s          : std_logic;
  signal dmem_wr_en_s       : std_logic_vector(3 downto 0);
  signal dmem_addr_s        : std_logic_vector(8 downto 0);
  signal dmem_wdata_s       : std_logic_vector(31 downto 0);
  signal dmem_rdata_s       : std_logic_vector(31 downto 0);

  signal imem_full_addr_s   : std_logic_vector(31 downto 0);
  signal dmem_full_addr_s   : std_logic_vector(31 downto 0);

begin

  imem_addr_s               <= imem_full_addr_s(10 downto 2);
  dmem_addr_s               <= dmem_full_addr_s(10 downto 2);

  core: riscv_core
    port map (
      rst0          => rst0,
      clk           => clk,

      -- Instruction memory interface
      imem_cs       => imem_cs_s,
      imem_wr_en    => imem_wr_en_s,
      imem_addr     => imem_full_addr_s,
      imem_wdata    => imem_wdata_s,
      imem_rdata    => imem_rdata_s,

      -- Data memory interface
      dmem_cs       => dmem_cs_s,
      dmem_wr_en    => dmem_wr_en_s,
      dmem_addr     => dmem_full_addr_s,
      dmem_wdata    => dmem_wdata_s,
      dmem_rdata    => dmem_rdata_s
    );

  imem: sync_sp_sram
    generic map (
      BASE_OFFSET           =>  16#80000000#,     -- Offset from initialization address
      SIM_INIT_FILE         => "Sort_imem.srec"
    )
    port map (
      clk                   => clk,
      cs                    => imem_cs_s,
      wr_en                 => imem_wr_en_s,
      addr                  => imem_addr_s,
      wdata                 => imem_wdata_s,
      rdata                 => imem_rdata_s
    );

  dmem: sync_sp_sram
    generic map (
      BASE_OFFSET           => 16#80003000#,      -- Offset from initialization address
      SIM_INIT_FILE         => "Sort_dmem.srec"
    )
    port map (
      clk                   => clk,
      cs                    => dmem_cs_s,
      wr_en                 => dmem_wr_en_s,
      addr                  => dmem_addr_s,
      wdata                 => dmem_wdata_s,
      rdata                 => dmem_rdata_s
    );

end architecture rtl;
