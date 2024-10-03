library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit Register entity
entity eight_bit_reg_shift_l is
    Port (
        CLK   : in  STD_LOGIC;                  -- Clock input
        LD    : in  STD_LOGIC;                  -- Load signal input
		  SHL	  : in STD_LOGIC;							-- Shift Left input
        D_in  : in  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit Data input
        Q_out : out STD_LOGIC_VECTOR (7 downto 0)   -- 8-bit Data output
    );
end eight_bit_reg_shift_l;

architecture structural of eight_bit_reg_shift_l is
    -- Internal signals for the outputs of each D flip-flop
    signal Q: STD_LOGIC_VECTOR (7 downto 0);
	 constant EndBit : integer := 0;

begin


    --U0: entity work.D_FF port map (i_d => ((Q(0) AND NOT(SHL)) OR ('0' AND SHL)), i_clock => CLK, o_q => Q_out(0));

	 --loop0: for i in 0 to 6 generate

			--Un: entity work.D_FF port map (i_d => ((Q(i) AND NOT(SHL)) OR (Q(i+1) AND SHL)), i_clock => CLK, o_q => Q(i));	
			--Qt(i) <= ((Q(i) AND NOT(SHL)) OR (Q(i+1) AND SHL));	
    --end generate;
	 
		--Qt(7) <= ((Q(7) AND NOT(SHL)) OR ('0' AND SHL));
		--U7: entity work.D_FF port map (i_d => ((Q(7) AND NOT(SHL)) OR ('0' AND SHL)), i_clock => CLK, o_q => Q(7));
		 
		 U7: entity work.D_FF port map (i_d => ((Q(0) AND NOT(SHL)) OR ('0' AND SHL)), i_clock => CLK, o_q => Q(7));
		 loop0: for i in 0 to 6 generate
			Un: entity work.D_FF port map (i_d => ((Q(i) AND NOT(SHL)) OR (Q(i+1) AND SHL)), i_clock => CLK, o_q => Q(i));	
				
    end generate;
	 
	--Qt(7) <= ((Q(7) AND NOT(SHR)) OR ('0' AND SHR));
	
	Q_out <= Q;
end structural;
