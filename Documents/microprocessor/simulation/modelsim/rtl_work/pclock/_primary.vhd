library verilog;
use verilog.vl_types.all;
entity pclock is
    generic(
        NCYCLES         : integer := 10
    );
    port(
        clk             : in     vl_logic;
        EN              : in     vl_logic;
        clk_out         : out    vl_logic;
        rco_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NCYCLES : constant is 1;
end pclock;
