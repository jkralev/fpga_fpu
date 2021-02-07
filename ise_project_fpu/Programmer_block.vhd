-- -------------------------------------------------------------
-- 
-- File Name: D:\Dan\FPGA_FPU\ise_project_fpu\Programmer_block.vhd
-- Created: 2013-02-09 16:56:18
-- 
-- Generated by MATLAB 7.11 and Simulink HDL Coder 2.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Programmer_block
-- Source Path: programmer/Programmer
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.programmer_pkg.ALL;

ENTITY Programmer_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        BRAM_out                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        req                               :   IN    vector_of_std_logic_vector8(0 TO 2);  -- uint8 [3]
        read_ev                           :   IN    std_logic;
        BRAM_addr                         :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        ramd_w                            :   OUT   std_logic;
        ramd_d                            :   OUT   vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
        ramd_a                            :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        ramp_w                            :   OUT   std_logic;
        ramp_d                            :   OUT   vector_of_std_logic_vector8(0 TO 3);  -- uint8 [4]
        ramp_a                            :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        write_ram                         :   OUT   std_logic;
        data_ram                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        addr_ram                          :   OUT   std_logic_vector(13 DOWNTO 0)  -- ufix14
        );
END Programmer_block;


ARCHITECTURE rtl OF Programmer_block IS

  -- Signals
  SIGNAL BRAM_out_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL req_unsigned                     : vector_of_unsigned8(0 TO 2);  -- uint8 [3]
  SIGNAL is_Programmer                    : T_state_type_is_Programmer;  -- uint8
  SIGNAL BRAM_addr_tmp                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL ramd_d_tmp                       : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramd_a_tmp                       : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL ramp_d_tmp                       : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramp_a_tmp                       : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL data_ram_tmp                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL addr_ram_tmp                     : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL ind                              : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL BRAM_addr_reg                    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL ramd_w_reg                       : std_logic;
  SIGNAL ramd_d_reg                       : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramd_a_reg                       : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL ramp_w_reg                       : std_logic;
  SIGNAL ramp_d_reg                       : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramp_a_reg                       : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL write_ram_reg                    : std_logic;
  SIGNAL data_ram_reg                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL addr_ram_reg                     : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL is_Programmer_next               : T_state_type_is_Programmer;  -- enumerated type (12 enums)
  SIGNAL ind_next                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL BRAM_addr_reg_next               : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL ramd_w_reg_next                  : std_logic;
  SIGNAL ramd_d_reg_next                  : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramd_a_reg_next                  : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL ramp_w_reg_next                  : std_logic;
  SIGNAL ramp_d_reg_next                  : vector_of_unsigned8(0 TO 3);  -- uint8 [4]
  SIGNAL ramp_a_reg_next                  : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL write_ram_reg_next               : std_logic;
  SIGNAL data_ram_reg_next                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL addr_ram_reg_next                : unsigned(13 DOWNTO 0);  -- ufix14

