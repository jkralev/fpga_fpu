----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:15 02/25/2013 
-- Design Name: 
-- Module Name:    analog_contr - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity analog_contr is
  PORT( Model_Tick                        :   IN    std_logic;
		  clk                               :   IN    std_logic;
        dout                              :   IN    std_logic;
		  dac1                              :   IN    std_logic_vector(31 DOWNTO 0);
		  dac2                              :   IN    std_logic_vector(31 DOWNTO 0);
        CS_low                            :   OUT   std_logic_vector(2 DOWNTO 0);
        adc1                              :   OUT   std_logic_vector(31 DOWNTO 0);
		  adc2                              :   OUT   std_logic_vector(31 DOWNTO 0);
        dsdi                              :   OUT   std_logic
        );
end analog_contr;

architecture Behavioral of analog_contr is

  COMPONENT analog_ext IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        Model_Tick                        :   IN    std_logic;
        dout                              :   IN    std_logic;
        daca_e                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        daca_f                            :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        dacb_e                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        dacb_f                            :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        sig_buf_i                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        sig1_buf_i                        :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        daca_i                            :   IN    std_logic_vector(0 TO 11);  -- boolean [12]
        dacb_i                            :   IN    std_logic_vector(0 TO 11);  -- boolean [12]
        daca_s                            :   IN    std_logic;
        dacb_s                            :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        CS_low                            :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        clk_out                           :   OUT   std_logic;
        sig                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        sig1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        dsdi                              :   OUT   std_logic;
        sig_buf_o                         :   OUT   std_logic_vector(0 TO 11);  -- boolean [12]
        sig1_buf_o                        :   OUT   std_logic_vector(0 TO 11);  -- boolean [12]
        daca_o                            :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        dacb_o                            :   OUT   std_logic_vector(11 DOWNTO 0)  -- ufix12
        );
  END COMPONENT;
  
  signal buf_ce : std_logic;
  signal buf_co : std_logic;
  signal buf1 : std_logic;
  signal buf2 : std_logic;
  
  signal buf_a_i : std_logic_vector(11 DOWNTO 0);
  signal buf_a_o : std_logic_vector(11 DOWNTO 0);
  signal buf_b_i : std_logic_vector(11 DOWNTO 0);
  signal buf_b_o : std_logic_vector(11 DOWNTO 0);
  
  signal buf_da_i : std_logic_vector(11 DOWNTO 0);
  signal buf_da_o : std_logic_vector(11 DOWNTO 0);
  signal buf_db_i : std_logic_vector(11 DOWNTO 0);
  signal buf_db_o : std_logic_vector(11 DOWNTO 0);
  
  signal buff1 : std_logic_vector(23 DOWNTO 0);
  signal buff2 : std_logic_vector(23 DOWNTO 0);
  
begin
	buff1 <= '1' & dac1(22 DOWNTO 0);
	buff2 <= '1' & dac2(22 DOWNTO 0);
	
	buf_a_i <= buf_a_o;
	buf_b_i <= buf_b_o;
	
	buf_da_i <= buf_da_o;
	buf_db_i <= buf_db_o;
	
	a1 : analog_ext
	PORT MAP( clk => clk,
             reset => '0',
             clk_enable => '1',
             Model_Tick => Model_Tick,
             dout => dout,
             daca_e => dac1(30 DOWNTO 23),
             daca_f => buff1,             
             dacb_e => dac2(30 DOWNTO 23),
             dacb_f => buff2,    
             sig_buf_i => buf_a_i,
             sig1_buf_i => buf_b_i,
             daca_i => buf_da_i,
             dacb_i => buf_db_i,
             daca_s => dac1(31),
             dacb_s => dac2(31),
             ce_out => buf_ce,
             CS_low => CS_low,
             clk_out => buf_co,
             sig => adc1,                 
             sig1 => adc2,                
             dsdi => dsdi,
             sig_buf_o => buf_a_o,				 
             sig1_buf_o => buf_b_o,                
             daca_o => buf_da_o,          
             dacb_o => buf_db_o);

end Behavioral;

