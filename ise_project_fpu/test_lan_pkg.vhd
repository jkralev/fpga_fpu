-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\test_lan_pkg.vhd
-- Created: 2013-02-08 12:50:01
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE test_lan_pkg IS
  TYPE T_state_type_is_Transmit IS (IN_CRC_end, IN_Data_Ready, IN_Get_Data, IN_Start_tx, IN_Wait10, IN_Wait12, IN_Wait13, IN_Wait14, IN_Wait_for_ev, IN_Wait_for_ev1);
END test_lan_pkg;

