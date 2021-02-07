-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\IN_Controller.vhd
-- Created: 2013-03-04 19:25:57
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IN_Controller
-- Source Path: ivedsp/IN_Controller
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ivedsp_pkg.ALL;

ENTITY IN_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        IN_rsvd                           :   IN    std_logic;
        BRAM_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        port_rsvd                         :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        ADC_Input                         :   IN    vector_of_std_logic_vector8(0 TO 7);  -- uint8 [8]
        BRAM_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        PC_Out                            :   OUT   vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
        Ready                             :   OUT   std_logic
        );
END IN_Controller;


ARCHITECTURE rtl OF IN_Controller IS

  -- Signals
  SIGNAL BRAM1_out1                       : std_logic;
  SIGNAL BRAM1_out1_1                     : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL FixPt_Constant2_out1             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL FixPt_Constant3_out1             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL BRAM_out1                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Add1_add_temp                    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Add1_out1                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Switch_out1                      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Data_Type_Conversion2_out1       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL port_unsigned                    : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Relative_address_out1            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL FixPt_Constant1_out1             : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Add_add_temp                     : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Add_out1                         : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL Compare_To_Constant6_out1        : std_logic;
  SIGNAL FixPt_Constant6_out1             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant5_out1        : std_logic;
  SIGNAL FixPt_Constant5_out1             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Switch6_out1                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL FixPt_Constant4_out1             : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Switch5_out1                     : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL BRAM3_out1                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL BRAM_out_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL PC_Out0_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch1_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL PC_Out1_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch2_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL PC_Out2_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch3_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant3_out1        : std_logic;
  SIGNAL PC_Out3_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch4_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Mux_out1                         : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL Selector_out1                    : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL Selector1_out1                   : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL Multiport_Switch_out1            : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL IN_rsvd_1                        : std_logic;
  SIGNAL Compare_To_Constant4_out1        : std_logic;
  SIGNAL BRAM2_reg                        : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL BRAM2_out1                       : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  BRAM1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BRAM1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BRAM1_out1 <= IN_rsvd;
      END IF;
    END IF;
  END PROCESS BRAM1_process;


  BRAM1_out1_1 <=  NOT BRAM1_out1;

  Logical_Operator3_out1 <= BRAM1_out1_1 AND IN_rsvd;

  FixPt_Constant2_out1 <= to_unsigned(1, 2);

  FixPt_Constant3_out1 <= to_unsigned(0, 2);

  Add1_add_temp <= resize(FixPt_Constant2_out1, 3) + resize(BRAM_out1, 3);
  
  Add1_out1 <= "11" WHEN Add1_add_temp(2) /= '0' ELSE
      Add1_add_temp(1 DOWNTO 0);

  
  Switch_out1 <= Add1_out1 WHEN Logical_Operator3_out1 = '0' ELSE
      FixPt_Constant3_out1;

  BRAM_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BRAM_out1 <= to_unsigned(0, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BRAM_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS BRAM_process;


  Data_Type_Conversion2_out1 <= resize(BRAM_out1, 5);

  port_unsigned <= unsigned(port_rsvd);

  Relative_address_out1 <= port_unsigned sll 2;

  FixPt_Constant1_out1 <= to_unsigned(43, 11);

  Add_add_temp <= resize(Data_Type_Conversion2_out1, 11) + resize(Relative_address_out1, 11);
  Add_out1 <= Add_add_temp + FixPt_Constant1_out1;

  BRAM_addr <= std_logic_vector(Add_out1);

  
  Compare_To_Constant6_out1 <= '1' WHEN port_unsigned = 11 ELSE
      '0';

  FixPt_Constant6_out1 <= to_unsigned(0, 2);

  
  Compare_To_Constant5_out1 <= '1' WHEN port_unsigned = 10 ELSE
      '0';

  FixPt_Constant5_out1 <= to_unsigned(2, 2);

  
  Switch6_out1 <= FixPt_Constant6_out1 WHEN Compare_To_Constant6_out1 = '0' ELSE
      FixPt_Constant5_out1;

  FixPt_Constant4_out1 <= to_unsigned(1, 2);

  
  Switch5_out1 <= Switch6_out1 WHEN Compare_To_Constant5_out1 = '0' ELSE
      FixPt_Constant4_out1;

  BRAM3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BRAM3_out1 <= to_unsigned(0, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BRAM3_out1 <= BRAM_out1;
      END IF;
    END IF;
  END PROCESS BRAM3_process;


  
  Compare_To_Constant_out1 <= '1' WHEN BRAM3_out1 = 0 ELSE
      '0';

  BRAM_out_unsigned <= unsigned(BRAM_out);

  
  Switch1_out1 <= PC_Out0_out1 WHEN Compare_To_Constant_out1 = '0' ELSE
      BRAM_out_unsigned;

  PC_Out0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      PC_Out0_out1 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        PC_Out0_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS PC_Out0_process;


  
  Compare_To_Constant1_out1 <= '1' WHEN BRAM3_out1 = 1 ELSE
      '0';

  
  Switch2_out1 <= PC_Out1_out1 WHEN Compare_To_Constant1_out1 = '0' ELSE
      BRAM_out_unsigned;

  PC_Out1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      PC_Out1_out1 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        PC_Out1_out1 <= Switch2_out1;
      END IF;
    END IF;
  END PROCESS PC_Out1_process;


  
  Compare_To_Constant2_out1 <= '1' WHEN BRAM3_out1 = 2 ELSE
      '0';

  
  Switch3_out1 <= PC_Out2_out1 WHEN Compare_To_Constant2_out1 = '0' ELSE
      BRAM_out_unsigned;

  PC_Out2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      PC_Out2_out1 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        PC_Out2_out1 <= Switch3_out1;
      END IF;
    END IF;
  END PROCESS PC_Out2_process;


  
  Compare_To_Constant3_out1 <= '1' WHEN BRAM3_out1 = 3 ELSE
      '0';

  
  Switch4_out1 <= PC_Out3_out1 WHEN Compare_To_Constant3_out1 = '0' ELSE
      BRAM_out_unsigned;

  PC_Out3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      PC_Out3_out1 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        PC_Out3_out1 <= Switch4_out1;
      END IF;
    END IF;
  END PROCESS PC_Out3_process;


  Mux_out1(0) <= PC_Out0_out1;
  Mux_out1(1) <= PC_Out1_out1;
  Mux_out1(2) <= PC_Out2_out1;
  Mux_out1(3) <= PC_Out3_out1;

  Selector_out1(0) <= unsigned(ADC_Input(0));
  Selector_out1(1) <= unsigned(ADC_Input(1));
  Selector_out1(2) <= unsigned(ADC_Input(2));
  Selector_out1(3) <= unsigned(ADC_Input(3));

  Selector1_out1(0) <= unsigned(ADC_Input(4));
  Selector1_out1(1) <= unsigned(ADC_Input(5));
  Selector1_out1(2) <= unsigned(ADC_Input(6));
  Selector1_out1(3) <= unsigned(ADC_Input(7));

  Multiport_Switch_output : PROCESS (Switch5_out1, Mux_out1, Selector_out1, Selector1_out1)
  BEGIN
    IF Switch5_out1 = 0 THEN 
      Multiport_Switch_out1 <= Mux_out1;
    ELSIF Switch5_out1 = 1 THEN 
      Multiport_Switch_out1 <= Selector_out1;
    ELSE 
      Multiport_Switch_out1 <= Selector1_out1;
    END IF;
  END PROCESS Multiport_Switch_output;


  outputgen: FOR k IN 0 TO 3 GENERATE
    PC_Out(k) <= std_logic_vector(Multiport_Switch_out1(k));
  END GENERATE;

  IN_rsvd_1 <=  NOT IN_rsvd;

  
  Compare_To_Constant4_out1 <= '1' WHEN BRAM_out1 = 3 ELSE
      '0';

  BRAM2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BRAM2_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BRAM2_reg(0) <= Compare_To_Constant4_out1;
        BRAM2_reg(1) <= BRAM2_reg(0);
      END IF;
    END IF;
  END PROCESS BRAM2_process;

  BRAM2_out1 <= BRAM2_reg(1);

  Logical_Operator1_out1 <= IN_rsvd_1 OR BRAM2_out1;

  Ready <= Logical_Operator1_out1;

END rtl;

