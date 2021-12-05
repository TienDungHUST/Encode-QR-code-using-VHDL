Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity bin_conv_to_integer is
port (
	inp1: in std_logic_vector (7 DOWNTO 0); 
	outp : out integer
);
end bin_conv_to_integer;

architecture bhv of bin_conv_to_integer is
begin
	outp <= to_integer(unsigned(inp1));
end bhv;