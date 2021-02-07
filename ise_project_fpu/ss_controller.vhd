-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_Test\ise_project_1\ss_controller.vhd
-- Created: 2012-11-05 22:45:21
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ss_controller
-- Source Path: ss_controller
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ss_controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        Tick                              :   IN    std_logic;
        u1                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        u2                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        u3                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        u4                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        u5                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        u6                                :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        ce_out                            :   OUT   std_logic;
        y1                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        y2                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        y3                                :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
        y4                                :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
        );
END ss_controller;


ARCHITECTURE rtl OF ss_controller IS

  -- Component Declarations
  COMPONENT Vectical_speed_tracking
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  COMPONENT Roll_speed_compensator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  COMPONENT Side_speed_tracking
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  COMPONENT Pitch_speed_compensator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  COMPONENT Forward_speed_tracking
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  COMPONENT Yaw_speed
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Tick                            :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En20
          y                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En20
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Vectical_speed_tracking
    USE ENTITY work.Vectical_speed_tracking(rtl);

  FOR ALL : Roll_speed_compensator
    USE ENTITY work.Roll_speed_compensator(rtl);

  FOR ALL : Side_speed_tracking
    USE ENTITY work.Side_speed_tracking(rtl);

  FOR ALL : Pitch_speed_compensator
    USE ENTITY work.Pitch_speed_compensator(rtl);

  FOR ALL : Forward_speed_tracking
    USE ENTITY work.Forward_speed_tracking(rtl);

  FOR ALL : Yaw_speed
    USE ENTITY work.Yaw_speed(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL Integer_Delay4_out1              : std_logic;
  SIGNAL Vectical_speed_tracking_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL u4_signed                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Gain_mul_temp                    : signed(63 DOWNTO 0);  -- sfix64_En51
  SIGNAL Gain_out1                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL u2_signed                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Gain1_mul_temp                   : signed(63 DOWNTO 0);  -- sfix64_En51
  SIGNAL Gain1_out1                       : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Roll_speed_compensator_out1      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Roll_speed_compensator_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Side_speed_tracking_out1         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Side_speed_tracking_out1_signed  : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Add_out1                         : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL u5_signed                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Gain2_mul_temp                   : signed(63 DOWNTO 0);  -- sfix64_En51
  SIGNAL Gain2_out1                       : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Pitch_speed_compensator_out1     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Pitch_speed_compensator_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Forward_speed_tracking_out1      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Forward_speed_tracking_out1_signed : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Add1_out1                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL u6_signed                        : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Gain3_mul_temp                   : signed(63 DOWNTO 0);  -- sfix64_En51
  SIGNAL Gain3_out1                       : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Yaw_speed_out1                   : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_Vectical_speed_tracking : Vectical_speed_tracking
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => u3,  -- sfix32_En20
              y => Vectical_speed_tracking_out1  -- sfix32_En20
              );

  u_Roll_speed_compensator : Roll_speed_compensator
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => std_logic_vector(Gain_out1),  -- sfix32_En20
              y => Roll_speed_compensator_out1  -- sfix32_En20
              );

  u_Side_speed_tracking : Side_speed_tracking
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => std_logic_vector(Gain1_out1),  -- sfix32_En20
              y => Side_speed_tracking_out1  -- sfix32_En20
              );

  u_Pitch_speed_compensator : Pitch_speed_compensator
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => std_logic_vector(Gain2_out1),  -- sfix32_En20
              y => Pitch_speed_compensator_out1  -- sfix32_En20
              );

  u_Forward_speed_tracking : Forward_speed_tracking
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => u1,  -- sfix32_En20
              y => Forward_speed_tracking_out1  -- sfix32_En20
              );

  u_Yaw_speed : Yaw_speed
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Tick => Integer_Delay4_out1,
              u => std_logic_vector(Gain3_out1),  -- sfix32_En20
              y => Yaw_speed_out1  -- sfix32_En20
              );

  enb <= clk_enable;

  Integer_Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Integer_Delay4_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Integer_Delay4_out1 <= Tick;
      END IF;
    END IF;
  END PROCESS Integer_Delay4_process;


  y1 <= Vectical_speed_tracking_out1;

  u4_signed <= signed(u4);

  -- CSD Encoding (2147483648) : 010000000000000000000000000000000; Cost (Adders) = 0
  Gain_mul_temp <=  - (resize(u4_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64));
  Gain_out1 <= Gain_mul_temp(62 DOWNTO 31);

  u2_signed <= signed(u2);

  -- CSD Encoding (2147483648) : 010000000000000000000000000000000; Cost (Adders) = 0
  Gain1_mul_temp <=  - (resize(u2_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64));
  Gain1_out1 <= Gain1_mul_temp(62 DOWNTO 31);

  Roll_speed_compensator_out1_signed <= signed(Roll_speed_compensator_out1);

  Side_speed_tracking_out1_signed <= signed(Side_speed_tracking_out1);

  Add_out1 <= Roll_speed_compensator_out1_signed + Side_speed_tracking_out1_signed;

  y2 <= std_logic_vector(Add_out1);

  u5_signed <= signed(u5);

  -- CSD Encoding (2147483648) : 010000000000000000000000000000000; Cost (Adders) = 0
  Gain2_mul_temp <=  - (resize(u5_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64));
  Gain2_out1 <= Gain2_mul_temp(62 DOWNTO 31);

  Pitch_speed_compensator_out1_signed <= signed(Pitch_speed_compensator_out1);

  Forward_speed_tracking_out1_signed <= signed(Forward_speed_tracking_out1);

  Add1_out1 <= Pitch_speed_compensator_out1_signed + Forward_speed_tracking_out1_signed;

  y3 <= std_logic_vector(Add1_out1);

  u6_signed <= signed(u6);

  -- CSD Encoding (2147483648) : 010000000000000000000000000000000; Cost (Adders) = 0
  Gain3_mul_temp <=  - (resize(u6_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 64));
  Gain3_out1 <= Gain3_mul_temp(62 DOWNTO 31);

  y4 <= Yaw_speed_out1;

  ce_out <= clk_enable;

END rtl;

