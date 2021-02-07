project -new programmer.prj
add_file programmer_pkg.vhd
add_file Programmer_block.vhd
add_file programmer.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
