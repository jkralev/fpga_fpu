project -new test_rx.prj
add_file test_rx_pkg.vhd
add_file int2bit.vhd
add_file alpha4bit2uint8.vhd
add_file Receive.vhd
add_file test_rx.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
