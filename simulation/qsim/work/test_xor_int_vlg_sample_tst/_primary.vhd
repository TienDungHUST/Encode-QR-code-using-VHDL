library verilog;
use verilog.vl_types.all;
entity test_xor_int_vlg_sample_tst is
    port(
        inp1            : in     vl_logic_vector(7 downto 0);
        inp2            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end test_xor_int_vlg_sample_tst;
