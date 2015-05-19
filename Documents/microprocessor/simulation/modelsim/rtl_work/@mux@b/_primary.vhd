library verilog;
use verilog.vl_types.all;
entity MuxB is
    port(
        mb              : in     vl_logic;
        IMM             : in     vl_logic_vector(7 downto 0);
        DataB           : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end MuxB;
