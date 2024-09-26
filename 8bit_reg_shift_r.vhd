library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity d_flip_flop is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        d      : in  STD_LOGIC;
        q      : out STD_LOGIC
    );
end d_flip_flop;

architecture Behavioral of d_flip_flop is
begin
    process (clk, reset)
    begin
        if reset = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;


entity shift_register is
    Port (
        clk         : in  STD_LOGIC;          
        reset       : in  STD_LOGIC;          
        load        : in  STD_LOGIC;          
        data_in     : in  STD_LOGIC_VECTOR(7 downto 0); 
        shift_right : in  STD_LOGIC;          
        q           : out STD_LOGIC_VECTOR(7 downto 0)  
    );
end shift_register;

architecture Structural of shift_register is
    signal d, q_internal : STD_LOGIC_VECTOR(7 downto 0);
    signal load_or_shift : STD_LOGIC_VECTOR(7 downto 0);

    component d_flip_flop
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            d     : in  STD_LOGIC;
            q     : out STD_LOGIC
        );
    end component;

begin

    process (data_in, q_internal, load, shift_right)
    begin
        if load = '1' then
            load_or_shift <= data_in;
        elsif shift_right = '1' then
            load_or_shift(7) <= '0';          
            load_or_shift(6 downto 0) <= q_internal(7 downto 1);  
        else
            load_or_shift <= q_internal;      
        end if;
    end process;

    U0: d_flip_flop port map(clk, reset, load_or_shift(0), q_internal(0));
    U1: d_flip_flop port map(clk, reset, load_or_shift(1), q_internal(1));
    U2: d_flip_flop port map(clk, reset, load_or_shift(2), q_internal(2));
    U3: d_flip_flop port map(clk, reset, load_or_shift(3), q_internal(3));
    U4: d_flip_flop port map(clk, reset, load_or_shift(4), q_internal(4));
    U5: d_flip_flop port map(clk, reset, load_or_shift(5), q_internal(5));
    U6: d_flip_flop port map(clk, reset, load_or_shift(6), q_internal(6));
    U7: d_flip_flop port map(clk, reset, load_or_shift(7), q_internal(7));

    q <= q_internal;
end Structural;
