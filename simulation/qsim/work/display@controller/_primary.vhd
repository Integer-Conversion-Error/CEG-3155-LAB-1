library verilog;
use verilog.vl_types.all;
entity displayController is
    port(
        rightSig        : in     vl_logic;
        leftSig         : in     vl_logic;
        GClock          : in     vl_logic;
        GReset          : in     vl_logic;
        DisplayOut      : out    vl_logic_vector(7 downto 0)
    );
end displayController;
