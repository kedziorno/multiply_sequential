--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:11:01 11/12/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/Deeds/multiply_seq/tb_multiply_by_5.vhd
-- Project Name:  multiply
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiply_by_5
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_multiply_by_5 IS
END tb_multiply_by_5;
 
ARCHITECTURE behavior OF tb_multiply_by_5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiply_by_5
    PORT(
         Ck : IN  std_logic;
         Reset : IN  std_logic;
         i_IN : IN  std_logic;
         o_O1 : OUT  std_logic;
         o_O0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ck : std_logic := '0';
   signal Reset : std_logic := '0';
   signal i_IN : std_logic := '0';

 	--Outputs
   signal o_O1 : std_logic;
   signal o_O0 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiply_by_5 PORT MAP (
          Ck => Ck,
          Reset => Reset,
          i_IN => i_IN,
          o_O1 => o_O1,
          o_O0 => o_O0
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
