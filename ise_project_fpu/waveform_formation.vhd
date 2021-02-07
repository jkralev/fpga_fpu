----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:38:57 04/30/2013 
-- Design Name: 
-- Module Name:    waveform_formation - Behavioral 
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

entity waveform_formation is
port (
		count : in std_logic_vector(7 DOWNTO 0);
		clk : in std_logic;
		CS_low : out std_logic_vector(2 DOWNTO 0);
		spi_clk : out std_logic;
		shift_a1 : out std_logic;
		stop : out std_logic
		);
end waveform_formation;

architecture Behavioral of waveform_formation is
	signal CS_low_next : std_logic_vector(2 DOWNTO 0);
	signal CS_low_reg : std_logic_vector(2 DOWNTO 0);
	signal stop_d : std_logic;
	signal store_next : std_logic;
begin

	process(clk,CS_low_next)
	begin
		if (clk'event and clk='1') then
			CS_low_reg <= CS_low_next;
	   end if;
	end process;
	
	process(clk,stop_d)
	begin
		if (clk'event and clk='1') then
			stop <= stop_d;
	   end if;
	end process;
	
	process(clk,CS_low_reg)
	begin
	   spi_clk <= '0';
		shift_a1 <= '0';
		if (CS_low_reg="101") then
			spi_clk<=clk and store_next;
			shift_a1 <= '1' and store_next;
		end if;
	end process;

	process(clk,count)
	begin
	   stop_d <= '0';
		store_next <= '1';
	   CS_low_next <= CS_low_reg;
		if (count="00000001") then
			CS_low_next <= "101";
			store_next <= '0';
		end if;
		if (count="00010001") then
			CS_low_next <= "000";
			stop_d <= '1';
		end if;
	end process;

	CS_low <= CS_low_reg;
end Behavioral;

