-- nBit_shift_reg

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


entity nBit_shift_reg is
generic ( n : positive := 8 );
port(
	sel0, sel1 : in std_logic;
	parallel_in, preset, clear : in std_logic_vector(n-1 downto 0);		--preset, clear could be masks with preset = !clear
	clk, en : in std_logic;
	q, q_not: out std_logic_vector(n-1 downto 0));
end nBit_shift_reg;

architecture rtl of nBit_shift_reg is

-- s1, s0	clk /^ action
-- 0,  0		same
-- 0,  1		parallel_in
-- 1,  0		sl
-- 1,  1 	sr

-- conmponents
component shift_d_flipflop is
port(
	parallel_in, d_left, d_right, 
	sel0, sel1, 
	clk, en, preset, clear : in std_logic;
	q, q_not: out std_logic);
end component;

-- wires
signal d_left, d_right : std_logic_vector(n-1 downto 0);
	

begin	
	--lsb
	shift_dff: shift_d_flipflop port map (
		sel0, sel1l
		parallel_in(0), d_left(1), d_right(n-2),
		clk, en, preset(0), clear(0), 
		q(0), q_not(0));

	--bits 1->n-2
	loop0: for i in 1 to n-2 generate
		dff: shift_d_flipflop port map (
			s1, s0,
			parallel_in(i), d_left(i+1), d_right(i-1),
			clk, en, preset(i), clear(i), 
			q(i), q_not(i));
	end generate;

	--msb
	dffNMin: shift_d_flipflop port map (
		s1, s0,
		parallel_in(n-1), d_left(0), d_right(n-2),
		clk, en, preset(n-1), clear(n-1), 
		q(n-1), q_not(n-1));
	
end rtl;