project -new fp_arith_denormalize.prj
add_file Variable_bitshift.vhd
add_file fp_arith_denormalize.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
