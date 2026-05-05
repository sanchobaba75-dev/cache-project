library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.riscv_pkg.all;

entity alu is
  port (
    a        : in  std_logic_vector(31 downto 0);
    b        : in  std_logic_vector(31 downto 0);
    alu_func : in  alu_func_type;
    result   : out std_logic_vector(31 downto 0)
  );
end entity alu;
architecture rtl of alu is
begin

  process(a, b, alu_func)
  begin

    case alu_func is

      
      when ALU_ADD =>
        result <= std_logic_vector(signed(a) + signed(b));

      
      when ALU_SUB =>
        result <= std_logic_vector(signed(a) - signed(b));

      
      when ALU_AND =>
        result <= a and b;

      
      when ALU_OR =>
        result <= a or b;

      
      when ALU_XOR =>
        result <= a xor b;

      
      when ALU_SLT =>
        if signed(a) < signed(b) then
          result <= (31 downto 1 => '0') & '1';
        else
          result <= (others => '0');
        end if;

      
      when ALU_SLTU =>
        if unsigned(a) < unsigned(b) then
          result <= (31 downto 1 => '0') & '1';
        else
          result <= (others => '0');
        end if;

      
      when others =>
        result <= (others => '0');

    end case;

  end process;

end architecture rtl;
