-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_Test\ise_project_1\Fixed_state_space_FPGA_controller.vhd
-- Created: 2012-11-04 23:05:07
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Fixed_state_space_FPGA_controller
-- Source Path: ss_controller/Fixed state space FPGA controller
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ss_controller_pkg.ALL;

ENTITY Fixed_state_space_FPGA_controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Tick                              :   IN    std_logic;
        u                                 :   IN    vector_of_std_logic_vector32(0 TO 5);  -- sfix32_En20 [6]
        y                                 :   OUT   vector_of_std_logic_vector32(0 TO 3)  -- sfix32_En20 [4]
        );
END Fixed_state_space_FPGA_controller;


ARCHITECTURE rtl OF Fixed_state_space_FPGA_controller IS

  -- Component Declarations
  COMPONENT MAC_instruction
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          mul1                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En16
          mul2                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En16
          reset_1                         :   IN    std_logic;
          result                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En16
          );
  END COMPONENT;

  COMPONENT MAC_instruction_Controller
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          sys                             :   IN    vector_of_std_logic_vector32(0 TO 194);  -- sfix32_En16 [195]
          xu                              :   IN    vector_of_std_logic_vector32(0 TO 14);  -- sfix32_En16 [15]
          result                          :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En16
          Model_Tick                      :   IN    std_logic;
          mul1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En16
          mul2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En16
          reset_1                         :   OUT   std_logic;
          xy                              :   OUT   vector_of_std_logic_vector32(0 TO 12)  -- sfix32_En16 [13]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : MAC_instruction
    USE ENTITY work.MAC_instruction(rtl);

  FOR ALL : MAC_instruction_Controller
    USE ENTITY work.MAC_instruction_Controller(rtl);

  -- Signals
  SIGNAL u_signed                         : vector_of_signed32(0 TO 5);  -- sfix32_En20 [6]
  SIGNAL Data_Type_Conversion11_out1      : vector_of_signed32(0 TO 5);  -- sfix32_En16 [6]
  SIGNAL Constant5_out1                   : vector_of_signed32(0 TO 194);  -- sfix32_En16 [195]
  SIGNAL Constant5_out1_1                 : vector_of_std_logic_vector32(0 TO 194);  -- ufix32 [195]
  SIGNAL MAC_instruction_Controller_out1  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MAC_instruction_Controller_out2  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL MAC_instruction_Controller_out3  : std_logic;
  SIGNAL MAC_instruction_out1             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL x_old_out1                       : vector_of_signed32(0 TO 8);  -- sfix32_En16 [9]
  SIGNAL MAC_instruction_Controller_out4  : vector_of_std_logic_vector32(0 TO 12);  -- ufix32 [13]
  SIGNAL x_new_out1                       : vector_of_signed32(0 TO 8);  -- sfix32_En16 [9]
  SIGNAL Mux_out1                         : vector_of_signed32(0 TO 14);  -- sfix32_En16 [15]
  SIGNAL Mux_out1_1                       : vector_of_std_logic_vector32(0 TO 14);  -- ufix32 [15]
  SIGNAL y_new_out1                       : vector_of_signed32(0 TO 3);  -- sfix32_En16 [4]
  SIGNAL Data_Type_Conversion1_out1       : vector_of_signed32(0 TO 3);  -- sfix32_En20 [4]

