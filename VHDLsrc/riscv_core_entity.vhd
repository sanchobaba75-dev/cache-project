library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.riscv_pkg.all;

entity riscv_core is
  port (
    rst0               : in  std_logic;
    clk                : in  std_logic;

  
    imem_cs            : out std_logic;
    imem_wr_en         : out std_logic_vector(3 downto 0);
    imem_addr          : out std_logic_vector(31 downto 0);
    imem_wdata         : out std_logic_vector(31 downto 0);
    imem_rdata         : in  std_logic_vector(31 downto 0);

    
    dmem_cs            : out std_logic;
    dmem_wr_en         : out std_logic_vector(3 downto 0);
    dmem_addr          : out std_logic_vector(31 downto 0);
    dmem_wdata         : out std_logic_vector(31 downto 0);
    dmem_rdata         : in  std_logic_vector(31 downto 0)
  );
end entity riscv_core;