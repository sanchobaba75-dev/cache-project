onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dram_cntl_tb/g1/rst0
add wave -noupdate /dram_cntl_tb/g1/clk
add wave -noupdate /dram_cntl_tb/g1/start
add wave -noupdate /dram_cntl_tb/g1/size
add wave -noupdate /dram_cntl_tb/g1/addr
add wave -noupdate /dram_cntl_tb/g1/acc_type
add wave -noupdate /dram_cntl_tb/g1/r1w0
add wave -noupdate /dram_cntl_tb/g1/clk
add wave -noupdate /dram_cntl_tb/g1/state_r
add wave -noupdate /dram_cntl_tb/g1/addr_cnt_r
add wave -noupdate /dram_cntl_tb/g1/ras_0
add wave -noupdate /dram_cntl_tb/g1/cas_0
add wave -noupdate /dram_cntl_tb/g1/we_0
add wave -noupdate /dram_cntl_tb/g1/mux_addr
add wave -noupdate /dram_cntl_tb/g1/ras_r
add wave -noupdate /dram_cntl_tb/g1/cas_r
add wave -noupdate /dram_cntl_tb/g1/we_0_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1958 ps}
