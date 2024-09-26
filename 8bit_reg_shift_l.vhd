library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit Register entity
entity Register8bitl is
    Port (
        CLK   : in  STD_LOGIC;                  -- Clock input
        LD    : in  STD_LOGIC;                  -- Load signal input
		  SHL	  : in STD_LOGIC;							-- Shift Left input
        D_in  : in  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit Data input
        Q_out : out STD_LOGIC_VECTOR (7 downto 0)   -- 8-bit Data output
    );
end Register8bitl;

architecture structural of Register8bitl is
    -- Internal signals for the outputs of each D flip-flop
    signal Q : STD_LOGIC_VECTOR (7 downto 0);
	 constant EndBit : integer := 0;

begin

    -- Instantiating 8 D flip-flops to form an 8-bit register
    U0: entity work.DFF port map (i_d => D_in(0), i_clock => CLK, o_q => (Q(0) AND NOT(SHL)) OR (EndBit AND SHL));
    U1: entity work.DFF port map (i_d => D_in(1), i_clock => CLK, o_q => (Q(1) AND NOT(SHL)) OR (Q(0) AND SHL));
    U2: entity work.DFF port map (i_d => D_in(2), i_clock => CLK, o_q => (Q(2) AND NOT(SHL)) OR (Q(1) AND SHL));
    U3: entity work.DFF port map (i_d => D_in(3), i_clock => CLK, o_q => (Q(3) AND NOT(SHL)) OR (Q(2) AND SHL));
    U4: entity work.DFF port map (i_d => D_in(4), i_clock => CLK, o_q => (Q(4) AND NOT(SHL)) OR (Q(3) AND SHL));
    U5: entity work.DFF port map (i_d => D_in(5), i_clock => CLK, o_q => (Q(5) AND NOT(SHL)) OR (Q(4) AND SHL));
    U6: entity work.DFF port map (i_d => D_in(6), i_clock => CLK, o_q => (Q(6) AND NOT(SHL)) OR (Q(5) AND SHL));
    U7: entity work.DFF port map (i_d => D_in(7), i_clock => CLK, o_q => (Q(7) AND NOT(SHL)) OR (Q(6) AND SHL));

    -- Connect the internal signal Q to the output of the register
    Q_out <= Q;

end structural;
