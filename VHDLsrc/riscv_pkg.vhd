library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package riscv_pkg is
  subtype fmt_type is std_logic_vector(2 downto 0);
  constant R_TYPE : fmt_type := "000";
  constant I_TYPE : fmt_type := "001";
  constant S_TYPE : fmt_type := "010";
  constant SB_TYPE : fmt_type := "011";
  constant UJ_TYPE : fmt_type := "100";
  constant U_TYPE : fmt_type := "101";


  type alu_func_type is (
      ALU_ADD,
      ALU_SUB,
      ALU_AND,
      ALU_OR,
      ALU_XOR,
      ALU_SLT,
      ALU_SLTU,
      ALU_SLL,
      ALU_SRL,
      ALU_SRA
  );
end package riscv_pkg;

