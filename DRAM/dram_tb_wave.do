onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dram_tb/s1/ma
add wave -noupdate /dram_tb/s1/ras0
add wave -noupdate /dram_tb/s1/cas0
add wave -noupdate /dram_tb/s1/we0
add wave -noupdate /dram_tb/s1/oe0
add wave -noupdate /dram_tb/s1/dq
add wave -noupdate /dram_tb/s1/completeAddr_s
add wave -noupdate /dram_tb/s1/read_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {443 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ns} {2100 ns}
