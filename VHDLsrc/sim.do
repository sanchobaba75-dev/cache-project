# ModelSim .do file - exact signal layout from waveform

quietly WaveActivateNextPane {} 0
delete wave *

add wave -noupdate /riscv_core_tb/testInfo.test_name
add wave -noupdate /riscv_core_tb/testInfo.lcnt
add wave -noupdate /riscv_core_tb/rst0
add wave -noupdate /riscv_core_tb/clk

add wave -noupdate -divider {IF}
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/pc_next
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/pc_r
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/ifid_pc
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/idex_pc
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/exmem_pc
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/memwb_pc
add wave -noupdate /riscv_core_tb/core/rf_wr_en
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/memwb_rd
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/rf_wdata

add wave -noupdate -divider {ID}
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/imem_rdata
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/rs1_addr
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/rs2_addr

add wave -noupdate -divider {IMEM}
add wave -noupdate /riscv_core_tb/core/imem_cs
add wave -noupdate /riscv_core_tb/core/imem_wr_en
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/imem_addr
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/imem_wdata
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/imem_rdata

add wave -noupdate -divider {EX}
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/idex_rdata1
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/idex_rdata2
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/idex_imm

add wave -noupdate -divider {ALU}
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/alu_a
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/alu_b
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/alu_result
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/shift_result
add wave -noupdate -radix hexadecimal /riscv_core_tb/core/idex_pc

add wave -noupdate -divider {DMEM}
add wave -noupdate /riscv_core_tb/core/dmem_cs

configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 1
configure wave -justifyvalue left
configure wave -timelineunits ns
WaveRestoreZoom {0 ps} {2300 ns}
update
