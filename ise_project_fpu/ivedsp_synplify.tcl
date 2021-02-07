project -new ivedsp.prj
add_file ivedsp_pkg.vhd
add_file alpha12_bit_Program_Counter.vhd
add_file alpha32_bit_Acumulator_resource.vhd
add_file In_Port_Control.vhd
add_file Register_rsvd.vhd
add_file Register1.vhd
add_file Rise_detect.vhd
add_file Rise_detect1.vhd
add_file IN_OUT_Controller.vhd
add_file Instruction_Decoder.vhd
add_file ivedsp.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
