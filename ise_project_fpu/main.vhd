library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.contr1_pkg.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity control1 is
    Port (             led : out std_logic_vector(7 downto 0);
                    switch : in std_logic_vector(3 downto 0);
                 btn_north : in std_logic;
                  btn_east : in std_logic;
                 btn_south : in std_logic;
                  btn_west : in std_logic;
						E_RX_CLK : in std_logic;
                       clk : in std_logic;
					    E_RX_DV : in std_logic;
							E_RXD : in std_logic_vector(0 TO 3);
						 E_RX_ER : in std_logic;
						 E_TX_CLK : in std_logic;
						 ParamA1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
                   ParamA2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
                   ParamA3                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
                   ParamE1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
                   ParamE2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
                   ParamE3                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
					    E_TX_EN : out std_logic;
							E_TXD : out std_logic_vector(0 TO 3);
						 E_TX_ER : out std_logic;
			   strataflash_oe : out std_logic;
            strataflash_ce : out std_logic;
            strataflash_we : out std_logic;
						  AMP_CS : out std_logic;
						 AD_CONV : out std_logic;
					FPGA_INIT_B : out std_logic;
					     DAC_CS : out std_logic;
					   SPI_MISO : in std_logic;
					   SPI_MOSI : out std_logic;
				     	 SPI_SCK : out std_logic;
						 DAC_CLR : out std_logic;
						SPI_SS_B : out std_logic;
				  spi_amp_shdn : out std_logic);
    end control1;

