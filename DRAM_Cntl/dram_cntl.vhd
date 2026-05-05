library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dram_cntl is
  port (
    clk:          in std_logic;
    rst0:         in std_logic;

    addr:         in std_logic_vector(19 downto 0);

    start:        in std_logic;
    acc_type:     in std_logic_vector(1 downto 0);  -- "00" single access
                                                    -- "01" page access
                                                    -- "10" refresh
    size:         in std_logic_vector(1 downto 0);  -- "00" word
                                                    -- "01" half-word
                                                    -- "10" byte
    r1w0:         in std_logic;

    ras_0:       out std_logic;
    cas_0:       out std_logic_vector(3 downto 0);
    we_0:        out std_logic;
    latch:       out std_logic;

    mux_addr:    out std_logic_vector(8 downto 0)
  );
end entity dram_cntl;

architecture rtl of dram_cntl is

  type state_type is (P1, P2, R, C1, C2, E);

  signal next_state_s          : state_type;
  signal next_cntr_s           : unsigned(1 downto 0);
  signal next_addr_cnt_s       : unsigned(1 downto 0);
  signal next_addr_lo_s        : std_logic_vector(1 downto 0);

  signal next_ras_s            : std_logic;
  signal next_cas_s            : std_logic_vector(3 downto 0);
  signal next_latch_s          : std_logic;
  signal next_we_0_s           : std_logic;

  signal addr_r                : std_logic_vector(19 downto 0);
  signal acc_type_r            : std_logic_vector(1 downto 0);
  signal size_r                : std_logic_vector(1 downto 0);
  signal r1w0_r                : std_logic;

  signal state_r               : state_type;
  signal cntr_r                : unsigned(1 downto 0);
  signal addr_cnt_r            : unsigned(1 downto 0);
  signal addr_lo_r             : std_logic_vector(1 downto 0);

  signal ras_r                 : std_logic;
  signal cas_r                 : std_logic_vector(3 downto 0);
  signal latch_r               : std_logic;
  signal we_0_r                : std_logic;

