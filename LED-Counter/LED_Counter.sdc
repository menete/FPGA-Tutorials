

# define the 50 MHz external clock signal
create_clock -name XTAL -period 20ns clock
derive_clock_uncertainty

# with having no dedicated requirements for the LED's - simply assume 0 external delay
set_output_delay -clock XTAL 0 [get_ports LED*]
# but we want all LED signals as such not vary too much
set_max_skew -to [get_ports LED*] 3ns

# as we internally synchronize the reset signal - it's safe to instruct the timing analysis to ignore the path
set_false_path   -from  reset_n
