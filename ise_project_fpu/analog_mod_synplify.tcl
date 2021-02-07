project -new analog_mod.prj
add_file analog_mod_pkg.vhd
add_file Subsystem.vhd
add_file Convert_Integer_to_Single.vhd
add_file DAC_Init.vhd
add_file Handle_Timer_Event.vhd
add_file analog_mod.vhd
set_option -technology VIRTEX4
set_option -part XC4VSX35
set_option -synthesis_onoff_pragma 0
set_option -frequency auto
project -run synthesis
