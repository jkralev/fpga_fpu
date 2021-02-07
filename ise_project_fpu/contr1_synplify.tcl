project -new contr1.prj
add_file contr1_pkg.vhd
add_file alpha8bit2uint8.vhd
add_file Handle_command.vhd
add_file contr1.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
