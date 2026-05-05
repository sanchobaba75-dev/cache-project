library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

package VLSI_TestBench_pkg is

  signal initialize_memory    : std_logic := '0';

  type test_info is record
    main_test_name            : string(1 to 256);
    main_test_size            : integer;
    test_name                 : string(1 to 256);
    test_size                 : integer;
    lcnt                      : integer;
    mismatches_found          : integer;
    error_detected            : boolean;
    do_comparisons            : boolean;
  end record test_info;

  shared variable testInfo    : test_info;

  component clk_gen
    generic (
      clk_period              : time := 50 ns;
      clk_offset              : time := 25 ns;
      clk_init_val            : std_logic := '0'
    );
    port (
      clk                     : out std_Logic
    );
  end component clk_gen;

  component check_bit
    generic (
      clk_offset              : time := 3 ns;
      sig_label               : string
    );
    port (
      clk                     :  in std_logic;
      expected_sig            :  in std_logic;
      actual_sig              :  in std_logic
    );
  end component check_bit;

  component check_bus
    generic (
      clk_offset              : time := 3 ns;
      width                   : integer;
      sig_label               : string
    );
    port (
      clk                     :  in std_logic;
      expected_sig            :  in std_logic_vector(width-1 downto 0);
      actual_sig              :  in std_logic_vector(width-1 downto 0)
    );
  end component check_bus;

  component drive_bit
    generic (
      clk_offset              : time := 3 ns
    );
    port (
      clk                     :  in std_logic;
      value_sig               :  in std_logic;
      actual_sig              : out std_logic
    );
  end component drive_bit;

  component drive_bus
    generic (
      clk_offset              : time := 3 ns;
      width                   : integer
    );
    port (
      clk                     :  in std_logic;
      value_sig               :  in std_logic_vector(width-1 downto 0);
      actual_sig              : out std_logic_vector(width-1 downto 0)
    );
  end component drive_bus;

  type radix is (binary, octal, decimal, hex);

  function to_string (inp: std_logic_vector) return string;
  function to_string (inp: signed) return string;
  function to_string (inp: unsigned) return string;
  function to_string (inp: std_logic) return string;

  function atoi (inp: string) return integer;
  function atos (inp: string) return std_logic;
  function atot (inp: string) return time;
  function ctoh (c: character) return std_logic_vector;

  function subvector(s: std_logic_vector; size: integer) return std_logic_vector;
  function hex_to_std(s: character; size: integer) return std_logic_vector;
  function hex_to_std(s: string; size: integer) return std_logic_vector;

  function cvt_bit  (s: character) return std_logic;
  function cvt_bits (s: string)    return std_logic_vector;
  function cvt_char (s: string)    return std_logic;

  function dash_present (s: string; size: integer)           return boolean;
  function dash_present (s: std_logic_vector; size: integer) return boolean;

  procedure write_string(
    l: INOUT line;
    value: IN string;
    justified: IN side := right;
    field: IN width := 0);
 
  procedure get_word(
    l: inout line;
    value: out string;
    size: out integer
  );

  procedure write(
    l: inout line;
    value: in bit_vector;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false);
 
  procedure write(
    l: inout line;
    value: in integer;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false);

  procedure write(
    l: inout line;
    value: in std_logic
  );

  procedure write(
    l: inout line;
    value: in std_logic;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false);
 
  procedure write(
    l: inout line;
    value: in std_logic_vector;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false
  );
 


end package VLSI_TestBench_pkg;

package body VLSI_TestBench_pkg is
--		--
--		-- convert a std_logic value to a character
--		--
  type stdlogic_to_char_t is array(std_logic) of character;
  constant to_char : stdlogic_to_char_t := (
    'U' => 'U',
    'X' => 'X',
    '0' => '0',
    '1' => '1',
    'Z' => 'Z',
    'W' => 'W',
    'L' => 'L',
    'H' => 'H',
    '-' => '-');
 
  type array_of_widths is array(radix) of natural;

  constant nibble_widths : array_of_widths := (
    binary => 1,
    octal  => 3,
    hex    => 4,
    decimal=> 32);

  constant hex_digit   : string(1 to 16) := "0123456789ABCDEF";
  constant hex_digit_l : string(1 to 16) := "0123456789abcdef";

  function to_int(bv : bit_vector) return integer is
    variable result: integer := 0;
  begin
    for i in bv'range loop
      result := result * 2;
      if (bv(i) = '1') then
        result := result + 1;
      end if;
    end loop;
    return result;
  end;

  function char_to_int(c: character; hex: boolean) return integer is
    variable limit: integer;
    variable i:     integer;
    variable l:     line;
  begin
    if(hex = true) then
      limit := 16;
    else
      limit := 10;
    end if;
    i := 1;
    while(i <= limit) loop
      if((c = hex_digit(i)) or (c = hex_digit_l(i))) then
        return i - 1;
      end if;
       i := i + 1;
    end loop;
  end;

