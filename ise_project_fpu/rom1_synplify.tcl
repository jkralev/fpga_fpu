project -new rom1.prj
add_file rom1_pkg.vhd
add_file rom1.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
