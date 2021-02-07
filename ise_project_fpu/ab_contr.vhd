----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:18 05/01/2013 
-- Design Name: 
-- Module Name:    ab_contr - Behavioral 
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

entity ab_contr is
port (sdo : in std_logic;
      sdi : out std_logic;
		spic : out std_logic;
		csl : out std_logic_vector(2 downto 0);
		tick : in std_logic;
		clk : in std_logic;
		adc1 : out std_logic_vector(11 downto 0);
		adc2 : out std_logic_vector(11 downto 0);
		dac1 : in std_logic_vector(11 downto 0);
		dac2 : in std_logic_vector(11 downto 0)
		);
end ab_contr;

architecture Behavioral of ab_contr is

component gen_tick is
	port (clk : in std_logic;
	      clk1 : out std_logic;
			clk1s : out std_logic
			);
end component;

component counter_test is
port (clk : in std_logic;
		count : out std_logic_vector(7 downto 0);
		reset : in std_logic;
		en :in std_logic
		);
end component;

component shift_reg_test is
port (data_in : in std_logic;
		reg : out std_logic_vector(11 downto 0);
		clk : in std_logic;
		en : in std_logic
		);
end component;

component shift_reg_out is
port (data_out : out std_logic;
		reg : in std_logic_vector(15 downto 0);
		clk : in std_logic;
		en : in std_logic;
		load : in std_logic
		);
end component;

component spi_rom is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(6 downto 0);
      DATA : out std_logic_vector(3 downto 0));
end component;

signal clk100,clk100_90,stop,start,start_reg : std_logic;
signal stage : std_logic_vector(7 downto 0) := "00000000";
--signal csl_r,csl_n : std_logic_vector(2 downto 0) := "000";
signal reg_en_1,reg_en_2 : std_logic;
signal adc1en,adc2en : std_logic;

signal bufc : std_logic_vector(3 downto 0);

signal load_reg : std_logic;
signal reg1o_en,reg2o_en : std_logic;
signal dac1_command,dac2_command : std_logic_vector(15 downto 0);

signal sdi_buf_1,sdi_buf_2 : std_logic;

signal start_d : std_logic;
signal start_ctrl : std_logic;