BEGIN
  u_MAC_instruction : MAC_instruction
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              mul1 => MAC_instruction_Controller_out1,  -- sfix32_En16
              mul2 => MAC_instruction_Controller_out2,  -- sfix32_En16
              reset_1 => MAC_instruction_Controller_out3,
              result => MAC_instruction_out1  -- sfix32_En16
              );

  u_MAC_instruction_Controller : MAC_instruction_Controller
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              sys => Constant5_out1_1,  -- sfix32_En16 [195]
              xu => Mux_out1_1,  -- sfix32_En16 [15]
              result => MAC_instruction_out1,  -- sfix32_En16
              Model_Tick => Tick,
              mul1 => MAC_instruction_Controller_out1,  -- sfix32_En16
              mul2 => MAC_instruction_Controller_out2,  -- sfix32_En16
              reset_1 => MAC_instruction_Controller_out3,
              xy => MAC_instruction_Controller_out4  -- sfix32_En16 [13]
              );

  outputgen3: FOR k IN 0 TO 5 GENERATE
    u_signed(k) <= signed(u(k));
  END GENERATE;


  Data_Type_Conversion11_out1_gen: FOR ii IN 0 TO 5 GENERATE
    Data_Type_Conversion11_out1(ii) <= resize(u_signed(ii)(31 DOWNTO 4), 32);
  END GENERATE Data_Type_Conversion11_out1_gen;


  Constant5_out1(0) <= to_signed(65536, 32);
  Constant5_out1(1) <= to_signed(0, 32);
  Constant5_out1(2) <= to_signed(0, 32);
  Constant5_out1(3) <= to_signed(0, 32);
  Constant5_out1(4) <= to_signed(0, 32);
  Constant5_out1(5) <= to_signed(0, 32);
  Constant5_out1(6) <= to_signed(0, 32);
  Constant5_out1(7) <= to_signed(0, 32);
  Constant5_out1(8) <= to_signed(0, 32);
  Constant5_out1(9) <= to_signed(0, 32);
  Constant5_out1(10) <= to_signed(0, 32);
  Constant5_out1(11) <= to_signed(65536, 32);
  Constant5_out1(12) <= to_signed(0, 32);
  Constant5_out1(13) <= to_signed(0, 32);
  Constant5_out1(14) <= to_signed(0, 32);
  Constant5_out1(15) <= to_signed(0, 32);
  Constant5_out1(16) <= to_signed(65536, 32);
  Constant5_out1(17) <= to_signed(0, 32);
  Constant5_out1(18) <= to_signed(0, 32);
  Constant5_out1(19) <= to_signed(0, 32);
  Constant5_out1(20) <= to_signed(0, 32);
  Constant5_out1(21) <= to_signed(0, 32);
  Constant5_out1(22) <= to_signed(0, 32);
  Constant5_out1(23) <= to_signed(0, 32);
  Constant5_out1(24) <= to_signed(0, 32);
  Constant5_out1(25) <= to_signed(0, 32);
  Constant5_out1(26) <= to_signed(0, 32);
  Constant5_out1(27) <= to_signed(-65536, 32);
  Constant5_out1(28) <= to_signed(0, 32);
  Constant5_out1(29) <= to_signed(0, 32);
  Constant5_out1(30) <= to_signed(0, 32);
  Constant5_out1(31) <= to_signed(0, 32);
  Constant5_out1(32) <= to_signed(87379, 32);
  Constant5_out1(33) <= to_signed(-37835, 32);
  Constant5_out1(34) <= to_signed(0, 32);
  Constant5_out1(35) <= to_signed(0, 32);
  Constant5_out1(36) <= to_signed(0, 32);
  Constant5_out1(37) <= to_signed(0, 32);
  Constant5_out1(38) <= to_signed(0, 32);
  Constant5_out1(39) <= to_signed(0, 32);
  Constant5_out1(40) <= to_signed(-65536, 32);
  Constant5_out1(41) <= to_signed(0, 32);
  Constant5_out1(42) <= to_signed(0, 32);
  Constant5_out1(43) <= to_signed(0, 32);
  Constant5_out1(44) <= to_signed(0, 32);
  Constant5_out1(45) <= to_signed(0, 32);
  Constant5_out1(46) <= to_signed(0, 32);
  Constant5_out1(47) <= to_signed(37835, 32);
  Constant5_out1(48) <= to_signed(0, 32);
  Constant5_out1(49) <= to_signed(0, 32);
  Constant5_out1(50) <= to_signed(0, 32);
  Constant5_out1(51) <= to_signed(0, 32);
  Constant5_out1(52) <= to_signed(0, 32);
  Constant5_out1(53) <= to_signed(0, 32);
  Constant5_out1(54) <= to_signed(0, 32);
  Constant5_out1(55) <= to_signed(0, 32);
  Constant5_out1(56) <= to_signed(0, 32);
  Constant5_out1(57) <= to_signed(0, 32);
  Constant5_out1(58) <= to_signed(0, 32);
  Constant5_out1(59) <= to_signed(0, 32);
  Constant5_out1(60) <= to_signed(0, 32);
  Constant5_out1(61) <= to_signed(0, 32);
  Constant5_out1(62) <= to_signed(0, 32);
  Constant5_out1(63) <= to_signed(0, 32);
  Constant5_out1(64) <= to_signed(65536, 32);
  Constant5_out1(65) <= to_signed(0, 32);
  Constant5_out1(66) <= to_signed(0, 32);
  Constant5_out1(67) <= to_signed(0, 32);
  Constant5_out1(68) <= to_signed(0, 32);
  Constant5_out1(69) <= to_signed(0, 32);
  Constant5_out1(70) <= to_signed(0, 32);
  Constant5_out1(71) <= to_signed(0, 32);
  Constant5_out1(72) <= to_signed(0, 32);
  Constant5_out1(73) <= to_signed(-65536, 32);
  Constant5_out1(74) <= to_signed(0, 32);
  Constant5_out1(75) <= to_signed(0, 32);
  Constant5_out1(76) <= to_signed(0, 32);
  Constant5_out1(77) <= to_signed(0, 32);
  Constant5_out1(78) <= to_signed(0, 32);
  Constant5_out1(79) <= to_signed(0, 32);
  Constant5_out1(80) <= to_signed(87379, 32);
  Constant5_out1(81) <= to_signed(-37835, 32);
  Constant5_out1(82) <= to_signed(0, 32);
  Constant5_out1(83) <= to_signed(0, 32);
  Constant5_out1(84) <= to_signed(65536, 32);
  Constant5_out1(85) <= to_signed(0, 32);
  Constant5_out1(86) <= to_signed(0, 32);
  Constant5_out1(87) <= to_signed(0, 32);
  Constant5_out1(88) <= to_signed(0, 32);
  Constant5_out1(89) <= to_signed(0, 32);
  Constant5_out1(90) <= to_signed(0, 32);
  Constant5_out1(91) <= to_signed(0, 32);
  Constant5_out1(92) <= to_signed(0, 32);
  Constant5_out1(93) <= to_signed(0, 32);
  Constant5_out1(94) <= to_signed(0, 32);
  Constant5_out1(95) <= to_signed(37835, 32);
  Constant5_out1(96) <= to_signed(0, 32);
  Constant5_out1(97) <= to_signed(0, 32);
  Constant5_out1(98) <= to_signed(0, 32);
  Constant5_out1(99) <= to_signed(0, 32);
  Constant5_out1(100) <= to_signed(0, 32);
  Constant5_out1(101) <= to_signed(0, 32);
  Constant5_out1(102) <= to_signed(0, 32);
  Constant5_out1(103) <= to_signed(0, 32);
  Constant5_out1(104) <= to_signed(0, 32);
  Constant5_out1(105) <= to_signed(0, 32);
  Constant5_out1(106) <= to_signed(0, 32);
  Constant5_out1(107) <= to_signed(0, 32);
  Constant5_out1(108) <= to_signed(0, 32);
  Constant5_out1(109) <= to_signed(0, 32);
  Constant5_out1(110) <= to_signed(0, 32);
  Constant5_out1(111) <= to_signed(0, 32);
  Constant5_out1(112) <= to_signed(131072, 32);
  Constant5_out1(113) <= to_signed(-65536, 32);
  Constant5_out1(114) <= to_signed(0, 32);
  Constant5_out1(115) <= to_signed(0, 32);
  Constant5_out1(116) <= to_signed(0, 32);
  Constant5_out1(117) <= to_signed(0, 32);
  Constant5_out1(118) <= to_signed(0, 32);
  Constant5_out1(119) <= to_signed(-65536, 32);
  Constant5_out1(120) <= to_signed(0, 32);
  Constant5_out1(121) <= to_signed(0, 32);
  Constant5_out1(122) <= to_signed(0, 32);
  Constant5_out1(123) <= to_signed(0, 32);
  Constant5_out1(124) <= to_signed(0, 32);
  Constant5_out1(125) <= to_signed(0, 32);
  Constant5_out1(126) <= to_signed(0, 32);
  Constant5_out1(127) <= to_signed(65536, 32);
  Constant5_out1(128) <= to_signed(0, 32);
  Constant5_out1(129) <= to_signed(0, 32);
  Constant5_out1(130) <= to_signed(0, 32);
  Constant5_out1(131) <= to_signed(0, 32);
  Constant5_out1(132) <= to_signed(0, 32);
  Constant5_out1(133) <= to_signed(0, 32);
  Constant5_out1(134) <= to_signed(0, 32);
  Constant5_out1(135) <= to_signed(197, 32);
  Constant5_out1(136) <= to_signed(0, 32);
  Constant5_out1(137) <= to_signed(0, 32);
  Constant5_out1(138) <= to_signed(0, 32);
  Constant5_out1(139) <= to_signed(0, 32);
  Constant5_out1(140) <= to_signed(0, 32);
  Constant5_out1(141) <= to_signed(0, 32);
  Constant5_out1(142) <= to_signed(0, 32);
  Constant5_out1(143) <= to_signed(0, 32);
  Constant5_out1(144) <= to_signed(0, 32);
  Constant5_out1(145) <= to_signed(0, 32);
  Constant5_out1(146) <= to_signed(9830, 32);
  Constant5_out1(147) <= to_signed(0, 32);
  Constant5_out1(148) <= to_signed(0, 32);
  Constant5_out1(149) <= to_signed(0, 32);
  Constant5_out1(150) <= to_signed(0, 32);
  Constant5_out1(151) <= to_signed(1, 32);
  Constant5_out1(152) <= to_signed(-64163, 32);
  Constant5_out1(153) <= to_signed(111146, 32);
  Constant5_out1(154) <= to_signed(0, 32);
  Constant5_out1(155) <= to_signed(0, 32);
  Constant5_out1(156) <= to_signed(0, 32);
  Constant5_out1(157) <= to_signed(0, 32);
  Constant5_out1(158) <= to_signed(0, 32);
  Constant5_out1(159) <= to_signed(0, 32);
  Constant5_out1(160) <= to_signed(-98304, 32);
  Constant5_out1(161) <= to_signed(0, 32);
  Constant5_out1(162) <= to_signed(-66, 32);
  Constant5_out1(163) <= to_signed(0, 32);
  Constant5_out1(164) <= to_signed(0, 32);
  Constant5_out1(165) <= to_signed(0, 32);
  Constant5_out1(166) <= to_signed(0, 32);
  Constant5_out1(167) <= to_signed(0, 32);
  Constant5_out1(168) <= to_signed(0, 32);
  Constant5_out1(169) <= to_signed(0, 32);
  Constant5_out1(170) <= to_signed(-64163, 32);
  Constant5_out1(171) <= to_signed(111146, 32);
  Constant5_out1(172) <= to_signed(0, 32);
  Constant5_out1(173) <= to_signed(0, 32);
  Constant5_out1(174) <= to_signed(98304, 32);
  Constant5_out1(175) <= to_signed(0, 32);
  Constant5_out1(176) <= to_signed(0, 32);
  Constant5_out1(177) <= to_signed(0, 32);
  Constant5_out1(178) <= to_signed(-66, 32);
  Constant5_out1(179) <= to_signed(0, 32);
  Constant5_out1(180) <= to_signed(0, 32);
  Constant5_out1(181) <= to_signed(0, 32);
  Constant5_out1(182) <= to_signed(0, 32);
  Constant5_out1(183) <= to_signed(0, 32);
  Constant5_out1(184) <= to_signed(0, 32);
  Constant5_out1(185) <= to_signed(0, 32);
  Constant5_out1(186) <= to_signed(0, 32);
  Constant5_out1(187) <= to_signed(-295, 32);
  Constant5_out1(188) <= to_signed(293, 32);
  Constant5_out1(189) <= to_signed(0, 32);
  Constant5_out1(190) <= to_signed(0, 32);
  Constant5_out1(191) <= to_signed(0, 32);
  Constant5_out1(192) <= to_signed(0, 32);
  Constant5_out1(193) <= to_signed(0, 32);
  Constant5_out1(194) <= to_signed(9830, 32);

  outputgen2: FOR k IN 0 TO 194 GENERATE
    Constant5_out1_1(k) <= std_logic_vector(Constant5_out1(k));
  END GENERATE;

  x_new_out1(0) <= signed(MAC_instruction_Controller_out4(0));
  x_new_out1(1) <= signed(MAC_instruction_Controller_out4(1));
  x_new_out1(2) <= signed(MAC_instruction_Controller_out4(2));
  x_new_out1(3) <= signed(MAC_instruction_Controller_out4(3));
  x_new_out1(4) <= signed(MAC_instruction_Controller_out4(4));
  x_new_out1(5) <= signed(MAC_instruction_Controller_out4(5));
  x_new_out1(6) <= signed(MAC_instruction_Controller_out4(6));
  x_new_out1(7) <= signed(MAC_instruction_Controller_out4(7));
  x_new_out1(8) <= signed(MAC_instruction_Controller_out4(8));

  x_old_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_old_out1 <= (OTHERS => to_signed(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        x_old_out1 <= x_new_out1;
      END IF;
    END IF;
  END PROCESS x_old_process;


  Mux_out1(0) <= x_old_out1(0);
  Mux_out1(1) <= x_old_out1(1);
  Mux_out1(2) <= x_old_out1(2);
  Mux_out1(3) <= x_old_out1(3);
  Mux_out1(4) <= x_old_out1(4);
  Mux_out1(5) <= x_old_out1(5);
  Mux_out1(6) <= x_old_out1(6);
  Mux_out1(7) <= x_old_out1(7);
  Mux_out1(8) <= x_old_out1(8);
  Mux_out1(9) <= Data_Type_Conversion11_out1(0);
  Mux_out1(10) <= Data_Type_Conversion11_out1(1);
  Mux_out1(11) <= Data_Type_Conversion11_out1(2);
  Mux_out1(12) <= Data_Type_Conversion11_out1(3);
  Mux_out1(13) <= Data_Type_Conversion11_out1(4);
  Mux_out1(14) <= Data_Type_Conversion11_out1(5);

  outputgen1: FOR k IN 0 TO 14 GENERATE
    Mux_out1_1(k) <= std_logic_vector(Mux_out1(k));
  END GENERATE;

  y_new_out1(0) <= signed(MAC_instruction_Controller_out4(9));
  y_new_out1(1) <= signed(MAC_instruction_Controller_out4(10));
  y_new_out1(2) <= signed(MAC_instruction_Controller_out4(11));
  y_new_out1(3) <= signed(MAC_instruction_Controller_out4(12));


  Data_Type_Conversion1_out1_gen: FOR ii1 IN 0 TO 3 GENERATE
    Data_Type_Conversion1_out1(ii1) <= y_new_out1(ii1)(27 DOWNTO 0) & '0' & '0' & '0' & '0';
  END GENERATE Data_Type_Conversion1_out1_gen;


  outputgen: FOR k IN 0 TO 3 GENERATE
    y(k) <= std_logic_vector(Data_Type_Conversion1_out1(k));
  END GENERATE;

END rtl;