architecture Behavioral of control1 is
	 
	 component test_rx
    Port (clk                               :   IN    std_logic;
          reset                             :   IN    std_logic;
          clk_enable                        :   IN    std_logic;
          RX_CLK                            :   IN    std_logic;
          RX_DV                             :   IN    std_logic;
          RX_D                              :   IN    std_logic_vector(0 TO 3);  -- boolean [4]
          RX_ER                             :   IN    std_logic;
          ce_out                            :   OUT   std_logic;
          BRAM_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- uint8
          BRAM_clk                          :   OUT   std_logic;
          BRAM_data                         :   OUT   std_logic_vector(0 TO 7);  -- boolean [8]
          BRAM_en                           :   OUT   std_logic;
          read_ev                           :   OUT   std_logic);
    end component;
	 
	 component contr1
    Port (clk                               :   IN    std_logic;
          reset                             :   IN    std_logic;
          clk_enable                        :   IN    std_logic;
          Read_event                        :   IN    std_logic;
          BRAM_out                          :   IN    std_logic_vector(0 TO 7);  -- boolean [8]
			 log_first                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
			 PC_In_4                           :   IN    vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
			 PC_In_3                           :   IN    vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
          ce_out                            :   OUT   std_logic;
          led_0                             :   OUT   std_logic;
          BRAM_clk                          :   OUT   std_logic;
          BRAM_addr                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- uint16
          BRAM_en                           :   OUT   std_logic;
			 trig_pack                         :   OUT   std_logic;
			 select_mem                        :   OUT   std_logic_vector(3 DOWNTO 0);
			 pack_size                         :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          resp                              :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
			 AOffset                           :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix11
			 log_start                         :   OUT   std_logic;
			 Param                             :   OUT    std_logic_vector(7 DOWNTO 0);
			 write_outram                      :   OUT   std_logic;
          data_outram                       :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          addr_outram                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
			 PC_Out_3                          :   OUT   vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
			 PC_Out_4                          :   OUT   vector_of_std_logic_vector8(0 TO 3)  -- uint8 [4]
		   );
    end component;
	 
	 component logunit
	 PORT( clk                               :   IN    std_logic;
          reset                             :   IN    std_logic;
          clk_enable                        :   IN    std_logic;
          Start                             :   IN    std_logic;
			 SPI_MISO_IN                       :   IN    std_logic;
			 Param                             :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
			 RT_PC_Out_4                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
			 RT_PC_Out_3                       :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
			 ParamA1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          ParamA2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          ParamA3                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
			 ParamE1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
          ParamE2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
          ParamE3                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En21
          ce_out                            :   OUT   std_logic;
          ram1w                             :   OUT   std_logic;
          ram1d                             :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          ram1a                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- ufix14
          First                             :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
			 DAC_CS_OUT                        :   OUT   std_logic;
          SPI_CLK_OUT                       :   OUT   std_logic;
          SPI_MOSI_OUT                      :   OUT   std_logic;
          DAC_CLR                           :   OUT   std_logic;
          PREAM_CS                          :   OUT   std_logic;
          AD_CONV                           :   OUT   std_logic;
          PREAM_SHDN                        :   OUT   std_logic;
			 led0                              :   OUT   std_logic;
			 ModelTick                         :   OUT   std_logic;
			 RT_PC_In_4                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
			 RT_PC_In_3                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En24
        );
	 end component;
	 
	 component test_lan
      PORT( clk                               :   IN    std_logic;
            reset                             :   IN    std_logic;
            clk_enable                        :   IN    std_logic;
            TX_CLK                            :   IN    std_logic;
            btn_1                             :   IN    std_logic;
            Data_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
            Size                              :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
            ce_out                            :   OUT   std_logic;
            led_0                             :   OUT   std_logic;
            tx_data                           :   OUT   std_logic_vector(0 TO 3);  -- boolean [4]
            tx_en                             :   OUT   std_logic;
            Address                           :   OUT   std_logic_vector(10 DOWNTO 0)  -- ufix11
          );
    end component;
	 
	 component Generator1
    Port (clk                               :   IN    std_logic;
          reset                             :   IN    std_logic;
          clk_enable                        :   IN    std_logic;
          event_r                           :   IN    std_logic;
          ce_out                            :   OUT   std_logic;
          out_event                         :   OUT   std_logic;
			 res_tr                            :   OUT   std_logic;
			 send                              :   IN    std_logic);
    end component;
	 
	 component ram1
	 port (clk : in std_logic;
			  we : in std_logic;
           en : in std_logic;
         addr : in std_logic_vector(10 downto 0);
           di : in std_logic_vector(7 downto 0);
           do : out std_logic_vector(7 downto 0));
	 end component;
	 
	component ram1dual
	port (clk : in std_logic;
			 we : in std_logic;
          en : in std_logic;
       addrw : in std_logic_vector(13 downto 0);
		 addrr : in std_logic_vector(13 downto 0);
          di : in std_logic_vector(7 downto 0);
          do : out std_logic_vector(7 downto 0));
   end component;
	 
	 component rom1
	 port (Address                           :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          response                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          Select_mem                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          UDP_Size                          :   IN    std_logic_vector(10 DOWNTO 0);  -- ufix11
          Data_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          Data_out1                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
			 AOffset                           :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix11
          Data                              :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          Address1                          :   OUT   std_logic_vector(10 DOWNTO 0);  -- ufix11
          Address2                          :   OUT   std_logic_vector(13 DOWNTO 0)  -- ufix11
			);
	 end component;
	 
  signal buf11: std_logic;
  signal buf12: std_logic;
  signal buf13: std_logic;
  signal buf14: std_logic;
  signal buf15: std_logic;
  signal buf16: std_logic;
  signal led_ctr: std_logic;
  signal res_buf: std_logic;
  
  signal bram_bufc: std_logic;
  signal bram_bufd: std_logic_vector(0 TO 7);
  signal bram_bufe: std_logic;
  signal bram_bufa: std_logic_vector(10 DOWNTO 0);
  
  signal bram_bufa1: std_logic_vector(10 DOWNTO 0);
  signal bram_bufc1: std_logic;
  signal bram_bufd1: std_logic_vector(0 TO 7);
  signal bram_bufe1: std_logic;
  
  signal bram_bufa2: std_logic_vector(10 DOWNTO 0);
  signal bram_bufc2: std_logic;
  signal bram_bufd2: std_logic_vector(7 DOWNTO 0);
  signal bram_bufe2: std_logic;
  
  signal send_buf: std_logic;
  signal res_buf1: std_logic;
  signal con_txev: std_logic;
  signal trig_txev: std_logic;
  
  signal buf_sel_mem: std_logic_vector(3 DOWNTO 0);
  signal buf_addr: std_logic_vector(10 DOWNTO 0);
  signal buf_addr1: std_logic_vector(10 DOWNTO 0);
  signal buf_addr2: std_logic_vector(10 DOWNTO 0);
  signal buf_datar: std_logic_vector(7 DOWNTO 0);
  signal buf_resp: std_logic_vector(7 DOWNTO 0);
  signal buf_size: std_logic_vector(10 DOWNTO 0);
  
  signal log1rama1: std_logic_vector(13 DOWNTO 0);
  signal log1rama2: std_logic_vector(13 DOWNTO 0);
  signal log1rama: std_logic_vector(10 DOWNTO 0);
  signal log1ramw: std_logic;
  signal log1ramd1: std_logic_vector(7 DOWNTO 0);
  signal log1ramd2: std_logic_vector(7 DOWNTO 0);
  
  --Unblocking log mode
  signal log1ramwOLD: std_logic;
  signal log1rama1OLD: std_logic_vector(13 DOWNTO 0);
  signal log1ramd1OLD: std_logic_vector(7 DOWNTO 0);
  
  signal addr_offset: std_logic_vector(13 DOWNTO 0);
  
  signal bufStart: std_logic;
  signal bufFirst: std_logic_vector(7 DOWNTO 0);
  
  signal bufParam: std_logic_vector(7 DOWNTO 0);
  signal ModelTick_line: std_logic;
  
  signal PC_Data4a: std_logic_vector(31 DOWNTO 0);
  signal PC_Data4b: std_logic_vector(31 DOWNTO 0);
  signal PC_Data4av: vector_of_std_logic_vector8(0 TO 3);
  signal PC_Data4bv: vector_of_std_logic_vector8(0 TO 3);
  
  signal PC_Data3a: std_logic_vector(31 DOWNTO 0);
  signal PC_Data3b: std_logic_vector(31 DOWNTO 0);
  signal PC_Data3av: vector_of_std_logic_vector8(0 TO 3);
  signal PC_Data3bv: vector_of_std_logic_vector8(0 TO 3);

