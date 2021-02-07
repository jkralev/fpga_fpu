----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:32:19 02/23/2013 
-- Design Name: 
-- Module Name:    analog_wrap - Behavioral 
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

entity analog_wrap is
	PORT( clk                               :   IN    std_logic;
        Activate                          :   IN    std_logic;
        spi_miso_in                       :   IN    std_logic;
        DAC1                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dac_cs_out                        :   OUT   std_logic;
        spi_clock_out                     :   OUT   std_logic;
        spi_mosi_out                      :   OUT   std_logic;
        dac_clr                           :   OUT   std_logic;
        preamp_cs_out                     :   OUT   std_logic;
        ad_conv_out                       :   OUT   std_logic;
        preamp_shdn_out                   :   OUT   std_logic;
        adc1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        adc2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        led0                              :   OUT   std_logic
        );
end analog_wrap;

architecture Behavioral of analog_wrap is
  COMPONENT analog_mod IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        Activate                          :   IN    std_logic;
        spi_miso_in                       :   IN    std_logic;
        DAC1                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        adata1i                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        adata2i                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14
        ce_out                            :   OUT   std_logic;
        dac_cs_out                        :   OUT   std_logic;
        spi_clock_out                     :   OUT   std_logic;
        spi_mosi_out                      :   OUT   std_logic;
        dac_clr                           :   OUT   std_logic;
        preamp_cs_out                     :   OUT   std_logic;
        ad_conv_out                       :   OUT   std_logic;
        preamp_shdn_out                   :   OUT   std_logic;
        adc1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        adc2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        led0                              :   OUT   std_logic;
        adata1                            :   OUT   std_logic_vector(0 TO 13);  -- boolean [14]
        adata2                            :   OUT   std_logic_vector(0 TO 13)  -- boolean [14]
        );
	END COMPONENT;
	
	signal buf_data1i: std_logic_vector(13 DOWNTO 0);
	signal buf_data2i: std_logic_vector(13 DOWNTO 0);
	signal buf_data1o: std_logic_vector(13 DOWNTO 0);
	signal buf_data2o: std_logic_vector(13 DOWNTO 0);
	signal buf_ce: std_logic;
begin

	buf_data1i <= buf_data1o;
	buf_data2i <= buf_data2o;

	u_analog_mod : analog_mod
	PORT MAP (
				clk => clk,
				reset => '0',
				clk_enable => '1',
				Activate => Activate,
				spi_miso_in => spi_miso_in,
				DAC1 => DAC1,
				adata1i => buf_data1i,
				adata2i => buf_data2i,
				ce_out => buf_ce,
				dac_cs_out => dac_cs_out,
				spi_clock_out => spi_clock_out,
				spi_mosi_out => spi_mosi_out,
				dac_clr => dac_clr,
				preamp_cs_out => preamp_cs_out,
				ad_conv_out => ad_conv_out,
				preamp_shdn_out => preamp_shdn_out,
				adc1 => adc1,
				adc2 => adc2,
				led0 => led0,
				adata1 => buf_data1o,
				adata2 => buf_data2o
			);

end Behavioral;

