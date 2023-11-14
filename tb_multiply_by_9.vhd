--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:12:30 11/12/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/Deeds/multiply_seq/tb_multiply_by_9.vhd
-- Project Name:  multiply
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiply_by_9
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
 
ENTITY tb_multiply_by_9 IS
END tb_multiply_by_9;
 
ARCHITECTURE behavior OF tb_multiply_by_9 IS
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT multiply_by_9
PORT (
Ck : IN  std_logic;
Reset : IN  std_logic;
i_IN : IN  std_logic;
o_O0 : OUT  std_logic;
o_O1 : OUT  std_logic
);
END COMPONENT;

--Inputs
signal Ck : std_logic := '0';
signal Reset : std_logic := '0';
signal i_IN : std_logic := '0';

--Outputs
signal o_O0 : std_logic;
signal o_O1 : std_logic;

constant multiply : integer := 9;

constant Ck_period : time := 10 ns;

signal start,stop : bit := '0';

signal value_in : unsigned (cycles-1 downto 0) := (others => '0');
signal value_out : unsigned (cycles-1 downto 0) := (others => '0');

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut_m9 : multiply_by_9 PORT MAP (
Ck => Ck,
Reset => Reset,
i_IN => i_IN,
o_O0 => o_O0,
o_O1 => o_O1
);

-- Clock process definitions
Ck_process : process
begin
Ck <= not Ck; wait for Ck_period/2;
end process Ck_process;

reset_proc : process
begin
l0 : for i in 0 to (2**no_values_power2) loop -- range 0 to 2^x
start <= '0'; Reset <= '0'; wait for Ck_period*1; Reset <= '1'; start <= '1'; -- sequence for test one value
value_in <= to_unsigned (i, cycles); -- for shift register
value_in (cycles-1 downto 1) <= value_in (cycles-2 downto 0); value_in (0) <= not (value_in (cycles-1) XOR value_in (cycles-10) XOR value_in (0)); -- catch from template example
wait for (cycles+multiply+2)*Ck_Period; -- wait x cycles for out
end loop l0;
--start <= '0'; Reset <= '0'; wait for Ck_period*1; Reset <= '1'; start <= '1'; value_in <= x"ffffffff"; wait for (cycles+multiply+2)*Ck_Period; -- debug, ok all ones
report "tb done" severity failure;
end process reset_proc;

-- Stimulus processes
stim_proc_in : process -- send data
begin
wait until start = '1'; -- wait for new one data
shift_out (i_IN, Ck, value_in); -- shifting data to uut
i_IN <= '0'; -- rest data have zeros
end process stim_proc_in;

stim_proc_out : process -- recv data
begin
wait until start = '1'; -- wait for new one data
l0 : for i in 0 to multiply-2 loop
wait until rising_edge (Ck); -- must wait multiply cycles for value out
end loop l0;
shift_in (o_O1, Ck, value_out); -- shifting recv data to value
wait until rising_edge (Ck);
wait until rising_edge (Ck);
wait until rising_edge (Ck);
value_out <= (others => '0');
end process stim_proc_out;

assert_proc : process -- assert
variable ones : std_logic := '1';
begin
wait until stop = '1'; -- wait for cycles ticks
assert (to_integer (unsigned (value_in)) * multiply = to_integer (unsigned (value_out))) -- assert x*multiply=y
  report 
    integer'image (to_integer (unsigned (value_in)) * multiply) &
    " /= " &
    integer'image (to_integer (unsigned (value_out)));
l0 : for i in 0 to cycles-1 loop
  ones := ones and value_in (i);
end loop l0;
assert (ones = '0') report "value_in 1_1" severity note; -- debug
end process assert_proc;

cycles_proc : process (Ck) is -- cycles for uut multipler
  variable i : integer range 0 to cycles+multiply+1;
begin
  if (Reset = '0') then
    i := 0;
  elsif (rising_edge (Ck)) then
    if (i = cycles+multiply+1) then
      stop <= '1'; -- finish multiply
      i := 0;
    else
      stop <= '0';
      i := i + 1;
    end if;
  end if;
end process cycles_proc;

END;
