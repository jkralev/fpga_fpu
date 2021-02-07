library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.contr1_pkg.ALL;

ENTITY contr1_conv IS
  PORT( clk                               :   IN    std_logic;
        Timer_ISR                         :   IN    std_logic;
        Instruction                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Data_RAM_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        FPU_Result                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        BRAM_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
		  adc1                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
		  adc2                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Instruction_address               :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        RAM_Addr                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        Data_RAM                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        Write_RAM                         :   OUT   std_logic;
        FPU_Op1                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        FPU_Op2                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
		  FPU_Op3                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        BRAM_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
        trig_pack                         :   OUT   std_logic;
        select_mem                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        write_outram                      :   OUT   std_logic;
        data_outram                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        addr_outram                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
		  dac1										:   OUT	 std_logic_vector(31 DOWNTO 0);
		  dac2										:   OUT	 std_logic_vector(31 DOWNTO 0)
        );
END contr1_conv;


ARCHITECTURE rtl OF contr1_conv IS

  COMPONENT ivedsp IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        Timer_ISR                         :   IN    std_logic;
        Instruction                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Data_RAM_in                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        result                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        BRAM_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        internal_in_1                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        internal_in_2                     :   IN    vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
		  ADC_Input                         :   IN    vector_of_std_logic_vector8(0 TO 7);  -- uint8 [8]
        ce_out_0                          :   OUT   std_logic;
        ce_out_1                          :   OUT   std_logic;
        Instruction_address               :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        RAM_Addr                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        Data_RAM                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        Write_RAM                         :   OUT   std_logic;
        op1                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        op2                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
		  op3                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        trig_pack                         :   OUT   std_logic;
        select_mem                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        write_outram                      :   OUT   std_logic;
        data_outram                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        addr_outram                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
        internal_out_1                    :   OUT   vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
        internal_out_2                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        BRAM_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
		  DAC_Output                        :   OUT   vector_of_std_logic_vector8(0 TO 7)  -- uint8 [8]
        );
  END COMPONENT;
  
  signal bufi2: vector_of_std_logic_vector8(0 to 3);
  signal bufo1: vector_of_std_logic_vector8(0 to 3);
  signal ce_out_buf: std_logic;
  signal ce_out_buf1: std_logic;
  signal buf_in_1: std_logic_vector(31 DOWNTO 0);
  signal buf_out_2: std_logic_vector(31 DOWNTO 0);
  
  signal buf_adc: vector_of_std_logic_vector8(0 TO 7);
  signal buf_dac: vector_of_std_logic_vector8(0 TO 7);

BEGIN
  bufi2(0) <= buf_out_2(31 DOWNTO 24); bufi2(1) <= buf_out_2(23 DOWNTO 16);
  bufi2(2) <= buf_out_2(15 DOWNTO 8); bufi2(3) <= buf_out_2(7 DOWNTO 0);
--  bufi2(0) <= CONV_STD_LOGIC_VECTOR(10,8);
--  bufi2(1) <= CONV_STD_LOGIC_VECTOR(20,8);
--  bufi2(2) <= CONV_STD_LOGIC_VECTOR(30,8);
--  bufi2(3) <= CONV_STD_LOGIC_VECTOR(40,8);
  
    buf_in_1(31 DOWNTO 24) <= bufo1(0); buf_in_1(23 DOWNTO 16) <= bufo1(1);
    buf_in_1(15 DOWNTO 8) <= bufo1(2); buf_in_1(7 DOWNTO 0) <= bufo1(3);
  --buf_in_1 <= "00111111100000000000000000000000";
  
	buf_adc(0) <= adc1(31 DOWNTO 24); buf_adc(1) <= adc1(23 DOWNTO 16);
	buf_adc(2) <= adc1(15 DOWNTO 8); buf_adc(3) <= adc1(7 DOWNTO 0);
	buf_adc(4) <= adc2(31 DOWNTO 24); buf_adc(5) <= adc2(23 DOWNTO 16);
	buf_adc(6) <= adc2(15 DOWNTO 8); buf_adc(7) <= adc2(7 DOWNTO 0);
	
	dac1(31 DOWNTO 24) <= buf_dac(0); dac1(23 DOWNTO 16) <= buf_dac(1);
	dac1(15 DOWNTO 8) <= buf_dac(2); dac1(7 DOWNTO 0) <= buf_dac(3);
	
	dac2(31 DOWNTO 24) <= buf_dac(4); dac2(23 DOWNTO 16) <= buf_dac(5);
	dac2(15 DOWNTO 8) <= buf_dac(6); dac2(7 DOWNTO 0) <= buf_dac(7);
  
  u_ivedsp : ivedsp
	PORT MAP( clk => clk,
				 reset => '0',
				 clk_enable => '1',
             Timer_ISR => Timer_ISR,
				 Instruction => Instruction,
             Data_RAM_in => Data_RAM_in,
             result => FPU_Result,
				 BRAM_out => BRAM_out,
				 internal_in_1 => buf_in_1,
             internal_in_2 => bufi2,
				 ADC_Input => buf_adc,
             ce_out_0 => ce_out_buf,
				 ce_out_1 => ce_out_buf1,
             Instruction_address => Instruction_address,
             RAM_Addr => RAM_Addr,
             Data_RAM => Data_RAM,
             Write_RAM => Write_RAM,
             op1 => FPU_Op1,
             op2 => FPU_Op2,
				 op3 => FPU_Op3,
             BRAM_addr => BRAM_addr,
             trig_pack => trig_pack,
             select_mem => select_mem,
             write_outram => write_outram,
             data_outram => data_outram,
             addr_outram => addr_outram,
             internal_out_1 => bufo1,
             internal_out_2 => buf_out_2,
				 DAC_Output => buf_dac
        );
END rtl;
