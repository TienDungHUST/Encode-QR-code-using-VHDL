Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity top_entity is
port (
	clk : in std_logic;
	input_nbr : in integer range 100000 to 999999;
	outp_bin : out std_logic_vector (207 downto 0)
);
end entity;
architecture bhv of top_entity is

component array_outp 
port (
	clk : in std_logic;
	input_nbr : in integer range 100000 to 999999;
	full_array_int : out int_array
);
end component;

component output_bin
port (
	full_array_int : in int_array;
	outp_bin : out std_logic_vector (207 downto 0)
);
end component;

signal temp : int_array;

BEGIN
x1 : array_outp port map (clk, input_nbr, temp);
x2 : output_bin port map (temp, outp_bin);

end bhv;