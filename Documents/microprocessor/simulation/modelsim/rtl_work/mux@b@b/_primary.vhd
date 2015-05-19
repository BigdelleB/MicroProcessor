library verilog;
use verilog.vl_types.all;
entity muxBB is
    port(
        BSEL            : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        CIout           : out    vl_logic_vector(7 downto 0)
    );
end muxBB;
