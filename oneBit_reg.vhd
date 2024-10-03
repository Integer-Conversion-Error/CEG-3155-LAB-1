-- d_flipflop_en

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity oneBit_reg is
port(
	d, preset, clear, clk, en : in std_logic;
	q, q_not: out std_logic);
end oneBit_reg;

architecture rtl of oneBit_reg is

-- conmponents

component mux2 is
port(
	sel0, in0, in1 : in std_logic;
	out0 : out std_logic);
end component;

-- wires
signal d_en, int_q, clk_not : std_logic;

begin
	mux : mux2 port map(en, int_q, d, d_en);
							-- sel0, in0, in1, out0

	clk_not <= not clk;
	master : ENTITY work.d_latch(struct)
		 port map (preset, d_en, clk_not, clear, int_q, open);
	slave : ENTITY work.d_latch(struct)
		 port map (preset, int_q, clk, clear, q, q_not);
end rtl;