begin
  --led(0) <= '0';
  --led(2) <= '0';
  --led(3) <= '0';
  led(4) <= '0';
  led(5) <= '0';
  led(6) <= '0';
  led(7) <= '0';
  
  PC_Data4av(0) <= PC_Data4a(7 DOWNTO 0);
  PC_Data4av(1) <= PC_Data4a(15 DOWNTO 8);
  PC_Data4av(2) <= PC_Data4a(23 DOWNTO 16);
  PC_Data4av(3) <= PC_Data4a(31 DOWNTO 24);
  
  PC_Data4b(7 DOWNTO 0) <= PC_Data4bv(0);
  PC_Data4b(15 DOWNTO 8) <= PC_Data4bv(1);
  PC_Data4b(23 DOWNTO 16) <= PC_Data4bv(2);
  PC_Data4b(31 DOWNTO 24) <= PC_Data4bv(3);
  
  PC_Data3av(0) <= PC_Data3a(7 DOWNTO 0);
  PC_Data3av(1) <= PC_Data3a(15 DOWNTO 8);
  PC_Data3av(2) <= PC_Data3a(23 DOWNTO 16);
  PC_Data3av(3) <= PC_Data3a(31 DOWNTO 24);
  
  PC_Data3b(7 DOWNTO 0) <= PC_Data3bv(0);
  PC_Data3b(15 DOWNTO 8) <= PC_Data3bv(1);
  PC_Data3b(23 DOWNTO 16) <= PC_Data3bv(2);
  PC_Data3b(31 DOWNTO 24) <= PC_Data3bv(3);
  
  ETH_rx : test_rx
    port map(clk => clk,
				 reset => '0',
				 clk_enable => '1',
				 ce_out => buf11,
				 RX_CLK => E_RX_CLK,
				 RX_DV => E_RX_DV,
				 RX_D => E_RXD,
				 RX_ER => E_RX_ER,
				 BRAM_addr => bram_bufa1,
				 BRAM_clk => bram_bufc1,
				 BRAM_data => bram_bufd1,
				 BRAM_en => bram_bufe1,
				 read_ev => res_buf);
				 
  --bram_bufd <= '1'&'1'&'1'&'1'&'1'&'1'&'1'&'1';	
	
  Handle_cmd : contr1
    port map(clk => clk,
				 reset => '0',
				 clk_enable => '1',
				 ce_out => buf12,
				 BRAM_out => bram_bufd2,
				 BRAM_clk => bram_bufc2,
				 BRAM_addr => bram_bufa2,
				 BRAM_en => bram_bufe2,
				 led_0 => led(3),
				 Read_event => ModelTick_line, --res_buf
				 trig_pack => send_buf,
				 select_mem => buf_sel_mem,
				 pack_size => buf_size,
				 resp => buf_resp,
				 log_first => bufFirst,
				 log_start => bufStart,
				 AOffset => addr_offset,
				 Param => bufParam,
				 write_outram => log1ramw,
				 data_outram => log1ramd1,
				 addr_outram => log1rama1,
				 PC_In_4 => PC_Data4av,
				 PC_Out_4 => PC_Data4bv,
				 PC_In_3 => PC_Data3av,
				 PC_Out_3 => PC_Data3bv);
	
  Log1Ctrl : logunit
  port map (clk => clk,
				reset => btn_west,
				clk_enable => '1',
				Start => bufStart,
				First => bufFirst,
				ram1w => log1ramwOLD,
				ram1d => log1ramd1OLD,
				ram1a => log1rama1OLD,
				SPI_MISO_IN => SPI_MISO,
				DAC_CS_OUT => DAC_CS,
				SPI_CLK_OUT => SPI_SCK,
				SPI_MOSI_OUT => SPI_MOSI,
				DAC_CLR => DAC_CLR,
				PREAM_CS => AMP_CS,
				AD_CONV => AD_CONV,
				PREAM_SHDN => spi_amp_shdn,
				led0 => led(0),
				Param => bufParam,
				ModelTick => ModelTick_line,
				RT_PC_Out_4 => PC_Data4b,
				RT_PC_In_4 => PC_Data4a,
				RT_PC_Out_3 => PC_Data3b,
				RT_PC_In_3 => PC_Data3a,
				ParamA1   =>   ParamA1 ,                  
        ParamA2      =>    ParamA2 ,                
        ParamA3      =>    ParamA3,                
        ParamE1      =>   ParamE1,             
        ParamE2     =>     ParamE2,              
        ParamE3      =>    ParamE3);               
  
  strataflash_oe <= '1';
  strataflash_ce <= '1';
  strataflash_we <= '1';
  
  SPI_SS_B <= '1';
  FPGA_INIT_B <= '0';
	 
  rambc : ram1
	 port map(clk => clk,
			    we => bram_bufe1,
             en => '1',
             addr => bram_bufa,
             di => bram_bufd1,
             do => bram_bufd2);
 
  bram_bufa <= (bram_bufa1 OR bram_bufa2) OR buf_addr1;
  --bram_bufc <= bram_bufc1 OR bram_bufc2;
  --bram_bufe <= bram_bufe1 OR bram_bufe2;
  
