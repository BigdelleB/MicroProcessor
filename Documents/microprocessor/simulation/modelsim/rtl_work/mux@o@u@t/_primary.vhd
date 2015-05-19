library verilog;
use verilog.vl_types.all;
entity muxOUT is
    port(
        SHIFT           : in     vl_logic_vector(7 downto 0);
        ARITH           : in     vl_logic_vector(7 downto 0);
        LOG             : in     vl_logic_vector(7 downto 0);
        SEL             : in     vl_logic_vector(1 downto 0);
        CIout           : out    vl_logic_vector(7 downto 0);
        C               : out    vl_logic;
        N               : out    vl_logic;
        V               : out    vl_logic;
        Z               : out    vl_logic;
        CNVZSHIFT       : in     vl_logic_vector(3 downto 0);
        CNVZLog         : in     vl_logic_vector(3 downto 0);
        CNVZARITH       : in     vl_logic_vector(3 downto 0)
    );
end muxOUT;
