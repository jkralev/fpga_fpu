----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:20:04 11/03/2012 
-- Design Name: 
-- Module Name:    address_mux11 - Behavioral 
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

entity address_mux11 is
    Port ( --adr1 : in  STD_LOGIC_VECTOR (10 downto 0);
           adr2 : in  STD_LOGIC_VECTOR (10 downto 0);
           adr3 : in  STD_LOGIC_VECTOR (10 downto 0);
           adr : out  STD_LOGIC_VECTOR (10 downto 0));
end address_mux11;

architecture Behavioral of address_mux11 is

begin
	--adr <= adr1 or (adr2 or adr3);
	adr <= adr2 or adr3;
end Behavioral;

