library verilog;
use verilog.vl_types.all;
entity eight_bit_reg_shift_r is
    port(
        CLK             : in     vl_logic;
        LD              : in     vl_logic;
        SHR             : in     vl_logic;
        D_in            : in     vl_logic_vector(7 downto 0);
        QR_out          : out    vl_logic_vector(7 downto 0)
    );
end eight_bit_reg_shift_r;
