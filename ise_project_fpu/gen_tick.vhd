----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:26 05/01/2013 
-- Design Name: 
-- Module Name:    gen_tick - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity gen_tick is
	port (clk : in std_logic;
	      clk1 : out std_logic;
			clk1s : out std_logic
			);
end gen_tick;

architecture Behavioral of gen_tick is
	signal count : std_logic_vector(7 downto 0) := STD_LOGIC_VECTOR(CONV_UNSIGNED(0,8));
	signal rest : std_logic := '0';
begin

	process(clk)
	begin
	   --count_n <= count;
		if (clk'event and clk='1') then
				count <= count + STD_LOGIC_VECTOR(CONV_UNSIGNED(1,8));
		end if;
	end process;
	
	--reset <= '1' when count>=STD_LOGIC_VECTOR(CONV_UNSIGNED(250,8)) else '0';
	clk1 <= '1' when count<STD_LOGIC_VECTOR(CONV_UNSIGNED(128,8)) else '0';
	clk1s <= '1' when (count >= STD_LOGIC_VECTOR(CONV_UNSIGNED(64,8)) and count<STD_LOGIC_VECTOR(CONV_UNSIGNED(192,8))) else '0';

end Behavioral;

