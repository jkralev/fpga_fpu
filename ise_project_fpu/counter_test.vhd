----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:19:32 04/30/2013 
-- Design Name: 
-- Module Name:    counter_test - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_test is
port (clk : in std_logic;
		count : out std_logic_vector(7 downto 0);
		reset : in std_logic;
		en :in std_logic
		);
end counter_test;

architecture Behavioral of counter_test is
	signal count_reg : std_logic_vector(7 downto 0);
	signal count_reg_n : std_logic_vector(7 downto 0);
begin
	
	process(clk)
	begin
		if (clk'event and clk='1') then
			if (reset = '1') then
				count_reg <= (others => '0');
			elsif (en = '1') then
				count_reg <= count_reg + "00000001";
			end if;
		end if;
	end process;
	
	count <= count_reg;

end Behavioral;

