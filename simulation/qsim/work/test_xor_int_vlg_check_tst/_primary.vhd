library verilog;
use verilog.vl_types.all;
entity test_xor_int_vlg_check_tst is
    port(
        outp            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end test_xor_int_vlg_check_tst;
