project -new analog_ext.prj
add_file analog_ext_pkg.vhd
add_file Enabled_Subsystem.vhd
add_file Output_register.vhd
add_file Int_to_Single1.vhd
add_file Single_to_Uint.vhd
add_file analog_ext.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
