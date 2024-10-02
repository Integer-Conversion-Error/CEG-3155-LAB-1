--toplevel
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;

ENTITY displayController IS 
	PORT (
		rightSig, leftSig, GClock, GReset : IN STD_LOGIC;
		DisplayOut : OUT STD_LOGIC_VECTOR(7 downto 0);
	
	);
END displayController;

ARCHITECTURE structural OF displayController IS
 signal Disp_in : STD_LOGIC_VECTOR(7 downto 0);
 signal L_out : STD_LOGIC_VECTOR(7 downto 0);
 signal R_out : STD_LOGIC_VECTOR(7 downto 0);
 signal D_out: STD_LOGIC_VECTOR(7 downto 0);
 
 

BEGIN

s0: entity work.D_FF port map(
	     i_d => s1_out or s2_out or s3_out or s4_out,     --: IN  STD_LOGIC;        
        i_clock => GClock,  --: IN  STD_LOGIC;        
        o_q => s0_out      --: OUT STD_LOGIC;        
        o_qBar => open  --: OUT STD_LOGIC   
)
s1: entity work.D_FF port map(
	     i_d => s0_out and NOT(rightSig) and NOT(leftSig),     --: IN  STD_LOGIC;        
        i_clock => GClock,  --: IN  STD_LOGIC;        
        o_q => s1_out      --: OUT STD_LOGIC;        
        o_qBar => open  --: OUT STD_LOGIC   
)
s2: entity work.D_FF port map(
	     i_d => s0_out and rightSig and NOT(leftSig),     --: IN  STD_LOGIC;        
        i_clock => GClock,  --: IN  STD_LOGIC;        
        o_q => s2_out      --: OUT STD_LOGIC;        
        o_qBar => open  --: OUT STD_LOGIC   
)
s3: entity work.D_FF port map(
	     i_d => s0_out and NOT(rightSig) and leftSig,     --: IN  STD_LOGIC;        
        i_clock => GClock,  --: IN  STD_LOGIC;        
        o_q => s3_out      --: OUT STD_LOGIC;        
        o_qBar => open  --: OUT STD_LOGIC   
)
s3: entity work.D_FF port map(
	     i_d => s0_out and rightSig and leftSig,     --: IN  STD_LOGIC;        
        i_clock => GClock,  --: IN  STD_LOGIC;        
        o_q => s4_out      --: OUT STD_LOGIC;        
        o_qBar => open  --: OUT STD_LOGIC   
)

shiftr: entity work.8bit_reg_shift_r port map (
	CLK => GClock, 
	LD => s0_out, 
	SHR => s4_out OR s2_out, 
	D_in => "10000000", 
	Q_out => R_out
);

shiftl: entity work.8bit_reg_shift_l port map (
	CLK => GClock, 
	LD => s0_out, 
	SHL => s4_out OR s3_out, 
	D_in => "00000001", 
	Q_out => L_out
);

mux: entity work.2_4_mux.vhd port map (
   I0 => "00000000", I1 => R_out, I2 => L_out, I3 => R_out OR L_out, --: in STD_LOGIC;  
   S0 => leftSig, S1 => rightSig,         --: in STD_LOGIC;  
   Y => Disp_in              --: out STD_LOGIC 
);

dispreg: entity work.8bit_reg port map (
	CLK => GClock, 
	LD => s0_out or s1_out or s2_out or s3_out or s4_out, 
	D_in => Disp_in, 
	Q_out => D_out
);

DisplayOut <= D_out;

END structural;


















