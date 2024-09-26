library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF IS
    PORT(
        i_d      : IN  STD_LOGIC;        
        i_clock  : IN  STD_LOGIC;        
        o_q      : OUT STD_LOGIC;        
        o_qBar   : OUT STD_LOGIC         
    );
END DFF;

ARCHITECTURE structural OF DFF IS
    SIGNAL int_q, int_qBar : STD_LOGIC;
    SIGNAL int_dBar        : STD_LOGIC;
    SIGNAL s_gatedClock, r_gatedClock : STD_LOGIC;

    COMPONENT srLatch
        PORT(
            i_set, i_reset : IN  STD_LOGIC;
            o_q, o_qBar    : OUT STD_LOGIC
        );
    END COMPONENT;
    
BEGIN

    int_dBar <= NOT i_d;

    s_gatedClock <= i_d AND i_clock;      
    r_gatedClock <= int_dBar AND i_clock; 

    U1: srLatch PORT MAP (
        i_set  => s_gatedClock,
        i_reset => r_gatedClock,
        o_q    => int_q,
        o_qBar => int_qBar
    );

    o_q    <= int_q;
    o_qBar <= int_qBar;

END structural;
