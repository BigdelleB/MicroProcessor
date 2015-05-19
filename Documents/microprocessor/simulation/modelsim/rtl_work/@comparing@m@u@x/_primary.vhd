library verilog;
use verilog.vl_types.all;
entity ComparingMUX is
    port(
        BS              : in     vl_logic_vector(2 downto 0);
        Z               : in     vl_logic;
        N               : in     vl_logic;
        MP              : out    vl_logic
    );
end ComparingMUX;
