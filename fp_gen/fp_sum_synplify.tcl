project -new fp_sum.prj
add_file fp_sum_pkg.vhd
add_file Normalize.vhd
add_file Variable_bitshift.vhd
add_file fp_sum.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
