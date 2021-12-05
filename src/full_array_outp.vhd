Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity full_array_outp is
port (
	intput_array_number : in int_array;
	intput_array_gener : in int_array;
	full_array_out : out int_array
);
end entity;


architecture bhv of full_array_outp is
signal temp : int_array;

BEGIN
	temp(25 downto 17) <= intput_array_number(25 downto 17);
	temp(16 downto 0) <= intput_array_gener(16 downto 0);
	full_array_out <= temp;
end architecture;