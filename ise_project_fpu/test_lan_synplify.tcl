project -new test_lan.prj
add_file test_lan_pkg.vhd
add_file Transmit.vhd
add_file test_lan.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
