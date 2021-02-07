----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:34 04/30/2013 
-- Design Name: 
-- Module Name:    shift_reg_test - Behavioral 
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

entity shift_reg_test is
port (data_in : in std_logic;
		reg : out std_logic_vector(11 downto 0);
		clk : in std_logic;
		en : in std_logic
		);
end shift_reg_test;

architecture Behavioral of shift_reg_test is
	signal reg_buf : std_logic_vector(11 downto 0) := "000000000000";
	signal reg_buf_n : std_logic_vector(10 downto 0);
begin
	process (clk,data_in)
	begin
	   --reg_buf_n(10 downto 0) <= reg_buf(10 downto 0);
		if (clk'event and clk='1') then
			if (en = '1') then
				reg_buf(11 downto 0) <= reg_buf(10 downto 0) & data_in;
			end if;
		end if;
	end process;
	
	reg <= reg_buf;
end Behavioral;

