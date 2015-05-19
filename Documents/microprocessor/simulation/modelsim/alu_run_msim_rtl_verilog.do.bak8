transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/logical.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/muxCI.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/hex_to_seven_seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/muxB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/muxOUT.v}

vlog -vlog01compat -work work +incdir+C:/Users/Stephanie/Desktop/Sophomore\ Spring/ECE\ 2300/lab5 {C:/Users/Stephanie/Desktop/Sophomore Spring/ECE 2300/lab5/alu_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  alu_test

add wave *
view structure
view signals
run -all
