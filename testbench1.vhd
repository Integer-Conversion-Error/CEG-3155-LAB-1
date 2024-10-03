-- testbench
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;

entity testbench1 is 
end entity testbench1;



architecture test of testbench1 is
signal R, L, clk, rst : STD_LOGIC;
signal dis_out : STD_LOGIC_VECTOR(7 downto 0);

begin

dut: entity work.displayController port map(
	rightSig => R, leftSig => L, GClock => clk, GReset => rst, --: IN STD_LOGIC;
	DisplayOut => dis_out --: OUT STD_LOGIC_VECTOR(7 downto 0);
);
clk <= not(clk) after 100 ns;
rst <= '1', '0' after 5 ns;
stimulus:
process begin
	wait until (rst = '0');
	R <= not(R) after 200 ns;
	L <= not(L) after 400 ns;
end process stimulus;

end architecture test;
--https://fpgatutorial.com/how-to-write-a-basic-testbench-using-vhdl/