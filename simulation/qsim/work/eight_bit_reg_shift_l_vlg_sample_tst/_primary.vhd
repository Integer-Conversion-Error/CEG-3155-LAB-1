library verilog;
use verilog.vl_types.all;
entity eight_bit_reg_shift_l_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        D_in            : in     vl_logic_vector(7 downto 0);
        LD              : in     vl_logic;
        SHL             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end eight_bit_reg_shift_l_vlg_sample_tst;
