	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-bit Register entity
entity eight_bit_reg_shift_r is
    Port (
        CLK   : in  STD_LOGIC;                  -- Clock input
        LD    : in  STD_LOGIC;                  -- Load signal input
		  SHR	  : in STD_LOGIC;							-- Shift Right input
        D_in  : in  STD_LOGIC_VECTOR (7 downto 0);  -- 8-bit Data input
        QR_out : out STD_LOGIC_VECTOR (7 downto 0)   -- 8-bit Data output
    );
end eight_bit_reg_shift_r;

architecture structural of eight_bit_reg_shift_r is
    -- Internal signals for the outputs of each D flip-flop
    signal Q, Qt : STD_LOGIC_VECTOR (7 downto 0);
	
begin

	 
	 loop0: for i in 0 to 6 generate
			Qt(i) <= ((Q(i) AND NOT(SHR)) OR (Q(i+1) AND SHR));
			Un: entity work.D_FF port map (i_d => Qt(i), i_clock => CLK, o_q => Q(i));	
				
    end generate;
	 
	--Qt(7) <= ((Q(7) AND NOT(SHR)) OR ('0' AND SHR));
	U7: entity work.D_FF port map (i_d => ((Q(7) AND NOT(SHR)) OR ('0' AND SHR)), i_clock => CLK, o_q => Q(7));

    -- Connect the internal signal Q to the output of the register
    QR_out <= Q;

end structural;
