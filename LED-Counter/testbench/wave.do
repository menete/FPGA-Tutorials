onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TestBench/DUT/reset_n
add wave -noupdate /TestBench/DUT/clock
add wave -noupdate -radix unsigned /TestBench/DUT/LED
add wave -noupdate /TestBench/DUT/reset_sync_n
add wave -noupdate -radix unsigned /TestBench/DUT/Cnt
add wave -noupdate /TestBench/DUT/ResetSynchronizer/reset_n
add wave -noupdate /TestBench/DUT/ResetSynchronizer/reset_sync_n
add wave -noupdate /TestBench/DUT/ResetSynchronizer/rRestSync_m
add wave -noupdate /TestBench/DUT/ResetSynchronizer/rRestSync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {236062 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 204
configure wave -valuecolwidth 190
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {3550314 ps}