begin

	clock1 : gen_tick
	port map (clk => clk,
	          clk1 => clk100,
				 clk1s => clk100_90);
				 
	conter1 : counter_test
	port map (clk => clk100,
				 count => stage,
				 reset => stop,
				 en => start_reg);
				 
	reg1 : shift_reg_test
	port map (clk => clk100,
				 data_in => sdo,
				 reg => adc1,
				 en => reg_en_1);
				 
	reg2 : shift_reg_test
	port map (clk => clk100,
				 data_in => sdo,
				 reg => adc2,
				 en => reg_en_2);
				 
	reg1o : shift_reg_out
	port map (clk => clk100_90,
				 data_out => sdi_buf_1,
				 reg => dac1_command,
				 en => reg1o_en,
				 load => load_reg);
				 
	reg2o : shift_reg_out
	port map (clk => clk100_90,
				 data_out => sdi_buf_2,
				 reg => dac2_command,
				 en => reg2o_en,
				 load => load_reg);

	--Driver for signal start_reg
	process (clk100_90)
	begin
		if (clk100_90'event and clk100_90='1') then
			start_d <= start;
		end if;
	end process;

   load_reg <= start and (not start_d);	
	--stop <= not start_reg;
	stop <= not start;
	
	process(clk)
	begin
	   start_reg <= start;
		if (clk'event and clk='1') then
			start_reg <= start_ctrl;
		end if;
	end process;
	start <= start_reg;
	start_ctrl <= (tick or start) when (stage < STD_LOGIC_VECTOR(CONV_UNSIGNED(70,8))) else '0';
	
--	process(clk)
--	begin
--		if (clk'event and clk='1') then
--			start <= start_reg;
--			if (stage >= STD_LOGIC_VECTOR(CONV_UNSIGNED(70,8))) then
--				start <= '0';
--			end if;
--			if (tick='1') then
--				start <= '1';
--			end if;
--		end if;
--	end process;
--	start_reg <= start;
	
	dac1_command <= "0001" & dac1; 
	--dac1_command <= "0001" & "000000000000"; 
	dac2_command <= "1001" & dac2;
	--dac2_command <= "1001" & "000000000000"; 
	
	--dac1_command <= "0001" & "110011011101";
	
	--Driver for signal csl
	--process (stage,clk100,csl_r)
--	process (clk100,stage)
--		type state1 is (adc1,adc2,dac1,dac2,stop);
--		variable x : state1;
--		variable bufa : std_logic_vector(3 downto 0);
--		variable bufi : UNSIGNED(7 downto 0);
--	begin
--		--spic <= '0';
--		--csl_n <= csl_r;
--		bufi := UNSIGNED(stage);
--		if (clk100'event and clk100='0') then
--			--csl_n <= "000";
--			case bufi is
--				when (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15) => x := adc1;
--				when (17,18,19,20,21,22,23,24,25,26,27,28,29,30,31) => x := adc2;
--				when (33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48) => x := dac1;
--				when (50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65) => x := dac2;
--				when others => x := stop;
--			end case;
--			case x is
--				when adc1 => bufa := "1000";
--				when adc2 => bufa := "0100";
--				when dac1 => bufa := "0010";
--				when dac2 => bufa := "0001";
--				when others => bufa := "0000";
--			end case;
--			reg_en_1 <= bufa(3);
--			reg_en_2 <= bufa(2);
--			reg1o_en <= bufa(1);
--			reg2o_en <= bufa(0);
--		end if;
--	end process;
	--csl_r <= csl_n;
	spic <= clk100 and start_reg;
	
	reg_en_1 <= bufc(0);
	reg_en_2 <= bufc(1);
	reg1o_en <= bufc(2);
	reg2o_en <= bufc(3);
	
	spi_program : spi_rom
	port map (CLK => not clk100,
				 EN => '1',
			    ADDR => stage(6 downto 0),
			    DATA => bufc);
	
	process (clk)
	begin
		if (clk'event and clk='1') then
			case (bufc) is
				when X"1" => csl <= "110";
				when X"2" => csl <= "101";
				when X"4" => csl <= "111";
				when X"8" => csl <= "111";
				when others => csl <= "000";
			end case;
		end if;
	end process;

--	 ROM16X1_inst1 : ROM16X1
--   generic map (
--      INIT => "0000000100010110")
--   port map (
--      O => bufc1,   -- ROM output
--      A0 => reg_en_1, -- ROM address[0]
--      A1 => reg_en_2, -- ROM address[1]
--      A2 => reg1o_en, -- ROM address[2]
--      A3 => reg2o_en  -- ROM address[3]
--   );
--	
--	
--	 ROM16X1_inst2 : ROM16X1
--   generic map (
--      INIT => "0000000100010010")
--   port map (
--      O => bufc2,   -- ROM output
--      A0 => reg_en_1, -- ROM address[0]
--      A1 => reg_en_2, -- ROM address[1]
--      A2 => reg1o_en, -- ROM address[2]
--      A3 => reg2o_en  -- ROM address[3]
--   );
--	
--	
--	 ROM16X1_inst3 : ROM16X1
--   generic map (
--      INIT => "0000000100010100")
--   port map (
--      O => bufc3,   -- ROM output
--      A0 => reg_en_1, -- ROM address[0]
--      A1 => reg_en_2, -- ROM address[1]
--      A2 => reg1o_en, -- ROM address[2]
--      A3 => reg2o_en  -- ROM address[3]
--   );

	
	--csl <= bufc1 & bufc2 & bufc3;
	
	--bufc <= reg1o_en & reg2o_en;
	process (clk)
	begin
		if (clk'event and clk='1') then
			case (bufc) is
				when X"4" => sdi <= sdi_buf_1;
				when X"8" => sdi <= sdi_buf_2;
				when others => sdi <= '0';
			end case;
		end if;
	end process;

end Behavioral;

