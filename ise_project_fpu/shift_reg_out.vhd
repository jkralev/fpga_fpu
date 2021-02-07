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

entity shift_reg_out is
port (data_out : out std_logic;
		reg : in std_logic_vector(15 downto 0);
		clk : in std_logic;
		en : in std_logic;
		load : in std_logic
		);
end shift_reg_out;

architecture Behavioral of shift_reg_out is
	signal reg_buf : std_logic_vector(15 downto 0);
	signal reg_buf_n : std_logic_vector(15 downto 0);
begin

	process (clk,load)
	begin
	   --reg_buf_n <= reg_buf;
		if (clk'event and clk='1') then
			if (en = '1') then
				reg_buf <= reg_buf(14 downto 0) & '0';
			end if;
			if (load = '1') then
				reg_buf <= reg;
			end if;
		end if;
	end process;
	--reg_buf <= reg_buf_n;
	
	data_out <= reg_buf(15);
	
end Behavioral;

