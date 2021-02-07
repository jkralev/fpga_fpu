----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:57:50 05/07/2013 
-- Design Name: 
-- Module Name:    single_int - Behavioral 
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

entity single_int is
  PORT( sigf                         :   IN    std_logic_vector(31 DOWNTO 0);
        sigi                         :   OUT   std_logic_vector(11 DOWNTO 0)
        );
end single_int;

architecture Behavioral of single_int is

COMPONENT Single_to_Uint IS
  PORT( sig                               :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        exp                               :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        frac1                             :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        y                                 :   OUT   std_logic_vector(11 DOWNTO 0)  -- ufix12
        );
END COMPONENT;


signal buf1 : std_logic_vector(11 downto 0);
signal buf2 : std_logic_vector(23 downto 0);
signal buf3 : std_logic_vector(7 downto 0);

begin

  buf2 <= '1' & sigf(22 downto 0);
  buf3 <= "0000000" & sigf(31);

  u_Single_to_Int : Single_to_Uint
    PORT MAP( sig => buf3,
				  exp => sigf(30 downto 23),
				  frac1 => buf2,
              y => buf1
              );
	sigi <= buf1;

end Behavioral;

