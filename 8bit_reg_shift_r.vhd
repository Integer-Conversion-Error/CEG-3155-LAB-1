library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit Register entity
entity Register8bitr is
    Port (
        CLK   : in  STD_LOGIC;                  -- Clock input
        LD    : in  STD_LOGIC;                  -- Load signal input
		  SHR	  : in STD_LOGIC;							-- Shift Right input
        D_in  : in  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit Data input
        Q_out : out STD_LOGIC_VECTOR (7 downto 0)   -- 8-bit Data output
    );
end Register8bitr;

architecture structural of Register8bitr is
    -- Internal signals for the outputs of each D flip-flop
    signal Q : STD_LOGIC_VECTOR (7 downto 0);
	 constant EndBit : integer := 0;

begin

    -- Instantiating 8 D flip-flops to form an 8-bit register
    U0: entity work.DFF port map (i_d => D_in(0), i_clock => CLK, o_q => (Q(0) AND NOT(SHR)) OR (Q(1) AND SHR));
    U1: entity work.DFF port map (i_d => D_in(1), i_clock => CLK, o_q => (Q(1) AND NOT(SHR)) OR (Q(2) AND SHR));
    U2: entity work.DFF port map (i_d => D_in(2), i_clock => CLK, o_q => (Q(2) AND NOT(SHR)) OR (Q(3) AND SHR));
    U3: entity work.DFF port map (i_d => D_in(3), i_clock => CLK, o_q => (Q(3) AND NOT(SHR)) OR (Q(4) AND SHR));
    U4: entity work.DFF port map (i_d => D_in(4), i_clock => CLK, o_q => (Q(4) AND NOT(SHR)) OR (Q(5) AND SHR));
    U5: entity work.DFF port map (i_d => D_in(5), i_clock => CLK, o_q => (Q(5) AND NOT(SHR)) OR (Q(6) AND SHR));
    U6: entity work.DFF port map (i_d => D_in(6), i_clock => CLK, o_q => (Q(6) AND NOT(SHR)) OR (Q(7) AND SHR));
    U7: entity work.DFF port map (i_d => D_in(7), i_clock => CLK, o_q => (Q(7) AND NOT(SHR)) OR (EndBit AND SHR));

    -- Connect the internal signal Q to the output of the register
    Q_out <= Q;

end structural;
