project -new fp_mul.prj
add_file fp_mul_pkg.vhd
add_file Normalize_mul.vhd
add_file fp_mul.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
