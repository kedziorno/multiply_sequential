library IEEE;
use IEEE.STD_LOGIC_1164.all;

USE ieee.numeric_std.ALL;

package pkg_test is

constant cycles : integer := 32;
constant no_values_power2 : integer := 20;

procedure shift_out (
  signal i_IN : out std_logic; 
  signal Ck : in std_logic;
  constant value : in unsigned
);

procedure shift_in (
  signal o_O1 : in std_logic; 
  signal Ck : in std_logic;
  signal value : out unsigned
);

end pkg_test;

package body pkg_test is

procedure shift_out (
  signal i_IN : out std_logic; 
  signal Ck : in std_logic;
  constant value : in unsigned
) is
begin
  l0 : for i in 0 to cycles-1 loop
    i_IN <= to_x01(value (i));
    wait until rising_edge (Ck);
  end loop l0;
end procedure shift_out;

procedure shift_in (
  signal o_O1 : in std_logic; 
  signal Ck : in std_logic;
  signal value : out unsigned
) is
begin
  l0 : for i in 0 to cycles-1 loop
    value (i) <= o_O1;
    wait until rising_edge (Ck);
  end loop l0;
end procedure shift_in;
 
end pkg_test;
