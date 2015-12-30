

puts "Choose Evaluation Board"
puts ""
puts "  1) DE0-Nano"
puts "  2) DE0-CV"
puts ""
puts ":> "
flush stdout
#set board [gets stdin]

set board "2"

puts "Decision $board"

switch -exact $board {
    "1" {
        # DE0-Nano assignments
        puts "Configuring I/O for DE0-Nano Board"
        set_global_assignment -name FAMILY "Cyclone IV E"
        set_global_assignment -name DEVICE EP4CE22F17C6
        set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
        set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3 V LVTTL"
        set_location_assignment PIN_J15 -to reset_n
        set_location_assignment PIN_R8 -to clock
        set_location_assignment PIN_L3 -to LED[7]
        set_location_assignment PIN_B1 -to LED[6]
        set_location_assignment PIN_F3 -to LED[5]
        set_location_assignment PIN_D1 -to LED[4]
        set_location_assignment PIN_A11 -to LED[3]
        set_location_assignment PIN_B13 -to LED[2]
        set_location_assignment PIN_A13 -to LED[1]
        set_location_assignment PIN_A15 -to LED[0]
    }    
    2 {
        # DE0-CV assignments
        puts "Configuring I/O for DE0-CV Board"
        set_global_assignment -name FAMILY "Cyclone V E"
        set_global_assignment -name DEVICE 5CEBA4F23C7
        set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.1V
        set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3 V LVTTL"
        set_location_assignment PIN_P22 -to reset_n
        set_location_assignment PIN_M9 -to clock
        set_location_assignment PIN_AA2 -to LED[0]
        set_location_assignment PIN_AA1 -to LED[1]
        set_location_assignment PIN_W2  -to LED[2]
        set_location_assignment PIN_Y3  -to LED[3]
        set_location_assignment PIN_N2  -to LED[4]
        set_location_assignment PIN_N1  -to LED[5]
        set_location_assignment PIN_U2  -to LED[6]
        set_location_assignment PIN_U1  -to LED[7]
        set_location_assignment PIN_L2  -to LED[8]
        set_location_assignment PIN_L1  -to LED[9]    
      }
    default {
        puts "Unknown board - doing nothing"
    }
}



