library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.riscv_pkg.all;

entity immediate_generator is
  port (
    instr  : in  std_logic_vector(31 downto 0);
    ifmt   : in  fmt_type;
    imm_out : out std_logic_vector(31 downto 0)
  );
end entity;

architecture rtl of immediate_generator is
begin
  process(instr, ifmt)
    variable imm : signed(31 downto 0);
  begin
    imm := (others => '0');

    case ifmt is

      when I_TYPE =>
        
        imm(11 downto 0) := signed(instr(31 downto 20));
        imm := resize(imm(11 downto 0), 32);

      when S_TYPE =>
        
        imm(11 downto 5) := signed(instr(31 downto 25));
        imm(4 downto 0)  := signed(instr(11 downto 7));
        imm := resize(imm(11 downto 0), 32);

      when SB_TYPE =>
        
        imm(12) := instr(31);
        imm(11) := instr(7);
        imm(10 downto 5) := signed(instr(30 downto 25));
        imm(4 downto 1)  := signed(instr(11 downto 8));
        imm(0) := '0';
        imm := resize(imm(12 downto 0), 32);

      when U_TYPE =>
        
        imm(31 downto 12) := signed(instr(31 downto 12));
        imm(11 downto 0)  := (others => '0');

      when UJ_TYPE =>
        
        imm(20) := instr(31);
        imm(19 downto 12) := signed(instr(19 downto 12));
        imm(11) := instr(20);
        imm(10 downto 1) := signed(instr(30 downto 21));
        imm(0) := '0';
        imm := resize(imm(20 downto 0), 32);

      when others =>
        imm := (others => '0');

    end case;

    imm_out <= std_logic_vector(imm);
  end process;
end architecture;
