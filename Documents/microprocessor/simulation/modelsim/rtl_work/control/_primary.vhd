library verilog;
use verilog.vl_types.all;
entity control is
    port(
        OP              : in     vl_logic_vector(2 downto 0);
        CISEL           : out    vl_logic;
        BSEL            : out    vl_logic;
        OSEL            : out    vl_logic_vector(1 downto 0);
        SHIFT_LA        : out    vl_logic;
        SHIFT_LR        : out    vl_logic;
        LOGICAL_OP      : out    vl_logic
    );
end control;
