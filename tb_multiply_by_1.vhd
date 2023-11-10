--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:42:14 11/08/2023
-- Design Name:   
-- Module Name:   /home/user/workspace/Deeds/multiply_seq/tb_multiply_by_1.vhd
-- Project Name:  multiply
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiply_by_1
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
USE ieee.numeric_std.ALL;

USE work.pkg_test.all;

ENTITY tb_multiply_by_1 IS
END tb_multiply_by_1;

ARCHITECTURE behavior OF tb_multiply_by_1 IS 

-- Component Declaration for the Unit Under Test (UUT)
COMPONENT multiply_by_1
PORT(
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

constant Ck_period : time := 10 ns;

signal start,stop : bit := '0';

signal value_in : unsigned (cycles-1 downto 0) := (others => '0');
signal value_out : unsigned (cycles-1 downto 0) := (others => '0');

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut_m1 : multiply_by_1 PORT MAP (
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
start <= '0'; Reset <= '0'; wait for Ck_period; Reset <= '1'; start <= '1';
value_in <= to_unsigned (80074*1, cycles);
wait for (cycles+3)*Ck_Period;

start <= '0'; Reset <= '0'; wait for Ck_period; Reset <= '1'; start <= '1';
value_in <= to_unsigned (55555*1, cycles);
wait for (cycles+3)*Ck_Period;

start <= '0'; Reset <= '0'; wait for Ck_period; Reset <= '1'; start <= '1';
value_in <= to_unsigned (11111*1, cycles);
wait for (cycles+3)*Ck_Period;

wait;
end process reset_proc;

-- Stimulus processes
stim_proc_in : process
begin
wait until start = '1';
shift_out (i_IN, Ck, value_in);
wait until rising_edge (Ck);
i_IN <= '0';
--wait;
end process stim_proc_in;

stim_proc_out : process
begin
wait until start = '1';
wait until rising_edge (Ck);
wait until rising_edge (Ck);
wait until rising_edge (Ck);
shift_in (o_O1, Ck, value_out);
--wait;
end process stim_proc_out;

assert_proc : process
begin
wait until stop = '1';
assert (to_integer (unsigned (value_in)) = to_integer (unsigned (value_out)))
  report 
    integer'image (to_integer (unsigned (value_in))) &
    " /= " &
    integer'image (to_integer (unsigned (value_out)));
wait for Ck_period;
--report "tb done" severity failure;
end process assert_proc;

cycles_proc : process (Ck) is
  variable i : integer range 0 to cycles+2;
begin
  if (Reset = '0') then
    i := 0;
  elsif (rising_edge (Ck)) then
    if (i = cycles+2) then
      stop <= '1';
      i := 0;
    else
      stop <= '0';
      i := i + 1;
    end if;
  end if;
end process cycles_proc;

END;
