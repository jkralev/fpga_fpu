library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spi_rom is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(6 downto 0);
      DATA : out std_logic_vector(3 downto 0));
end spi_rom;

architecture syn of spi_rom is
    type rom_type is array (0 to 71) of std_logic_vector (3 downto 0);                 
    signal ROM : rom_type:= (X"0",
									  X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1", X"1",
									  X"0",
									  X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2", X"2",
									  X"0",
									  X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4", X"4",
									  X"0",
									  X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8", X"8",
									  X"0", X"0", X"0", X"0", X"0", X"0");                        

    signal rdata : std_logic_vector(3 downto 0);
begin

    rdata <= ROM(conv_integer(ADDR));

    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (EN = '1') then
                DATA <= rdata;
            end if;
        end if;
    end process;

end syn;

