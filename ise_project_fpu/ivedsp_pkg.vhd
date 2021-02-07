-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\ivedsp_pkg.vhd
-- Created: 2013-03-14 17:42:03
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE ivedsp_pkg IS
  TYPE vector_of_std_logic_vector8 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(7 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
END ivedsp_pkg;

