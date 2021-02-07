-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\Analog_Board_Controller.vhd
-- Created: 2013-04-29 10:18:45
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Analog_Board_Controller
-- Source Path: analog_ext/Analog Board Controller
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.analog_ext_pkg.ALL;

ENTITY Analog_Board_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        sample_tick                       :   IN    std_logic;
        Ready                             :   IN    std_logic;
        Select1                           :   OUT   std_logic;
        Select2                           :   OUT   std_logic;
        Select3                           :   OUT   std_logic;
        Adr                               :   OUT   std_logic_vector(2 DOWNTO 0)  -- ufix3
        );
END Analog_Board_Controller;


ARCHITECTURE rtl OF Analog_Board_Controller IS

  -- Signals
  SIGNAL is_Analog_Board_Controller       : T_state_type_is_Analog_Board_Controller;  -- uint8
  SIGNAL Adr_tmp                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL is_Analog_Board_Controller_next  : T_state_type_is_Analog_Board_Controller;  -- enumerated type (9 enums)

BEGIN
  Analog_Board_Controller_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      is_Analog_Board_Controller <= IN_Wait_Request;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        is_Analog_Board_Controller <= is_Analog_Board_Controller_next;
      END IF;
    END IF;
  END PROCESS Analog_Board_Controller_1_process;

  Analog_Board_Controller_1_output : PROCESS (is_Analog_Board_Controller, sample_tick, Ready)
  BEGIN
    is_Analog_Board_Controller_next <= is_Analog_Board_Controller;
    Select1 <= '0';
    Select2 <= '0';
    Select3 <= '0';
    Adr_tmp <= to_unsigned(0, 3);

    CASE is_Analog_Board_Controller IS
      WHEN IN_ADC1 =>
        IF Ready = '1' THEN 
          is_Analog_Board_Controller_next <= IN_Wait;
        END IF;
      WHEN IN_ADC2 =>
        IF Ready = '1' THEN 
          is_Analog_Board_Controller_next <= IN_Wait4;
        END IF;
      WHEN IN_DAC12 =>
        IF Ready = '1' THEN 
          is_Analog_Board_Controller_next <= IN_Wait6;
        END IF;
      WHEN IN_Wait =>
        IF Ready = '0' THEN 
          is_Analog_Board_Controller_next <= IN_Wait2;
        END IF;
      WHEN IN_Wait2 =>
        Select1 <= '0';
        Select2 <= '1';
        Select3 <= '0';
        Adr_tmp <= to_unsigned(5, 3);
        is_Analog_Board_Controller_next <= IN_ADC2;
      WHEN IN_Wait3 =>
        Select1 <= '0';
        Select2 <= '0';
        Select3 <= '1';
        Adr_tmp <= to_unsigned(7, 3);
        is_Analog_Board_Controller_next <= IN_DAC12;
      WHEN IN_Wait4 =>
        IF Ready = '0' THEN 
          is_Analog_Board_Controller_next <= IN_Wait3;
        END IF;
      WHEN IN_Wait6 =>
        IF Ready = '0' THEN 
          Select1 <= '0';
          Select2 <= '0';
          Select3 <= '0';
          Adr_tmp <= to_unsigned(0, 3);
          is_Analog_Board_Controller_next <= IN_Wait_Request;
        END IF;
      WHEN IN_Wait_Request =>
        IF sample_tick = '1' THEN 
          Select1 <= '1';
          Select2 <= '0';
          Select3 <= '0';
          Adr_tmp <= to_unsigned(6, 3);
          is_Analog_Board_Controller_next <= IN_ADC1;
        END IF;
      WHEN OTHERS => 
        Select1 <= '0';
        Select2 <= '0';
        Select3 <= '0';
        Adr_tmp <= to_unsigned(0, 3);
        is_Analog_Board_Controller_next <= IN_Wait_Request;
    END CASE;

  END PROCESS Analog_Board_Controller_1_output;


  Adr <= std_logic_vector(Adr_tmp);

END rtl;

