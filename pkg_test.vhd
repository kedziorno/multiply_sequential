--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

USE ieee.numeric_std.ALL;

package pkg_test is

--type stv is array (natural range <>) of unsigned;
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

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end pkg_test;

package body pkg_test is

procedure shift_out (
  signal i_IN : out std_logic; 
  signal Ck : in std_logic;
  constant value : in unsigned
) is
begin
  l0 : for i in value'reverse_range loop
    wait until rising_edge (Ck);
    i_IN <= to_x01(value (i));
  end loop l0;
end procedure shift_out;

procedure shift_in (
  signal o_O1 : in std_logic; 
  signal Ck : in std_logic;
  signal value : out unsigned
) is
variable v : unsigned (value'range) := (others => '1');
begin
  l0 : for i in v'reverse_range loop
--    report "v " & std_logic'image(o_O1);
    wait until rising_edge (Ck);
    v(i) := o_O1;
  end loop l0;
  value <= v;
end procedure shift_in;

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end pkg_test;