BEGIN
  BRAM_out_unsigned <= unsigned(BRAM_out);

  outputgen2: FOR k IN 0 TO 2 GENERATE
    req_unsigned(k) <= unsigned(req(k));
  END GENERATE;

  Programmer_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      ind <= to_unsigned(0, 16);
      BRAM_addr_reg <= to_unsigned(0, 2);
      ramd_w_reg <= '0';
      ramd_a_reg <= to_unsigned(0, 12);
      ramp_w_reg <= '0';

      FOR t_0 IN 0 TO 3 LOOP
        ramd_d_reg(t_0) <= to_unsigned(0, 8);
        ramp_d_reg(t_0) <= to_unsigned(0, 8);
      END LOOP;

      ramp_a_reg <= to_unsigned(0, 12);
      write_ram_reg <= '0';
      data_ram_reg <= to_unsigned(0, 8);
      addr_ram_reg <= to_unsigned(0, 14);
      is_Programmer <= IN_Start;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        is_Programmer <= is_Programmer_next;
        ind <= ind_next;
        BRAM_addr_reg <= BRAM_addr_reg_next;
        ramd_w_reg <= ramd_w_reg_next;
        ramd_a_reg <= ramd_a_reg_next;
        ramp_w_reg <= ramp_w_reg_next;
        ramd_d_reg <= ramd_d_reg_next;
        ramp_d_reg <= ramp_d_reg_next;
        ramp_a_reg <= ramp_a_reg_next;
        write_ram_reg <= write_ram_reg_next;
        data_ram_reg <= data_ram_reg_next;
        addr_ram_reg <= addr_ram_reg_next;
      END IF;
    END IF;
  END PROCESS Programmer_process;

  Programmer_output : PROCESS (is_Programmer, BRAM_out_unsigned, req_unsigned, ind, read_ev, BRAM_addr_reg, ramd_w_reg, 
      ramd_d_reg, ramd_a_reg, ramp_w_reg, ramp_d_reg, ramp_a_reg, write_ram_reg, data_ram_reg, 
      addr_ram_reg)
    VARIABLE ind_temp : unsigned(15 DOWNTO 0);
  BEGIN
    ind_temp := ind;
    is_Programmer_next <= is_Programmer;
    BRAM_addr_reg_next <= BRAM_addr_reg;
    ramd_w_reg_next <= ramd_w_reg;
    ramd_a_reg_next <= ramd_a_reg;
    ramp_w_reg_next <= ramp_w_reg;
    ramd_d_reg_next <= ramd_d_reg;
    ramp_d_reg_next <= ramp_d_reg;
    ramp_a_reg_next <= ramp_a_reg;
    write_ram_reg_next <= write_ram_reg;
    data_ram_reg_next <= data_ram_reg;
    addr_ram_reg_next <= addr_ram_reg;

    CASE is_Programmer IS
      WHEN IN_Data =>
        IF BRAM_out_unsigned = 201 THEN 
          ind_temp := to_unsigned(0, 16);
          BRAM_addr_reg_next <= to_unsigned(1, 2);
          is_Programmer_next <= IN_Data2;
        ELSE 
          ramd_a_reg_next <= ramd_a_reg + 1;
          ind_temp := to_unsigned(0, 16);
          is_Programmer_next <= IN_Request;
        END IF;
      WHEN IN_Data1 =>
        IF ind = 2 THEN 
          is_Programmer_next <= IN_Wait;
        ELSE 
          ind_temp := ind + 1;
          is_Programmer_next <= IN_Request;
        END IF;
      WHEN IN_Data2 =>
        ramd_d_reg_next(to_integer(ind)) <= BRAM_out_unsigned;
        ind_temp := ind + 1;
        BRAM_addr_reg_next <= BRAM_addr_reg + 1;
        IF ind_temp = 3 THEN 
          ramd_w_reg_next <= '1';
          is_Programmer_next <= IN_Data3;
        ELSE 
          is_Programmer_next <= IN_Data2;
        END IF;
      WHEN IN_Data3 =>
        ramd_w_reg_next <= '0';
        IF ramd_a_reg = 2048 THEN 
          addr_ram_reg_next <= to_unsigned(0, 14);
          data_ram_reg_next <= to_unsigned(44, 8);
          write_ram_reg_next <= '1';
          is_Programmer_next <= IN_End;
        ELSE 
          ramd_a_reg_next <= ramd_a_reg + 1;
          ind_temp := to_unsigned(0, 16);
          is_Programmer_next <= IN_Request;
        END IF;
      WHEN IN_End =>
        write_ram_reg_next <= '0';
        is_Programmer_next <= IN_End1;
      WHEN IN_End1 =>
        NULL;
      WHEN IN_Ready =>
        IF read_ev = '1' THEN 
          BRAM_addr_reg_next <= to_unsigned(0, 2);
          is_Programmer_next <= IN_Ready1;
        END IF;
      WHEN IN_Ready1 =>
        IF BRAM_out_unsigned = 101 THEN 
          ind_temp := to_unsigned(0, 16);
          is_Programmer_next <= IN_Request;
        ELSE 
          is_Programmer_next <= IN_Ready;
        END IF;
      WHEN IN_Request =>
        addr_ram_reg_next <= ind(13 DOWNTO 0);
        data_ram_reg_next <= req_unsigned(to_integer(ind));
        write_ram_reg_next <= '1';
        is_Programmer_next <= IN_Data1;
      WHEN IN_Start =>
        addr_ram_reg_next <= to_unsigned(0, 14);
        data_ram_reg_next <= to_unsigned(100, 8);
        write_ram_reg_next <= '1';
        ramd_a_reg_next <= to_unsigned(0, 12);
        is_Programmer_next <= IN_Wait1;
      WHEN IN_Wait =>
        IF read_ev = '1' THEN 
          BRAM_addr_reg_next <= to_unsigned(0, 2);
          is_Programmer_next <= IN_Data;
        END IF;
      WHEN IN_Wait1 =>
        write_ram_reg_next <= '0';
        is_Programmer_next <= IN_Ready;
      WHEN OTHERS => 
        is_Programmer_next <= IN_Start;
    END CASE;

    ind_next <= ind_temp;
  END PROCESS Programmer_output;

  BRAM_addr_tmp <= BRAM_addr_reg_next;
  ramd_w <= ramd_w_reg_next;
  ramd_a_tmp <= ramd_a_reg_next;
  ramp_w <= ramp_w_reg_next;
  ramd_d_tmp <= ramd_d_reg_next;
  ramp_d_tmp <= ramp_d_reg_next;
  ramp_a_tmp <= ramp_a_reg_next;
  write_ram <= write_ram_reg_next;
  data_ram_tmp <= data_ram_reg_next;
  addr_ram_tmp <= addr_ram_reg_next;

  BRAM_addr <= std_logic_vector(BRAM_addr_tmp);

  outputgen1: FOR k IN 0 TO 3 GENERATE
    ramd_d(k) <= std_logic_vector(ramd_d_tmp(k));
  END GENERATE;

  ramd_a <= std_logic_vector(ramd_a_tmp);

  outputgen: FOR k IN 0 TO 3 GENERATE
    ramp_d(k) <= std_logic_vector(ramp_d_tmp(k));
  END GENERATE;

  ramp_a <= std_logic_vector(ramp_a_tmp);

  data_ram <= std_logic_vector(data_ram_tmp);

  addr_ram <= std_logic_vector(addr_ram_tmp);

END rtl;

