library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ram1 is
	port (clk : in std_logic;
			 we : in std_logic;
          en : in std_logic;
       addrw : in std_logic_vector(10 downto 0);
		 addrr : in std_logic_vector(10 downto 0);
          di : in std_logic_vector(7 downto 0);
          do : out std_logic_vector(7 downto 0));
   end ram1;
	
architecture syn of ram1 is
	type ram_type is array (2047 downto 0) of std_logic_vector (7 downto 0);
	signal RAM: ram_type;

begin
	
	process (clk)
   begin
     if (clk'event and clk = '1') then
	    if (we = '1') then
	      RAM(conv_integer(addrw)) <= di;
		  end if;
        do <= RAM(conv_integer(addrr));
       end if;
   end process;
  
end syn;