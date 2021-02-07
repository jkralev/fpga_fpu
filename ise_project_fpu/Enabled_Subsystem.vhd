-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\Enabled_Subsystem.vhd
-- Created: 2013-04-29 19:25:11
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Enabled_Subsystem
-- Source Path: analog_ext/Enabled Subsystem
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Enabled_Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        In1                               :   IN    std_logic;
        Enable                            :   IN    std_logic;
        Out1                              :   OUT   std_logic_vector(0 TO 11)  -- boolean [12]
        );
END Enabled_Subsystem;


ARCHITECTURE rtl OF Enabled_Subsystem IS

  -- Signals
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Enable_out2                      : std_logic;
  SIGNAL Tapped_Delay_reg                 : std_logic_vector(0 TO 11);  -- ufix1 [12]
  SIGNAL Tapped_Delay_out1                : std_logic_vector(0 TO 11);  -- boolean [12]
  SIGNAL Tapped_Delay_out1_last_value     : std_logic_vector(0 TO 11);  -- boolean [12]
  SIGNAL Tapped_Delay_out1_bypass         : std_logic_vector(0 TO 11);  -- boolean [12]

BEGIN
  Enable_out2 <= Enable;

  enb_gated <= Enable_out2 AND enb;

  Tapped_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Tapped_Delay_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Tapped_Delay_reg(11) <= In1;
        Tapped_Delay_reg(0 TO 10) <= Tapped_Delay_reg(1 TO 11);
      END IF;
    END IF;
  END PROCESS Tapped_Delay_process;

  Tapped_Delay_out1 <= Tapped_Delay_reg;

  Out1_bypass_process: PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Tapped_Delay_out1_last_value <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF enb_gated = '1' THEN
        Tapped_Delay_out1_last_value <= Tapped_Delay_out1;
      END IF;
    END IF;
  END PROCESS Out1_bypass_process;

  Tapped_Delay_out1_bypass <= Tapped_Delay_out1 WHEN Enable_out2 = '1' ELSE
                              Tapped_Delay_out1_last_value;

  Out1 <= Tapped_Delay_out1_bypass;

END rtl;

