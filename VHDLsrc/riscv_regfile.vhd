library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity regFile is
    generic (
        width : integer := 32
    );
    port (
        rst0       : in  std_logic;
        clk        : in  std_logic;
        wrRegEn    : in  std_logic;
        wrRegNum   : in  std_logic_vector(4 downto 0);
        wdata      : in  std_logic_vector(width-1 downto 0);
        rdRegNum1  : in  std_logic_vector(4 downto 0);
        rdRegNum2  : in  std_logic_vector(4 downto 0);
        rdata1     : out std_logic_vector(width-1 downto 0);
        rdata2     : out std_logic_vector(width-1 downto 0)
    );
end entity regFile;

architecture rtl of regFile is
    type regArray is array (1 to 31) of std_logic_vector(width-1 downto 0);
    signal regs_r : regArray;
begin

    
    regWrite : process(rst0, clk)
        variable wrRegNum_v : integer;
    begin
        wrRegNum_v := to_integer(unsigned(wrRegNum));

        if (rst0 = '0') then
            regs_r <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if (wrRegEn = '1') and (wrRegNum_v /= 0) then
                regs_r(wrRegNum_v) <= wdata;
            end if;
        end if;
    end process regWrite;


    read1 : process(rdRegNum1, regs_r)
        variable rdRegNum_v : integer;
    begin
        if rdRegNum1 = "00000" or is_x(rdRegNum1) then
            rdata1 <= (others => '0');
        else
            rdRegNum_v := to_integer(unsigned(rdRegNum1));
            if rdRegNum_v >= 1 and rdRegNum_v <= 31 then
                rdata1 <= regs_r(rdRegNum_v);
            else
                rdata1 <= (others => '0');
            end if;
        end if;
    end process;


    
    process(rdRegNum2, regs_r)
    variable idx : integer;
begin
    if rdRegNum2 = "00000" or is_x(rdRegNum2) then
        rdata2 <= (others => '0');
    else
        idx := to_integer(unsigned(rdRegNum2));
        if idx >= 1 and idx <= 31 then
            rdata2 <= regs_r(idx);
        else
            rdata2 <= (others => '0');
        end if;
    end if;
end process;

end architecture rtl;
