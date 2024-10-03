library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit Register entity
entity eight_bit_reg is
    Port (
        CLK   : in  STD_LOGIC;                  -- Clock input
        LD    : in  STD_LOGIC;                  -- Load signal input
        D_in  : in  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit Data input
        Q_out : out STD_LOGIC_VECTOR (7 downto 0)   -- 8-bit Data output
    );
end eight_bit_reg;

architecture structural of eight_bit_reg is
    -- Internal signals for the outputs of each D flip-flop
    signal Q : STD_LOGIC_VECTOR (7 downto 0);
begin

    -- Instantiating 8 D flip-flops to form an 8-bit register
    U0: entity work.D_FF port map (i_d => D_in(0), i_clock => CLK, o_q => Q(0));
    U1: entity work.D_FF port map (i_d => D_in(1), i_clock => CLK, o_q => Q(1));
    U2: entity work.D_FF port map (i_d => D_in(2), i_clock => CLK, o_q => Q(2));
    U3: entity work.D_FF port map (i_d => D_in(3), i_clock => CLK, o_q => Q(3));
    U4: entity work.D_FF port map (i_d => D_in(4), i_clock => CLK, o_q => Q(4));
    U5: entity work.D_FF port map (i_d => D_in(5), i_clock => CLK, o_q => Q(5));
    U6: entity work.D_FF port map (i_d => D_in(6), i_clock => CLK, o_q => Q(6));
    U7: entity work.D_FF port map (i_d => D_in(7), i_clock => CLK, o_q => Q(7));

    -- Connect the internal signal Q to the output of the register
    Q_out <= Q;

end structural;