begin

  input_regs: process(rst0, clk) is
  begin
    if(rst0 = '0') then
      addr_r                   <= (others => '0');
      acc_type_r               <= (others => '0');
      size_r                   <= (others => '0');
      r1w0_r                   <= '1';
    else
      if(rising_edge(clk)) then
        if(start = '1') then
          addr_r               <= addr;
          acc_type_r           <= acc_type;
          size_r               <= size;
          r1w0_r               <= r1w0;
        end if;
      end if;
    end if;
  end process input_regs;

  state_machine_comb: process(
                               state_r, cntr_r, addr_cnt_r,
                               start, r1w0_r, acc_type_r, size_r, addr_r,
                               addr_lo_r
                             ) is

    variable next_state_v      : state_type;
    variable next_cntr_v       : unsigned(1 downto 0);
    variable next_addr_cnt_v   : unsigned(1 downto 0);
    variable next_addr_lo_v    : std_logic_vector(1 downto 0);

    variable next_ras_v        : std_logic;
    variable next_latch_v      : std_logic;
    variable next_cas_v        : std_logic_vector(3 downto 0);
    variable next_we_0_v       : std_logic;

    variable this_mux_addr_v   : std_logic_vector(8 downto 0);
  begin
                               -- Assign default values to all variables
                               ---- This eliminates the possiblility of latches
                               ---- and will be the value assigned if not
                               ---- over-ridden in the "next-state/value" 
                               ---- logic below
                               --
    next_ras_v                 := '1';
    next_cas_v                 := "1111";
    next_latch_v               := '0';
    next_we_0_v                := '1';

    next_state_v               := state_r;
    next_cntr_v                := cntr_r;
    next_addr_cnt_v            := addr_cnt_r;
    next_addr_lo_v             := addr_lo_r;

    this_mux_addr_v            := addr_r(19 downto 11);

                               --
                               -- The state machine case statement
                               --
    case (state_r) is
      ----------------------------
      when P1 =>
        if(start = '1') then   -- If start not active, stay in P1
          next_state_v         := P2;
        end if;
      ----------------------------
      when P2 =>
        if(acc_type_r = "10") then                -- refresh
          next_cas_v           := "0000";
        else                                    -- all other cycle types
          next_ras_v           := '0';
        end if;
        next_addr_cnt_v        := unsigned(addr_r(3 downto 2));
        next_addr_lo_v         := addr_r(1 downto 0);
        next_cntr_v            := "00";
        this_mux_addr_v        := addr_r(19 downto 11);
        next_state_v           := R;
      ----------------------------
      when R  =>
        if(acc_type_r = "10") then                -- refresh
          next_cas_v           := "0000";
          next_ras_v           := '0';
        else                                    -- all other cycle types
          next_ras_v           := '0';
          next_we_0_v          := r1w0_r;
        end if;
        this_mux_addr_v        := addr_r(19 downto 11);
        next_state_v           := C1;
      ----------------------------
      when C1 =>
        if(acc_type_r = "10") then                -- refresh
          next_ras_v           := '0';
        else                                    -- all other cycle types
          next_ras_v           := '0';
                               --
                               -- Which CAS to assert depends on size
                               -- and address bits (1:0)
                               --
          case size_r is
            ----------------------
            when "00" =>                        -- word
              next_cas_v       := "0000";
            ----------------------
            when "01" =>                        -- half word
              if(addr_lo_r(1) = '0') then
                next_cas_v     := "0011";
              else
                next_cas_v     := "1100";
              end if;
            ----------------------
            when "10" =>                        -- byte
              case addr_lo_r(1 downto 0) is
                when "00" =>
                  next_cas_v   := "0111";
                when "01" =>
                  next_cas_v   := "1011";
                when "10" =>
                  next_cas_v   := "1101";
                when "11" =>
                  next_cas_v   := "1110";
                when others =>
                  null;
              end case;
            ----------------------
            when others =>
              null;
          end case;
          next_latch_v         := '1';
          next_we_0_v          := r1w0_r;
        end if;
        this_mux_addr_v        :=    addr(10 downto 4)
                                   & std_logic_vector(addr_cnt_r);
        next_state_v           := C2;
      ----------------------------
      when C2 =>
        if(     (acc_type_r = "01")           -- page mode
            and (cntr_r /= "11")) then      -- not done
          next_cntr_v          := cntr_r + 1;
          next_addr_cnt_v      := addr_cnt_r + 1;
          next_state_v         := C1;      -- do again
        else
          next_state_v         := E;       -- continue on
        end if;
        next_ras_v             := '0';
        this_mux_addr_v        :=    addr(10 downto 4)
                                   & std_logic_vector(addr_cnt_r);
      ----------------------------
      when E  =>
        next_state_v           := P1;
      ----------------------------
        
    end case;

    next_state_s               <= next_state_v;
    next_cntr_s                <= next_cntr_v;
    next_addr_cnt_s            <= next_addr_cnt_v;
    next_addr_lo_s             <= next_addr_lo_v;

    next_ras_s                 <= next_ras_v;
    next_cas_s                 <= next_cas_v;
    next_latch_s               <= next_latch_v;
    next_we_0_s                <= next_we_0_v;

    mux_addr                   <= this_mux_addr_v;

  end process state_machine_comb;


  state_machine_seq: process ( rst0,
                               clk
                             ) is

  begin
                               --
                               -- All registers
                               --
    if(rst0 = '0') then
                               -- Initialization
      state_r                  <= P1;
      cntr_r                   <= "00";
      addr_cnt_r               <= "00";
      addr_lo_r                <= "00";

      ras_r                    <= '1';
      cas_r                    <= "1111";
      latch_r                  <= '0';
      we_0_r                   <= '1';

    elsif(rising_edge(clk)) then
                               -- Operation
      state_r                  <= next_state_s;
      cntr_r                   <= next_cntr_s;
      addr_cnt_r               <= next_addr_cnt_s;
      addr_lo_r                <= next_addr_lo_s;

      ras_r                    <= next_ras_s;
      cas_r                    <= next_cas_s;
      latch_r                  <= next_latch_s;
      we_0_r                   <= next_we_0_s;
    end if;

  end process state_machine_seq;

                               --
                               -- Output assignments
                               --
  we_0                         <= we_0_r;
  ras_0                        <= ras_r;
  cas_0                        <= cas_r;
  latch                        <= latch_r;


end architecture rtl;  -- of dram_cntl

