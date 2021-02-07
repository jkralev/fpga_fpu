----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:21 11/17/2012 
-- Design Name: 
-- Module Name:    Type_Conv16_2_8 - Behavioral 
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
USE work.contr1_pkg.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Type_Conv16_2_8 is
    Port ( data_in : in STD_LOGIC_VECTOR (15 downto 0);
           data_out : out vector_of_std_logic_vector8(0 TO 1));
end Type_Conv16_2_8;

architecture Behavioral of Type_Conv16_2_8 is

begin
	data_out(0) <= data_in(7 DOWNTO 0);
	data_out(1) <= data_in(15 DOWNTO 8);
end Behavioral;

