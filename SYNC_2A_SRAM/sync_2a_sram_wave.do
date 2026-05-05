onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sync_2a_tb/s1/clk
add wave -noupdate /sync_2a_tb/s1/cs
add wave -noupdate /sync_2a_tb/s1/rAddr
add wave -noupdate /sync_2a_tb/s1/rdata
add wave -noupdate /sync_2a_tb/s1/wAddr
add wave -noupdate /sync_2a_tb/s1/wr_en
add wave -noupdate /sync_2a_tb/s1/wdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
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
WaveRestoreZoom {0 ns} {1958 ns}
