----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:43:21 02/07/2013 
-- Design Name: 
-- Module Name:    fp_wrapper - Behavioral 
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

entity fp_wrapper is
PORT ( A   : IN std_logic_vector(31 DOWNTO 0);
       B   : IN std_logic_vector(31 DOWNTO 0);
		 ACC : IN std_logic_vector(31 DOWNTO 0);
		 C   : OUT std_logic_vector(31 DOWNTO 0)
		 );
			
end fp_wrapper;

architecture Behavioral of fp_wrapper is

  COMPONENT fp_mul IS
  PORT( A_frac_1                          :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        B_frac_1                          :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        A_sign                            :   IN    std_logic;
        A_exp                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        B_sign                            :   IN    std_logic;
        B_exp                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        C_sign                            :   OUT   std_logic;
        C_exp                             :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        C_frac                            :   OUT   std_logic_vector(22 DOWNTO 0)  -- ufix23
        );
  END COMPONENT;
  
  COMPONENT fp_sum IS
  PORT( A_frac_1                          :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        B_frac_1                          :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        A_sign                            :   IN    std_logic;
        A_exp                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        B_sign                            :   IN    std_logic;
        B_exp                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        C_sign                            :   OUT   std_logic;
        C_exp                             :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        C_frac                            :   OUT   std_logic_vector(22 DOWNTO 0)  -- ufix23
        );
  END COMPONENT;
  
  signal buf_a_frac: std_logic_vector(23 DOWNTO 0);
  signal buf_b_frac: std_logic_vector(23 DOWNTO 0);
  signal buf_acc_frac: std_logic_vector(23 DOWNTO 0);
  signal buf_c_sign: std_logic;
  signal buf_c_exp: std_logic_vector(7 DOWNTO 0);
  signal buf_c_frac: std_logic_vector(22 DOWNTO 0);
  
  signal sum_b_sign: std_logic;
  signal sum_b_exp: std_logic_vector(7 DOWNTO 0);
  signal sum_b_frac: std_logic_vector(23 DOWNTO 0);

begin

  buf_a_frac <= '1' & A(22 DOWNTO 0);
  buf_b_frac <= '1' & B(22 DOWNTO 0);
  buf_acc_frac <= '1' & ACC(22 DOWNTO 0);
  
  sum_b_sign <= buf_c_sign;
  sum_b_exp <= buf_c_exp;
  sum_b_frac <= '1' & buf_c_frac;

  u_fp_mul : fp_mul
  PORT MAP( A_frac_1 => buf_a_frac,
            B_frac_1 => buf_b_frac,
            A_sign => A(31),
            A_exp => A(30 DOWNTO 23),
            B_sign => B(31),
            B_exp => B(30 DOWNTO 23),
            C_sign => buf_c_sign,
            C_exp => buf_c_exp,
            C_frac => buf_c_frac
        );
		  
  u_fp_sum : fp_sum
  PORT MAP( A_frac_1 => buf_acc_frac,
            B_frac_1 => sum_b_frac,
            A_sign => ACC(31),
            A_exp => ACC(30 DOWNTO 23),
            B_sign => sum_b_sign,
            B_exp => sum_b_exp,
            C_sign => C(31),
            C_exp => C(30 DOWNTO 23),
            C_frac => C(22 DOWNTO 0)
        );


end Behavioral;

