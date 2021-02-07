project -new int2single.prj
add_file int2single_pkg.vhd
add_file Int_to_Single1.vhd
add_file int2single.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
