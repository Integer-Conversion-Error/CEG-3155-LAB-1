library verilog;
use verilog.vl_types.all;
entity eight_bit_reg_shift_r_vlg_check_tst is
    port(
        QR_out          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end eight_bit_reg_shift_r_vlg_check_tst;
