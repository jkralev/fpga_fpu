-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\alpha32_bit_Acumulator_resource.vhd
-- Created: 2013-03-14 17:42:03
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: alpha32_bit_Acumulator_resource
-- Source Path: ivedsp/32 bit Acumulator resource
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY alpha32_bit_Acumulator_resource IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ACC                               :   IN    std_logic;
        IN_rsvd                           :   IN    std_logic;
        data_in1                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        data_out                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END alpha32_bit_Acumulator_resource;


ARCHITECTURE rtl OF alpha32_bit_Acumulator_resource IS

  -- Signals
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL switch_compare_1_1               : std_logic;
  SIGNAL data_in_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL data_in1_unsigned                : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch1_out1                     : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Integer_Delay2_out1              : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch_out1                      : unsigned(31 DOWNTO 0);  -- uint32

BEGIN
  
  switch_compare_1 <= '1' WHEN ACC >= '1' ELSE
      '0';

  
  switch_compare_1_1 <= '1' WHEN IN_rsvd >= '1' ELSE
      '0';

  data_in_unsigned <= unsigned(data_in);

  data_in1_unsigned <= unsigned(data_in1);

  Integer_Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Integer_Delay2_out1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Integer_Delay2_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Integer_Delay2_process;


  
  Switch_out1 <= Integer_Delay2_out1 WHEN switch_compare_1 = '0' ELSE
      data_in_unsigned;

  
  Switch1_out1 <= Switch_out1 WHEN switch_compare_1_1 = '0' ELSE
      data_in1_unsigned;

  data_out <= std_logic_vector(Switch1_out1);

END rtl;