--		--
--		-- convert a std_logic_vector to a string
--		--
  function to_string(inp : std_logic_vector) return string is
    alias vec : std_logic_vector(1 to inp'length) is inp;
    variable result : string(vec'range);
  begin
    for i in vec'range loop
      result(i) := to_char(vec(i));
    end loop;
    return result;
  end to_string;

  function to_string(inp : signed) return string is
    alias vec : signed(1 to inp'length) is inp;
    variable result : string(vec'range);
  begin
    for i in vec'range loop
      result(i) := to_char(vec(i));
    end loop;
    return result;
  end to_string;

  function to_string(inp : unsigned) return string is
    alias vec : unsigned(1 to inp'length) is inp;
    variable result : string(vec'range);
  begin
    for i in vec'range loop
      result(i) := to_char(vec(i));
    end loop;
    return result;
  end to_string;

	--
	-- convert a std_logic to a string
	--
  function to_string(inp : std_logic) return string is
    variable result : string(1 to 1);
  begin
    result(1) := to_char(inp);
    return result;
  end to_string;

  function atoi(inp: string) return integer is
    variable result: integer;
    variable i:      integer;
    variable hex:    boolean;
  begin
    result  := 0;
    if((inp'length > 2) and (inp(1) = '0') and (inp(2) = 'x')) then
      i     := 3;
      hex   := true;
    else
      i     := 1;
      hex   := false;
    end if;
    while(i <= inp'length) loop
      if(hex = true) then
        result := result * 16 + char_to_int(inp(i),hex);
      else
        result := result * 10 + char_to_int(inp(i),hex);
      end if;
      i     := i + 1;
    end loop;
    return result;
  end atoi;

  function atos(inp: string) return std_logic is
    variable result: std_logic;
    variable i:      integer;
  begin
    if(inp = "0") then
      return '0';
    elsif(inp = "1") then
      return '1';
    else
      return '-';
    end if;
  end atos;

  function atot(inp: string) return time is
    variable result: integer;
    variable i:      integer;
  begin
    result   := 0;
    i        := 1;
    while(i <= inp'length) loop
      result := result * 10 + char_to_int(inp(i),false);
      i      := i + 1;
    end loop;
    return result * 1 ns;
  end atot;

  function ctoh(c: character) return std_logic_vector is
  begin
    case c is
      when '0'       => return("0000");
      when '1'       => return("0001");
      when '2'       => return("0010");
      when '3'       => return("0011");
      when '4'       => return("0100");
      when '5'       => return("0101");
      when '6'       => return("0110");
      when '7'       => return("0111");
      when '8'       => return("1000");
      when '9'       => return("1001");
      when 'a' | 'A' => return("1010");
      when 'b' | 'B' => return("1011");
      when 'c' | 'C' => return("1100");
      when 'd' | 'D' => return("1101");
      when 'e' | 'E' => return("1110");
      when 'f' | 'F' => return("1111");
      when others    => return("----");
    end case;
    return "0000";
  end ctoh;

  function subvector(s: std_logic_vector; size: integer)
                                          return std_logic_vector is

    alias ss: std_logic_vector(s'length-1 downto 0) is s;
    variable res: std_logic_vector(size-1 downto 0);
  begin
    case size is
      when 1      => res := ss(0 downto 0);
      when 2      => res := ss(1 downto 0);
      when 3      => res := ss(2 downto 0);
      when others => res := ss(3 downto 0);
    end case;
   return res;
  end function subvector;

  function hex_to_std(s: character; size: integer) return std_logic_vector is
    variable s2: string(1 to 2);
  begin
    s2(1) := s;
    s2(2) := ' ';
    return hex_to_std(s2,size);
  end function hex_to_std;

  function hex_to_std(s: string; size: integer) return std_logic_vector is
    variable res: std_logic_vector(size-1 downto 0);
    variable i, j, n, leading: integer;
  begin
    j := 1;
    n := size - 1;
                           -- See how many bits are needed to get on a 4-bit
                           -- boundary...
    leading := size mod 4;

    if(leading /= 0) then
      res(n downto (size - leading)) := subvector(ctoh(s(1)),leading);
      n := n - leading;
      j := j + 1;
    end if;
                           -- Now handle all the full nibbles...
    while n > 0 loop
      res(n downto n-3) := ctoh(s(j));
      n := n - 4;
      j := j + 1;
    end loop;
    return res;
  end function hex_to_std;

  function cvt_bit (s: character) return std_logic is
  begin
    if(s = '1') then
      return '1';
    elsif(s = '0') then
      return '0';
    else
      return '-';
    end if;
  end cvt_bit;

  function cvt_bits (s: string) return std_logic_vector is
    variable size: integer := s'length - 1;
    variable res:  std_logic_vector(size downto 0);
    variable i:    integer;
  begin
    i  := s'left;
    while(size >= 0) loop
      res(size) := cvt_bit(s(i));
      size      := size - 1;
      i         := i + 1;
    end loop;
    return res;
  end cvt_bits;

  function cvt_char (s: string) return std_logic is
  begin
    if(s(1) = '1') then
      return '1';
    elsif(s(1) = '0') then
      return '0';
    else
      return '-';
    end if;
  end cvt_char;

  function dash_present (s: string; size: integer) return boolean is
    variable i: integer;
  begin
    i := 1;
    while(i <= size) loop
      if(s(i) = '-') then
        return true;
      end if;
      i := i + 1;
    end loop;
    return false;
  end dash_present;

  function dash_present (s: std_logic_vector; size: integer) return boolean is
    variable i: integer;
  begin
    i := 0;
    while(i < size) loop
      if(s(i) = '-') then
        return true;
      end if;
      i := i + 1;
    end loop;
    return false;
  end dash_present;


  procedure shrink_line(
    l: inout line;
    pos: integer) is

    variable tmpl: line;
  begin
    tmpl := l;
    l := new string'(tmpl(pos to tmpl'high));
    deallocate(tmpl);
  end;
 
		-- skip leading white space in the line
  procedure skip_white(
    variable l: in line;
    pos: out integer) is
  begin
    pos := l'low;
    for i in l'low to l'high loop
      case l(i) is
        when ' ' | ht  =>
          pos := i + 1;
        when others =>
          exit;
      end case;
    end loop;
  end;


  procedure get_word(L:inout LINE; VALUE: out string; size: out integer) is
    alias    val  : string(1 to VALUE'length) is VALUE;
    variable st: string(1 to 80);
    variable pos : integer;
    variable vpos : integer := 0;   -- Index of last valid character in val.
    variable lpos : integer;        -- Index of next unused char in L.

  begin
    if(L /= NULL) then
      lpos := L'left;
      skip_white(L, lpos);
      while(     (lpos <= L'right)
             and (vpos < 80) ) loop
        vpos := vpos + 1;
        value(vpos) := L(lpos);
        lpos := lpos + 1;
        if((lpos > L'right) or (L(lpos) = ' ')) then
          exit;
        end if;
      end loop;
    end if;
 
    shrink_line(L, lpos);

    size := vpos;
  end;
 
  procedure write_string(
    l:        inout line;
    value:       in string;
    justified:   in side := right;
    field:       in width := 0) is
  begin
    write(l, value, justified, field);
  end;
 
  procedure write(
    l: inout line;
    value: in integer;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false) is

    function to_bv(int : integer) return bit_vector is
      variable bv: bit_vector(32 downto 1) := (others => '0');
      variable pos: integer := 0;
      variable tmpval: integer := int;
    begin
      for i in 1 to 32 loop
        pos := pos + 1;
        if((tmpval mod 2) = 1) then
          bv(i) := '1';
        end if;
        tmpval := tmpval / 2;
        exit when tmpval = 0;
      end loop;
      return bv(pos downto 1);
    end;

    variable tmp: line;
  begin
    if(base = decimal) then
      if(use_pound) then
        write_string(tmp, "10#");
      end if;
      write(tmp, value);
      if(use_pound) then
        write_string(tmp, "#");
      end if;
      write(l, tmp.ALL, justified, field);
      deallocate(tmp);
    else
      write(l, to_bv(value), justified, field, base, use_pound);
    end if;
  end;

  procedure write(
    l: inout line;
    value: in bit_vector;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false) is

    alias input_val: bit_vector(value'length downto 1) is value;
    constant nibble_width : natural := nibble_widths(base);
    constant result_width : natural := 
                              (value'length + nibble_width - 1)/nibble_width;
 
    variable result: string(1 to result_width);  -- longest possible value
    variable result_pos: positive := 1;
    variable nibble_val: integer;
    variable bitcnt: integer;

  begin
    if(base = decimal) then
      write(l, to_int(value), justified, field, base, use_pound);
      return;
    end if;
 
    bitcnt := value'length mod nibble_width;
    if(bitcnt = 0) then
      bitcnt := nibble_width;
    end if;
    for i in input_val'range loop
      nibble_val := nibble_val * 2;
      if(input_val(i) = '1') then
        nibble_val := nibble_val + 1;
      end if;
      bitcnt := bitcnt - 1;
      if(bitcnt = 0) then
        result(result_pos) := hex_digit(nibble_val + 1);
        result_pos := result_pos + 1;
        nibble_val := 0;
        bitcnt := nibble_width;
      end if;
    end loop;
    write(l, result, justified, field);
  end;

  procedure write(
    l:     inout line;
    value:    in std_logic) is

    variable result : string(1 to 2);
  begin
    if(value = '0') then
      result(1) := '0';
    elsif(value = '1') then
      result(1) := '1';
    else
      result(1) := '-';
    end if;
    write(l, result);
  end;
 
  procedure write(
    l: inout line;
    value: in std_logic;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false) is

    variable val: integer;

  begin
    if (value = '1') then
      val := 1;
    else 
      val := 0;
    end if;
    write(l, val, justified, field);
  end;

  procedure write(
    l: inout line;
    value: in std_logic_vector;
    justified: in side := right;
    field: in width := 0;
    base: in radix;
    use_pound: boolean := false) is

    alias input_val : std_logic_vector(value'length downto 1) is value;
    constant nibble_width : natural := nibble_widths(base);
    constant result_width : natural := 
                            (value'length + nibble_width - 1)/nibble_width;

    variable result : string(1 to result_width);  -- longest possible value
    variable result_pos : positive := 1;
    variable nibble_val : integer;
    variable bitcnt : integer;

  begin
    if(base = decimal) then
      write(l, to_integer(signed(value)), justified, field, base, use_pound);
      return;
    end if;

    bitcnt := value'length mod nibble_width;
    if(bitcnt = 0) then
      bitcnt := nibble_width;
    end if;
    for i in input_val'range loop
      nibble_val := nibble_val * 2;
      if (input_val(i) = '1') then
        nibble_val := nibble_val + 1;
      end if;
      bitcnt := bitcnt - 1;
      if(bitcnt = 0) then
        result(result_pos) := hex_digit(nibble_val + 1);
        result_pos := result_pos + 1;
        nibble_val := 0;
        bitcnt := nibble_width;
      end if;
    end loop;
    write(l, result, justified, field);
  end;

end package body VLSI_TestBench_pkg;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity drive_bit is
  generic (
    clk_offset          :  time := 3 ns
  );
  port (
    clk                 :  in std_logic;
    value_sig           :  in std_logic;
    actual_sig          : out std_logic
  );
end entity drive_bit;

architecture test of drive_bit is
begin

  drive_bit: process(clk)
  begin
    if(rising_edge(clk)) then
      actual_sig        <= value_sig after clk_offset;
    end if;
  end process drive_bit;

end architecture test;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity drive_bus is
  generic (
    clk_offset          : time := 3 ns;
    width               : integer
  );
  port (
    clk                 :  in std_logic;
    value_sig           :  in std_logic_vector(width-1 downto 0);
    actual_sig          : out std_logic_vector(width-1 downto 0)
  );
end entity drive_bus;

architecture test of drive_bus is
begin

  drive_bus: process(clk)
  begin
    if(rising_edge(clk)) then
      actual_sig        <= value_sig after clk_offset;
    end if;
  end process drive_bus;

end architecture test;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

--library vlsi_concepts_lib;
--use vlsi_concepts_lib.VLSI_TestBench_pkg.all;
use work.VLSI_TestBench_pkg.all;


entity check_bit is
  generic (
    clk_offset          :  time := 3 ns;
    sig_label           :  string
  );
  port (
    clk                 :  in std_logic;
    expected_sig        :  in std_logic;
    actual_sig          :  in std_logic
  );
end entity check_bit;

architecture test of check_bit is
begin

  check_bit: process
    variable line_out: line;
  begin
    wait until rising_edge(clk);
    wait for clk_offset;
    if((testInfo.do_comparisons = true) and (expected_sig /= '-')) then
      if(actual_sig /= expected_sig) then
        write_string(line_out, "Main test: ");
        write_string(line_out, 
                      testInfo.main_test_name(1 to testInfo.main_test_size));
        write_string(line_out, " Test: ");
        write_string(line_out, 
                      testInfo.test_name(1 to testInfo.test_size));
        write_string(line_out, " Line: ");
        write(line_out,testInfo.lcnt);
        write_string(line_out, " Time: ");
        write(line_out,NOW);
        write_string(line_out, " Mismatch: ");
        write_string(line_out, sig_label);
        write_string(line_out, " Exp: ");
        write(line_out, expected_sig, base => hex,
                                      field => 1);
        write_string(line_out, " Got: ");
        write(line_out, actual_sig, base => hex,
                                      field => 1);
        writeline(output,line_out);
        testInfo.error_detected := true;
        testInfo.mismatches_found := testInfo.mismatches_found + 1;
      end if;
    end if;
  end process check_bit;

end architecture test;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

--library vlsi_concepts_lib;
--use vlsi_concepts_lib.VLSI_TestBench_pkg.all;
use work.VLSI_TestBench_pkg.all;

entity check_bus is
  generic (
    clk_offset          : time := 3 ns;
    width               : integer;
    sig_label           : string
  );
  port (
    clk                 :  in std_logic;
    expected_sig        :  in std_logic_vector(width-1 downto 0);
    actual_sig          :  in std_logic_vector(width-1 downto 0)
  );
end entity check_bus;

architecture test of check_bus is
begin

  check_bus: process
    variable line_out: line;
  begin
    wait until rising_edge(clk);
    wait for clk_offset;
    if((testInfo.do_comparisons = true) and (dash_present(expected_sig,width) = false)) then
      if(actual_sig /= expected_sig) then
        write_string(line_out, "Main test: ");
        write_string(line_out,
                      testInfo.main_test_name(1 to testInfo.main_test_size));
        write_string(line_out, " Test: ");
        write_string(line_out,
                      testInfo.test_name(1 to testInfo.test_size));
        write_string(line_out, " Line: ");
        write(line_out,testInfo.lcnt);
        write_string(line_out, " Time: ");
        write(line_out,NOW);
        write_string(line_out, " Mismatch: ");
        write_string(line_out, sig_label);
        write_string(line_out, " Exp: ");
        write(line_out, expected_sig, base => hex,
                                      field => ((width-1)/4+1));
        write_string(line_out, " Got: ");
        write(line_out, actual_sig, base => hex,
                                      field => ((width-1)/4+1));
        writeline(output,line_out);
        testInfo.error_detected := true;
        testInfo.mismatches_found := testInfo.mismatches_found + 1;
      end if;
    end if;
  end process check_bus;

end architecture test;

--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity clk_gen is
  generic (
    clk_period      : time := 50 ns;
    clk_offset      : time := 25 ns;
    clk_init_val    : std_logic := '0'
  );
  port (
    clk             : out std_Logic
  );
end entity clk_gen;


architecture test of clk_gen is
  signal clk_s      : std_logic;
begin

  clk_gen_proc: process
  begin
    if(clk_s = 'U') then
      clk_s      <= clk_init_val;
      clk        <= clk_init_val;

      wait for clk_offset;

      wait for (clk_period / 2);
    else
      clk_s      <= not clk_s;
      clk        <= not clk_s;
      wait for (clk_period / 2);
    end if;
  end process clk_gen_proc;
end architecture test;

