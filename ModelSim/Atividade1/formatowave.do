onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Robo_TB/N
add wave -noupdate /Robo_TB/S
add wave -noupdate /Robo_TB/L
add wave -noupdate /Robo_TB/O
add wave -noupdate /Robo_TB/clock
add wave -noupdate /Robo_TB/reset
add wave -noupdate /Robo_TB/head
add wave -noupdate /Robo_TB/left
add wave -noupdate /Robo_TB/avancar
add wave -noupdate /Robo_TB/girar
add wave -noupdate /Robo_TB/Mapa
add wave -noupdate /Robo_TB/Linha_Mapa
add wave -noupdate /Robo_TB/Linha_Robo
add wave -noupdate /Robo_TB/Coluna_Robo
add wave -noupdate /Robo_TB/Orientacao_Robo
add wave -noupdate /Robo_TB/Qtd_Movimentos
add wave -noupdate /Robo_TB/String_Orientacao_Robo
add wave -noupdate /Robo_TB/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 91
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
WaveRestoreZoom {5019 ns} {5263 ns}
