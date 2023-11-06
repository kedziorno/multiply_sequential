----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:29 11/06/2023 
-- Design Name: 
-- Module Name:    multiply_by_3 - Behavioral 
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
-- VHDL Code generated on (11/6/2023, 9:16:56 PM)
--      by the Deeds (Finite State Machine Simulator)(Deeds-FsM)
--      Ver. 2.50.200 (Feb 18, 2022)
-- Copyright (c) 2002-2022 University of Genoa, Italy
--      Web Site:  https://www.digitalelectronicsdeeds.com
---------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiply_by_3 IS
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
END multiply_by_3;

ARCHITECTURE behavioral OF multiply_by_3 IS       -- (Behavioral Description)
  TYPE states is ( state_00,
                   state_01,
                   state_02,
                   state_03,
                   state_04,
                   state_05,
                   dummy_110,
                   dummy_111 );
  SIGNAL State,
         Next_State: states;
BEGIN

  -- Next State Combinational Logic ----------------------------------
  FSM: process( State, i_IN )
  begin
    CASE State IS
      when state_00 =>
                 if (i_IN = '1') then
                   Next_State <= state_01;
                 else
                   Next_State <= state_00;
                 end if;
      when state_01 =>
                 if (i_IN = '1') then
                   Next_State <= state_03;
                 else
                   Next_State <= state_02;
                 end if;
      when state_02 =>
                 if (i_IN = '1') then
                   Next_State <= state_01;
                 else
                   Next_State <= state_00;
                 end if;
      when state_03 =>
                 if (i_IN = '1') then
                   Next_State <= state_05;
                 else
                   Next_State <= state_04;
                 end if;
      when state_05 =>
                 if (i_IN = '1') then
                   Next_State <= state_05;
                 else
                   Next_State <= state_04;
                 end if;
      when state_04 =>
                 if (i_IN = '1') then
                   Next_State <= state_03;
                 else
                   Next_State <= state_02;
                 end if;
      when OTHERS =>
                 Next_State <= state_00;
    END case;
  end process;

  -- State Register --------------------------------------------------
  REG: process( Ck, Reset )
  begin
    if (Reset = '0') then
              State <= state_00;
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
      when state_00 =>
                 o_O0 <= '1';
      when state_01 =>
                 o_O1 <= '1';
      when state_02 =>
                 o_O1 <= '1';
      when state_03 =>
                 o_O0 <= '1';
      when state_05 =>
                 o_O1 <= '1';
      when state_04 =>
                 o_O0 <= '1';
      when OTHERS =>
                 o_O0 <= '0';
                 o_O1 <= '0';
    END case;
  end process;

END behavioral;
