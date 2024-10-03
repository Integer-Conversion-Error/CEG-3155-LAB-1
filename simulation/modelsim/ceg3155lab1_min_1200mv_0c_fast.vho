-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "10/02/2024 18:19:23"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	displayController IS
    PORT (
	rightSig : IN std_logic;
	leftSig : IN std_logic;
	GClock : IN std_logic;
	GReset : IN std_logic;
	DisplayOut : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END displayController;

-- Design Ports Information
-- GReset	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[0]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[1]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[2]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[3]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[4]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[5]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[6]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DisplayOut[7]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leftSig	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rightSig	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GClock	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF displayController IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_rightSig : std_logic;
SIGNAL ww_leftSig : std_logic;
SIGNAL ww_GClock : std_logic;
SIGNAL ww_GReset : std_logic;
SIGNAL ww_DisplayOut : std_logic_vector(7 DOWNTO 0);
SIGNAL \GClock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GReset~input_o\ : std_logic;
SIGNAL \DisplayOut[0]~output_o\ : std_logic;
SIGNAL \DisplayOut[1]~output_o\ : std_logic;
SIGNAL \DisplayOut[2]~output_o\ : std_logic;
SIGNAL \DisplayOut[3]~output_o\ : std_logic;
SIGNAL \DisplayOut[4]~output_o\ : std_logic;
SIGNAL \DisplayOut[5]~output_o\ : std_logic;
SIGNAL \DisplayOut[6]~output_o\ : std_logic;
SIGNAL \DisplayOut[7]~output_o\ : std_logic;
SIGNAL \GClock~input_o\ : std_logic;
SIGNAL \GClock~inputclkctrl_outclk\ : std_logic;
SIGNAL \rightSig~input_o\ : std_logic;
SIGNAL \leftSig~input_o\ : std_logic;
SIGNAL \s2|U1|int_q~0_combout\ : std_logic;
SIGNAL \s4|U1|int_q~0_combout\ : std_logic;
SIGNAL \s2|U1|int_q~1_combout\ : std_logic;
SIGNAL \s1|U1|int_q~0_combout\ : std_logic;
SIGNAL \s0|U1|int_q~0_combout\ : std_logic;
SIGNAL \s0|U1|int_q~1_combout\ : std_logic;
SIGNAL \s3|U1|int_q~0_combout\ : std_logic;
SIGNAL \s3|U1|int_q~1_combout\ : std_logic;
SIGNAL \shiftl|loop0:0:Un|U1|int_q~0_combout\ : std_logic;
SIGNAL \shiftr|loop0:0:Un|U1|int_q~0_combout\ : std_logic;
SIGNAL \dispreg|U0|U1|int_q~0_combout\ : std_logic;
SIGNAL \dispreg|U0|U1|int_q~1_combout\ : std_logic;
SIGNAL \dispreg|U1|U1|int_q~0_combout\ : std_logic;
SIGNAL \dispreg|U1|U1|ALT_INV_int_q~0_combout\ : std_logic;
SIGNAL \dispreg|U0|U1|ALT_INV_int_q~1_combout\ : std_logic;

BEGIN

ww_rightSig <= rightSig;
ww_leftSig <= leftSig;
ww_GClock <= GClock;
ww_GReset <= GReset;
DisplayOut <= ww_DisplayOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\GClock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GClock~input_o\);
\dispreg|U1|U1|ALT_INV_int_q~0_combout\ <= NOT \dispreg|U1|U1|int_q~0_combout\;
\dispreg|U0|U1|ALT_INV_int_q~1_combout\ <= NOT \dispreg|U0|U1|int_q~1_combout\;

-- Location: IOOBUF_X0_Y35_N2
\DisplayOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispreg|U0|U1|ALT_INV_int_q~1_combout\,
	devoe => ww_devoe,
	o => \DisplayOut[0]~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\DisplayOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \dispreg|U1|U1|ALT_INV_int_q~0_combout\,
	devoe => ww_devoe,
	o => \DisplayOut[1]~output_o\);