--  log1ram : ram1
--	 port map(clk => clk,
--			    we => log1ramw,
--             en => '1',
--             addr => log1rama,
--             di => log1ramd1,
--             do => log1ramd2);
--  
--  log1rama <= log1rama1 OR log1rama2;

  log1ram : ram1dual
  port map (clk => clk,
            we => log1ramw,
				en => '1',
				addrw => log1rama1,
				addrr => log1rama2,
				di => log1ramd1,
				do => log1ramd2);
  
  E_TX_ER <= '0';

  ETH_comp : test_lan
    port map(clk => clk,
				 reset => res_buf1,
				 clk_enable => '1',
				 ce_out => buf14,
				 TX_CLK => E_TX_CLK,
				 btn_1 => trig_txev,
				 led_0 => led(2),
				 tx_data => E_TXD,
				 tx_en => con_txev,
				 Size => buf_size,
				 Data_out => buf_datar,
				 Address => buf_addr);
  
  E_TX_EN <= con_txev;
				 
  gen_start : Generator1
    port map (clk => clk,
              reset => btn_west,
				  clk_enable => '1',
				  ce_out => buf15,
              event_r => con_txev,
				  out_event => trig_txev,
				  res_tr => res_buf1,
				  send => send_buf);
  
  test_rom : rom1
    port map (response => buf_resp,
				  Address => buf_addr,
				  Data => buf_datar,
				  Data_out => bram_bufd2,
				  Data_out1 => log1ramd2,
				  UDP_Size => buf_size,
				  Select_mem => buf_sel_mem,
				  Address1 => buf_addr1,
				  Address2 => log1rama2,
				  AOffset => addr_offset);
				 
  LED_Toggle_process : PROCESS (clk)
		variable reset_count3 : integer range 0 to 50000000;
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
		--reset_count3 := reset_count3 + '1';
		IF (reset_count3 = 50000000) THEN
          led_ctr <= not led_ctr;
			 reset_count3 := 0;
      ELSE
			 reset_count3 := reset_count3 + 1;
      END IF;
    END IF;
  END PROCESS LED_Toggle_process;
  
  led(1) <= led_ctr;
  
end Behavioral;
