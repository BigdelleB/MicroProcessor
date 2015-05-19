library verilog;
use verilog.vl_types.all;
entity MuxD is
    port(
        md              : in     vl_logic;
        Din             : in     vl_logic_vector(7 downto 0);
        DataD           : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end MuxD;
