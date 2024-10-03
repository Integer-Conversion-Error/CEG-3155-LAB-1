library verilog;
use verilog.vl_types.all;
entity displayController_vlg_sample_tst is
    port(
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        leftSig         : in     vl_logic;
        rightSig        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end displayController_vlg_sample_tst;