-- Location: IOOBUF_X89_Y73_N23
\DisplayOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[2]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\DisplayOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N2
\DisplayOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[4]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\DisplayOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[5]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\DisplayOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[6]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\DisplayOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DisplayOut[7]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\GClock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GClock,
	o => \GClock~input_o\);

-- Location: CLKCTRL_G2
\GClock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GClock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GClock~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y35_N8
\rightSig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rightSig,
	o => \rightSig~input_o\);

-- Location: IOIBUF_X0_Y34_N22
\leftSig~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_leftSig,
	o => \leftSig~input_o\);

-- Location: LCCOMB_X1_Y36_N18
\s2|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s2|U1|int_q~0_combout\ = ((\rightSig~input_o\ & !\s0|U1|int_q~1_combout\)) # (!\GClock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GClock~input_o\,
	datac => \rightSig~input_o\,
	datad => \s0|U1|int_q~1_combout\,
	combout => \s2|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N22
\s4|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s4|U1|int_q~0_combout\ = ((GLOBAL(\GClock~inputclkctrl_outclk\) & ((!\leftSig~input_o\))) # (!GLOBAL(\GClock~inputclkctrl_outclk\) & (\s4|U1|int_q~0_combout\))) # (!\s2|U1|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s4|U1|int_q~0_combout\,
	datab => \leftSig~input_o\,
	datac => \GClock~inputclkctrl_outclk\,
	datad => \s2|U1|int_q~0_combout\,
	combout => \s4|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N24
\s2|U1|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s2|U1|int_q~1_combout\ = ((GLOBAL(\GClock~inputclkctrl_outclk\) & ((\leftSig~input_o\))) # (!GLOBAL(\GClock~inputclkctrl_outclk\) & (\s2|U1|int_q~1_combout\))) # (!\s2|U1|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s2|U1|int_q~1_combout\,
	datab => \leftSig~input_o\,
	datac => \s2|U1|int_q~0_combout\,
	datad => \GClock~inputclkctrl_outclk\,
	combout => \s2|U1|int_q~1_combout\);

-- Location: LCCOMB_X1_Y36_N12
\s1|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s1|U1|int_q~0_combout\ = ((GLOBAL(\GClock~inputclkctrl_outclk\) & ((\leftSig~input_o\))) # (!GLOBAL(\GClock~inputclkctrl_outclk\) & (\s1|U1|int_q~0_combout\))) # (!\s3|U1|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3|U1|int_q~0_combout\,
	datab => \s1|U1|int_q~0_combout\,
	datac => \leftSig~input_o\,
	datad => \GClock~inputclkctrl_outclk\,
	combout => \s1|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N16
\s0|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s0|U1|int_q~0_combout\ = (\s4|U1|int_q~0_combout\ & (\s2|U1|int_q~1_combout\ & (\GClock~input_o\ & \s1|U1|int_q~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s4|U1|int_q~0_combout\,
	datab => \s2|U1|int_q~1_combout\,
	datac => \GClock~input_o\,
	datad => \s1|U1|int_q~0_combout\,
	combout => \s0|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N6
\s0|U1|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s0|U1|int_q~1_combout\ = (\s0|U1|int_q~1_combout\ & (((\s3|U1|int_q~1_combout\ & \s0|U1|int_q~0_combout\)) # (!\GClock~input_o\))) # (!\s0|U1|int_q~1_combout\ & (\s3|U1|int_q~1_combout\ & ((\s0|U1|int_q~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s0|U1|int_q~1_combout\,
	datab => \s3|U1|int_q~1_combout\,
	datac => \GClock~input_o\,
	datad => \s0|U1|int_q~0_combout\,
	combout => \s0|U1|int_q~1_combout\);

-- Location: LCCOMB_X1_Y36_N30
\s3|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s3|U1|int_q~0_combout\ = ((!\rightSig~input_o\ & !\s0|U1|int_q~1_combout\)) # (!\GClock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GClock~input_o\,
	datac => \rightSig~input_o\,
	datad => \s0|U1|int_q~1_combout\,
	combout => \s3|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N8
\s3|U1|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s3|U1|int_q~1_combout\ = ((GLOBAL(\GClock~inputclkctrl_outclk\) & ((!\leftSig~input_o\))) # (!GLOBAL(\GClock~inputclkctrl_outclk\) & (\s3|U1|int_q~1_combout\))) # (!\s3|U1|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3|U1|int_q~1_combout\,
	datab => \leftSig~input_o\,
	datac => \s3|U1|int_q~0_combout\,
	datad => \GClock~inputclkctrl_outclk\,
	combout => \s3|U1|int_q~1_combout\);

-- Location: LCCOMB_X1_Y36_N14
\shiftl|loop0:0:Un|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \shiftl|loop0:0:Un|U1|int_q~0_combout\ = (\shiftl|loop0:0:Un|U1|int_q~0_combout\) # ((!\s3|U1|int_q~1_combout\ & \GClock~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \shiftl|loop0:0:Un|U1|int_q~0_combout\,
	datac => \s3|U1|int_q~1_combout\,
	datad => \GClock~input_o\,
	combout => \shiftl|loop0:0:Un|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N28
\shiftr|loop0:0:Un|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \shiftr|loop0:0:Un|U1|int_q~0_combout\ = (\shiftr|loop0:0:Un|U1|int_q~0_combout\) # ((\GClock~input_o\ & ((!\s2|U1|int_q~1_combout\) # (!\s4|U1|int_q~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \shiftr|loop0:0:Un|U1|int_q~0_combout\,
	datab => \GClock~input_o\,
	datac => \s4|U1|int_q~0_combout\,
	datad => \s2|U1|int_q~1_combout\,
	combout => \shiftr|loop0:0:Un|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N0
\dispreg|U0|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispreg|U0|U1|int_q~0_combout\ = (\rightSig~input_o\ & (\shiftl|loop0:0:Un|U1|int_q~0_combout\ & ((\shiftr|loop0:0:Un|U1|int_q~0_combout\) # (!\leftSig~input_o\)))) # (!\rightSig~input_o\ & (((\shiftr|loop0:0:Un|U1|int_q~0_combout\)) # 
-- (!\leftSig~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rightSig~input_o\,
	datab => \leftSig~input_o\,
	datac => \shiftl|loop0:0:Un|U1|int_q~0_combout\,
	datad => \shiftr|loop0:0:Un|U1|int_q~0_combout\,
	combout => \dispreg|U0|U1|int_q~0_combout\);

-- Location: LCCOMB_X1_Y36_N26
\dispreg|U0|U1|int_q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispreg|U0|U1|int_q~1_combout\ = (GLOBAL(\GClock~inputclkctrl_outclk\) & ((\dispreg|U0|U1|int_q~0_combout\))) # (!GLOBAL(\GClock~inputclkctrl_outclk\) & (\dispreg|U0|U1|int_q~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dispreg|U0|U1|int_q~1_combout\,
	datac => \GClock~inputclkctrl_outclk\,
	datad => \dispreg|U0|U1|int_q~0_combout\,
	combout => \dispreg|U0|U1|int_q~1_combout\);

-- Location: LCCOMB_X1_Y36_N20
\dispreg|U1|U1|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \dispreg|U1|U1|int_q~0_combout\ = (\GClock~input_o\) # (\dispreg|U1|U1|int_q~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GClock~input_o\,
	datac => \dispreg|U1|U1|int_q~0_combout\,
	combout => \dispreg|U1|U1|int_q~0_combout\);

-- Location: IOIBUF_X91_Y0_N22
\GReset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GReset,
	o => \GReset~input_o\);

ww_DisplayOut(0) <= \DisplayOut[0]~output_o\;

ww_DisplayOut(1) <= \DisplayOut[1]~output_o\;

ww_DisplayOut(2) <= \DisplayOut[2]~output_o\;

ww_DisplayOut(3) <= \DisplayOut[3]~output_o\;

ww_DisplayOut(4) <= \DisplayOut[4]~output_o\;

ww_DisplayOut(5) <= \DisplayOut[5]~output_o\;

ww_DisplayOut(6) <= \DisplayOut[6]~output_o\;

ww_DisplayOut(7) <= \DisplayOut[7]~output_o\;
END structure;


