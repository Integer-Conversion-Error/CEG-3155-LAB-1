library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port ( 
        I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);  
        S0, S1         : in STD_LOGIC;  
        Y              : out STD_LOGIC_VECTOR(7 downto 0); 
    );
end mux4x1;

architecture structural of mux4x1 is

    signal a0, a1, a2, a3 : STD_LOGIC_VECTOR(7 downto 0);

begin

    a0 <= I0 AND NOT(S1) AND NOT(S0);   
    a1 <= I1 AND NOT(S1) AND S0;        
    a2 <= I2 AND S1 AND NOT(S0);        
    a3 <= I3 AND S1 AND S0;             

    Y <= a0 OR a1 OR a2 OR a3;

end structural;
