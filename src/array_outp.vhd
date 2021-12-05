Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity array_outp is
port (
	clk : in std_logic;
	input_nbr : in integer range 100000 to 999999;
	full_array_int : out int_array
);
end entity;
architecture bhv of array_outp is

signal array_out_number : int_array;
signal array_out_gener: int_array;
component input_number
port (
	input_nbr : in integer range 100000 to 999999;
	output_integer: out int_array
);
end component;
component generer_ecc
port (
	clk: in std_logic;
	mes_poly_nbr: in int_array;
	ecc_out : out int_array
);
end component;
component full_array_outp is
port (
	intput_array_number : in int_array;
	intput_array_gener : in int_array;
	full_array_out : out int_array
);
end component;


BEGIN
u1 :	input_number port map (input_nbr, array_out_number);
u2 :	generer_ecc port map (clk, array_out_number, array_out_gener);
u3 : full_array_outp port map (array_out_number, array_out_gener, full_array_int);

end bhv;