library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_one_mux is
	generic ( n : positive := 8 );
    Port ( 
        I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);  
        S0, S1         : in STD_LOGIC;  
        Y              : out STD_LOGIC_VECTOR(7 downto 0) 
    );
end four_one_mux;

architecture structural of four_one_mux is
	
    signal a0, a1, a2, a3 : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	
	
	loop0: for i in 0 to n-1 generate
--        mux8_inst: mux8 port map (
--            l(i+7 downto i),        -- problem is here
--            m, outp(i));
		a0(i) <= I0(i) AND NOT(S1) AND NOT(S0);   
		a1(i) <= I1(i) AND NOT(S1) AND S0;        
		a2(i) <= I2(i) AND S1 AND NOT(S0);        
		a3(i) <= I3(i) AND S1 AND S0;    
		
    end generate;
--    a0 <= I0 AND NOT(S1) AND NOT(S0);   
--    a1 <= I1 AND NOT(S1) AND S0;        
--    a2 <= I2 AND S1 AND NOT(S0);        
--    a3 <= I3 AND S1 AND S0;             

    Y <= a0 OR a1 OR a2 OR a3;

end structural;
