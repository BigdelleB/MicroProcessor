transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/lab5iram2B.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/muxOUT.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/lab5.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/lab5dram.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/logical.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/muxCI.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/hex_to_seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/var_clk.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/MuxB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/MuxD.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/muxBB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/halt.v}
vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/ComparingMUX.v}

vlog -vlog01compat -work work +incdir+C:/Users/Brian/Downloads/lab5 {C:/Users/Brian/Downloads/lab5/lab5_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  lab5_test

add wave *
view structure
view signals
run -all
