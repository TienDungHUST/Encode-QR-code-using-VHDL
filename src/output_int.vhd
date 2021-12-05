Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity array_outp is
port (
	clk : in std_logic;
	input_int : in integer range 100000 to 999999;
	ecc_out : int_array
);
end entity;
architecture bhv of array_outp is
signal array_tg : int_array;

component input_number
port (
	input_number : in integer range 100000 to 999999;
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


BEGIN
u1 :	input_number port map (input_int, array_tg);
u2 :	generer_ecc port map (clk, array_tg, ecc_out);
	ecc_out (25 downto 17) <=  array_tg(25 downto 17);

end bhv;