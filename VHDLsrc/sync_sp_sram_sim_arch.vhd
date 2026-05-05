--
--
--    Synchronous Single-port SRAM 
--
--     Initialize via S-records
--
--       Dr. Edward L. Hepler
--        VLSI Concepts, Inc.
--     Copyright 2005, 2006, 2011
--
--

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.VLSI_TestBench_pkg.all;

architecture sim of sync_sp_sram is

  constant NUM_WE            : integer := (WIDTH/BITS_PER_WE);
  constant wr_en_zeros       : std_logic_vector(NUM_WE-1 downto 0)
                                                   := (others => '0');

  type ram_array is array(0 to WORDS-1)
                                  of std_logic_vector(WIDTH-1 downto 0);


  signal cs_r                : std_logic;
  signal address_valid_r     : std_logic;

                -- convert a character to a value from 0 to 15
  function digit_value(c: character) return integer is
    constant not_digit:   integer  := -999;
  begin
    if(c >= '0') and (c <= '9') then
      return (character'pos(c) - character'pos('0'));
    elsif (c >= 'a') and (c <= 'f') then
      return (character'pos(c) - character'pos('a') + 10);
    elsif (c >= 'A') and (c <= 'F') then
      return (character'pos(c) - character'pos('A') + 10);
    else
      return not_digit;
    end if;
  end;

  impure function read_init_name(name: string) return string is
    file nameFile: TEXT;
    variable open_status : FILE_OPEN_STATUS;
    variable outline: line;
    variable inline: line;
    variable init_name: string(1 to 256);
    variable str_size: integer;
  begin
    file_open(open_status,nameFile,external_name => name, open_kind => read_mode);
    if(open_status /= OPEN_OK) then
      write_string(outline, "Problme opening indirect initialization file: ");
      write_string(outline, name(1 to name'length));
      writeline(output,outline);
      return "";
    end if;
    readline(nameFile,inline);
    get_word(inline,init_name,str_size);
    return init_name;
  end function read_init_name;

  procedure init_mem(              m: inout ram_array;
                      init_file_name: in string
                    ) is
    file init_data: TEXT;
 
    variable L:            line;
    variable LL:           line;
    variable outline:      line;
    variable bytes_per_wd: integer;
    variable byte_cnt:     integer;
    variable byte_chk:     integer;
    variable byte_num:     integer;
    variable tmp_int:      integer;
    variable hi_bit_num:   integer;
    variable chk_sum:      std_logic_vector(7 downto 0);
    variable hbyte_val:    integer;
    variable mhbyte_val:   integer;
    variable mlbyte_val:   integer;
    variable lbyte_val:    integer;
    variable j:            integer;
    variable memory_addr:  integer;
    variable mem_addr:     integer;
    variable mem_data:     integer;
    variable to_write:     std_logic_vector(WIDTH-1 downto 0);
    variable open_status     : FILE_OPEN_STATUS;
    variable name_of_init_file: string(1 to 256);
 
  begin
    -- Report initialization
    write_string(outline, "Initializing SRAM: ");
    write_string(outline, init_mem'path_name);

    if(init_file_name'length /= 0) then
      if(INIT_FILE_INDIRECT = 0) then
        name_of_init_file(1 to init_file_name'length)   := init_file_name(1 to init_file_name'length);
      else
        name_of_init_file   := read_init_name(init_file_name);
      end if;
      write_string(outline, " from: ");
      write_string(outline, name_of_init_file(1 to name_of_init_file'length));
      write_string(outline, ".");
    else
      write_string(outline, " to all: ");
      write_string(outline, to_string(DEFAULT_STATE));
      write_string(outline, ".");
    end if;
    writeline(output,outline);

    bytes_per_wd           := WIDTH / 8;

                           --
                           -- Initialize all bits to DEFAULT_STATE
                           --
    for i in 0 to (WORDS-1) loop
     m(i)                  := (others => DEFAULT_STATE);
    end loop;

                           --
                           -- Check if there is an initialization file
                           --
    if(name_of_init_file'length /= 0) then
                           --
                           -- Open the initialization file
                           --
      file_open(open_status,init_data,
                            external_name => name_of_init_file,
                            open_kind => read_mode);

      if(open_status /= OPEN_OK) then
        write_string(outline, "Problem opening initialization file: ");
        write_string(outline, name_of_init_file(1 to name_of_init_file'length));
        writeline(output,outline);
      end if;

                           -- Read a set of lines from a file
                           -- which represent S records
      while not endfile (init_data) loop
                           -- Get a line from the sram_initialization file
        readline(init_data,L);
			   -- Get the S record type
        if(L(1) = 'S') then
          case L(2) is
            when '0' =>    --
                           -- Header S0 record is quietly ignored!
                           --
                           --
            when '1' =>	   -- Data S1 record "16-bit" address
                           --
                           -- Extract the byte count
              byte_cnt     := (digit_value(L(3)) * 16) + digit_value(L(4));
                           -- Initialize the check sum
              byte_chk     := byte_cnt;
                           -- Extract the address
              hbyte_val    := (digit_value(L(5)) * 16) + digit_value(L(6));
              lbyte_val    := (digit_value(L(7)) * 16) + digit_value(L(8));
              byte_cnt     := byte_cnt - 2;
              byte_chk     := byte_chk +  hbyte_val;
              byte_chk     := byte_chk +  lbyte_val;
              memory_addr  := hbyte_val * 256 + lbyte_val;
              memory_addr  := memory_addr - BASE_OFFSET;
              j            := 9;
                           -- Get all data bytes
              while(byte_cnt > 1) loop
                lbyte_val  := (digit_value(L(j)) * 16) + digit_value(L(j+1));
                j          := j + 2;

                mem_addr   := memory_addr / bytes_per_wd;
                to_write   := m(mem_addr);
                byte_num   := memory_addr - (mem_addr * bytes_per_wd);
                if(ENDIAN = 0) then
                  hi_bit_num := ((bytes_per_wd - byte_num) * 8) - 1;
                else
                  hi_bit_num := ((byte_num + 1) * 8) -1;
                end if;

                tmp_int    := lbyte_val / 256;
                tmp_int    := tmp_int * 256;
                lbyte_val  := lbyte_val - tmp_int;

                to_write(hi_bit_num downto (hi_bit_num-7)) :=
                                std_logic_vector(to_unsigned(lbyte_val,8));

                m(mem_addr):= to_write;

                memory_addr:= memory_addr + 1;
                byte_cnt   := byte_cnt - 1;
                byte_chk   := byte_chk + lbyte_val;
              end loop;
                           -- Get CheckSum
              lbyte_val    := (digit_value(L(j)) * 16) + digit_value(L(j+1));
              byte_chk     := byte_chk + lbyte_val;

              tmp_int      := byte_chk / 256;
              tmp_int      := tmp_int * 256;
              byte_chk     := byte_chk - tmp_int;

              chk_sum      :=     std_logic_vector(to_unsigned(byte_chk,8))
                              and X"ff";
						-- Check checksum
              if(chk_sum /= X"ff") then
                write_string(LL,"Checksum error in S record");
                writeline(output,LL);
              end if;

                           --
            when '3' =>    -- Data S3 record "32-bit" address
                           --
                           -- Extract the byte count
              byte_cnt     := (digit_value(L(3)) * 16) + digit_value(L(4));
                           -- Initialize the check sum
              byte_chk     := byte_cnt;
                           -- Extract the address
              hbyte_val    := (digit_value(L(5)) * 16) + digit_value(L(6));
              mhbyte_val   := (digit_value(L(7)) * 16) + digit_value(L(8));
              mlbyte_val   := (digit_value(L(9)) * 16) + digit_value(L(10));
              lbyte_val    := (digit_value(L(11)) * 16) + digit_value(L(12));
              byte_cnt     := byte_cnt - 4;
              byte_chk     := byte_chk + hbyte_val;
              byte_chk     := byte_chk + mhbyte_val;
              byte_chk     := byte_chk + mlbyte_val;
              byte_chk     := byte_chk + lbyte_val;
              memory_addr  :=   ( hbyte_val * 16777216)       -- << 24
                              + (mhbyte_val *    65536)       -- << 16
                              + (mlbyte_val *      256)       -- <<  8
                              + lbyte_val;
              memory_addr  := memory_addr - BASE_OFFSET;
              j            := 13;
                           -- Get all data bytes
              while(byte_cnt > 1) loop
                lbyte_val   := (digit_value(L(j)) * 16) + digit_value(L(j+1));
                j           := j + 2;

                mem_addr    := memory_addr / bytes_per_wd;
                to_write    := m(mem_addr);
                byte_num    := memory_addr - (mem_addr * bytes_per_wd);
                if(ENDIAN = 0) then
                  hi_bit_num  := ((bytes_per_wd - byte_num) * 8) - 1;
                else
                  hi_bit_num  := ((byte_num + 1) * 8) - 1;
                end if;

                tmp_int     := lbyte_val / 256;
                tmp_int     := tmp_int * 256;
                lbyte_val   := lbyte_val - tmp_int;

                to_write(hi_bit_num downto (hi_bit_num-7)) :=
                                std_logic_vector(to_unsigned(lbyte_val,8));

                m(mem_addr) := to_write;

                memory_addr := memory_addr + 1;
                byte_cnt    := byte_cnt - 1;
                byte_chk    := byte_chk + lbyte_val;
              end loop;
                            -- Get CheckSum
              lbyte_val     := (digit_value(L(j)) * 16) + digit_value(L(j+1));
              byte_chk      := byte_chk + lbyte_val;

              tmp_int       := byte_chk / 256;
              tmp_int       := tmp_int * 256;
              byte_chk      := byte_chk - tmp_int;

              chk_sum       :=     std_logic_vector(to_unsigned(byte_chk,8))
                               and X"ff";
						-- Check checksum
              if(chk_sum /= X"ff") then
                write_string(LL,"Checksum error in S record");
                writeline(output,LL);
              end if;

                            --
            when others =>  -- Ignore all other S records
                            --
              write_string(outline, "  S-record format ");
              write_string(outline, L(1 to 2));
              write_string(outline, " is not supported.");
              writeline(output,outline);

          end case;
        end if;
      end loop;
      file_close(init_data);
    end if;
  end init_mem; -- procedure

begin

  memory: process is
    variable mem             : ram_array;

    variable w_addr:              integer range WORDS-1 downto 0;
    variable L:                   LINE;
    variable upr_bit:             integer;
    variable lwr_bit:             integer;

    variable old_data        : std_logic_vector(WIDTH-1 downto 0);
    variable int_addr        : integer;
    variable address_valid   : std_logic;
    variable read_data       : std_logic_vector(WIDTH-1 downto 0);

    variable outline         : line;
  begin

                             -- This inits the memory upon instantiation
                             --  (simulator reset)
    if(SIM_INIT_FILE'length /= 0) then
      init_mem(mem,SIM_INIT_FILE);
    end if;

    loop
                             -- This inits the memory when the global signal
                             -- "initialize_memory" is asserted
      if(rising_edge(initialize_memory)) then
        if(SIM_INIT_FILE'length /= 0) then
          init_mem(mem,SIM_INIT_FILE);
        end if;
      end if;

                             -- Operation
      if(rising_edge(clk)) then
        if(cs = '1') then
                             --
                             -- Check incoming data for 'X'
                             --
          if(wr_en /= wr_en_zeros) then
            for i in 0 to WIDTH-1 loop
              if(wdata(i) = 'X') then
                write_string(outline, "Time: ");
                write(outline,now);
                write_string(outline, " : Writing 'X's to location: ");
                write(outline, addr, base => hex, field => 1);
                writeline(output,outline);
              end if;
            end loop;
          end if;
                             --
                             -- Check if address is in range
                             --
          int_addr           := to_integer(unsigned(addr));
          if(int_addr < WORDS) then
            address_valid    := '1';
            old_data         := mem(int_addr);
                                -- Only write the "bytes" indicated by wr_en(n)
                                -- wr_en(0) represents byte 0
                      -- Bits:  -- 63:56 55:48 47:40 39:32 31:25 24:16 15:8 7:0
                      -- Byte:  --   0     1     2     3     4     5     6   7
            if(wr_en /= wr_en_zeros) then
              read_data      := old_data;
              for n in 0 to (NUM_WE-1) loop
                if(ENDIAN = 0) then
                             -- Big Endian
                  lwr_bit    := (NUM_WE-n-1) * BITS_PER_WE;
                  upr_bit    := lwr_bit + (BITS_PER_WE -1);
                else
                             -- Little Endian
                  lwr_bit    := n * BITS_PER_WE;
                  upr_bit    := lwr_bit + (BITS_PER_WE -1);
                end if;

                if(wr_en(n) = '1') then
                  mem(int_addr)(upr_bit downto lwr_bit)
                             := wdata(upr_bit downto lwr_bit);
                end if;
              end loop;
            else
              read_data      := mem(int_addr);
            end if;
          else
            address_valid    := '0';
            write_string(outline, "Time: ");
            write(outline,now);
            write_string(outline, " : Illegal access address: ");
            write(outline, addr, base => hex, field => 1);
            writeline(output,outline);
          end if;

        else
                             --
                             -- Not selected
                             --
          address_valid      := '0';
        end if;

        cs_r                 <= cs;
        address_valid_r      <= address_valid;
      end if;

                             --
                             -- Read memory value
                             --
      if(     (cs_r = '1')
          and (address_valid_r = '1')
        ) then
        rdata                <= read_data after RD_ACCESS;
      end if;

      wait on clk, cs_r, addr, initialize_memory;

    end loop;
  end process memory;

end architecture sim;
