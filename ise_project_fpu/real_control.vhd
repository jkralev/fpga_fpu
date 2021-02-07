library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;

entity real_control is
	port (clk : in std_logic;
			 we : in std_logic;
          en : in std_logic;
        addr : in std_logic_vector(11 downto 0);
          di : in std_logic_vector(31 downto 0);
          do : out std_logic_vector(31 downto 0));
   end real_control;
	
architecture syn of real_control is
	type ram_type is array (0 to 2047) of bit_vector (31 downto 0); --big endian
	
	impure function Init_RAM (F : in string) return ram_type is                                                   
		FILE ram_file  : text is in F;                       
		variable line1 : line;                                 
		variable ram1  : ram_type;
	begin                                                        
		for I in ram_type'range loop                                  
			readline (ram_file, line1);                             
			read (line1, ram1(I));                                  
		end loop;                                                    
			return ram1;                                                  
	end function;                                                

	signal RAM: ram_type := Init_RAM("data_1.ivd");
	
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			if en = '1' then
				if we = '1' then
					RAM(conv_integer(addr)) <= to_bitvector(di);
				end if;
				do <= to_stdlogicvector(RAM(conv_integer(addr)));
			end if;
		end if;
	end process;
end syn;