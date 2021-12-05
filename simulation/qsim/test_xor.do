onerror {quit -f}
vlib work
vlog -work work test_xor.vo
vlog -work work test_xor.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.test_xor_int_vlg_vec_tst
vcd file -direction test_xor.msim.vcd
vcd add -internal test_xor_int_vlg_vec_tst/*
vcd add -internal test_xor_int_vlg_vec_tst/i1/*
add wave /*
run -all
