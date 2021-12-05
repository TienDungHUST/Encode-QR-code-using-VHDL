library verilog;
use verilog.vl_types.all;
entity test_xor_int is
    port(
        inp1            : in     vl_logic_vector(7 downto 0);
        inp2            : in     vl_logic_vector(7 downto 0);
        outp            : out    vl_logic_vector(31 downto 0)
    );
end test_xor_int;
