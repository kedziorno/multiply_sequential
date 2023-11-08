----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:51 11/08/2023 
-- Design Name: 
-- Module Name:    multiply_by_6 - Behavioral 
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

---------------------------------------------------------------------------------------------------
-- Deeds (Digital Electronics Education and Design Suite)
-- VHDL Code generated on (11/8/2023, 7:34:43 PM)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.50.200 (Feb 18, 2022)
-- Copyright (c) 2002-2022 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiply_by_6 IS
  PORT( ----------------------------------->Clock & Reset:
        Ck:    IN std_logic;
        Reset: IN std_logic;
        ----------------------------------->Inputs:
        i_IN:  IN std_logic;
        ----------------------------------->Outputs:
        o_O0:  OUT std_logic;
        o_O1:  OUT std_logic
        -------------------------------------------
        );
END multiply_by_6;

ARCHITECTURE behavioral OF multiply_by_6 IS       -- (Behavioral Description)
  TYPE states is ( state_0,
                   state_1,
                   state_2,
                   state_3,
                   state_4,
                   state_5,
                   state_6,
                   state_7,
                   state_8,
                   state_9,
                   state_a,
                   state_b,
                   dummy_1100,
                   dummy_1101,
                   dummy_1110,
                   dummy_1111 );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_IN )
  begin
    CASE State IS
      when state_0 =>
                 if (i_IN = '1') then
                   Next_State <= state_6;
                 else
                   Next_State <= state_0;
                 end if;
      when state_6 =>
                 if (i_IN = '1') then
                   Next_State <= state_9;
                 else
                   Next_State <= state_3;
                 end if;
      when state_9 =>
                 if (i_IN = '1') then
                   Next_State <= state_a;
                 else
                   Next_State <= state_4;
                 end if;
      when state_a =>
                 if (i_IN = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_5;
                 end if;
      when state_b =>
                 if (i_IN = '1') then
                   Next_State <= state_b;
                 else
                   Next_State <= state_5;
                 end if;
      when state_3 =>
                 if (i_IN = '1') then
                   Next_State <= state_7;
                 else
                   Next_State <= state_1;
                 end if;
      when state_7 =>
                 if (i_IN = '1') then
                   Next_State <= state_9;
                 else
                   Next_State <= state_3;
                 end if;
      when state_1 =>
                 if (i_IN = '1') then
                   Next_State <= state_6;
                 else
                   Next_State <= state_0;
                 end if;
      when state_5 =>
                 if (i_IN = '1') then
                   Next_State <= state_8;
                 else
                   Next_State <= state_2;
                 end if;
      when state_8 =>
                 if (i_IN = '1') then
                   Next_State <= state_a;
                 else
                   Next_State <= state_4;
                 end if;
      when state_2 =>
                 if (i_IN = '1') then
                   Next_State <= state_7;
                 else
                   Next_State <= state_1;
                 end if;
      when state_4 =>
                 if (i_IN = '1') then
                   Next_State <= state_8;
                 else
                   Next_State <= state_2;
                 end if;
      when OTHERS =>
                 Next_State <= state_0;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( Ck, Reset )
  begin
    if (Reset = '0') then
              State <= state_0;
    elsif rising_edge(Ck) then
              State <= Next_State;
       end if;
  end process;

  -- Outputs Combinational Logic -----------------------------------
  OUTPUTS: process( State, i_IN )
  begin
    -- Set output defaults:
    o_O0 <= '0';
    o_O1 <= '0';

    -- Set output as function of current state and input:
    CASE State IS
      when state_0 =>
                 o_O0 <= '1';
      when state_6 =>
                 o_O0 <= '1';
      when state_9 =>
                 o_O1 <= '1';
      when state_a =>
                 o_O0 <= '1';
      when state_b =>
                 o_O1 <= '1';
      when state_3 =>
                 o_O1 <= '1';
      when state_7 =>
                 o_O1 <= '1';
      when state_1 =>
                 o_O1 <= '1';
      when state_5 =>
                 o_O1 <= '1';
      when state_8 =>
                 o_O0 <= '1';
      when state_2 =>
                 o_O0 <= '1';
      when state_4 =>
                 o_O0 <= '1';
      when OTHERS =>
                 o_O0 <= '0';
                 o_O1 <= '0';
    END case;
  end process;

END behavioral;
