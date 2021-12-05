Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;


entity input_number is
port (
	input_nbr : in integer range 100000 to 999999 ;
	output_integer: out int_array  
);
constant mode_array : std_logic_vector (13 downto 0 ) := "00010000000110";
constant pad_byte : std_logic_vector (37 downto 0 ) := "00000011101100000100011110110000010001";
end entity;

architecture bhv of input_number is
	signal temp1 : integer;
	signal temp2 : integer;
	signal temp_array_1 : std_logic_vector (9 downto 0);
	signal temp_array_2 : std_logic_vector (9 downto 0);
	signal temp_vector : int_array_vector ;
	signal output_bin : std_logic_vector (71 downto 0);
	
	component int_conv_to_bin 
	port (
	inp1: in integer; 
	outp : out std_logic_vector (9 DOWNTO 0)
	);
	end component;
	component bin_conv_to_integer
	port (
	inp1: in std_logic_vector (7 DOWNTO 0); 
	outp : out integer
	);
	end component;
BEGIN

	temp_array_1 <= std_logic_vector(to_unsigned((input_nbr / 1000),10));
	temp_array_2 <= std_logic_vector(to_unsigned((input_nbr REM 1000),10));

	output_bin <= mode_array & temp_array_1 & temp_array_2 & pad_byte;
	
	output_integer(25) <= to_integer(unsigned(output_bin(71 downto 64)));
	output_integer(24) <= to_integer(unsigned(output_bin(63 downto 56)));
	output_integer(23) <= to_integer(unsigned(output_bin(55 downto 48)));
	output_integer(22) <= to_integer(unsigned(output_bin(47 downto 40)));
	output_integer(21) <= to_integer(unsigned(output_bin(39 downto 32)));
	output_integer(20) <= to_integer(unsigned(output_bin(31 downto 24)));
	output_integer(19) <= to_integer(unsigned(output_bin(23 downto 16)));
	output_integer(18) <= to_integer(unsigned(output_bin(15 downto 8)));
	output_integer(17) <= to_integer(unsigned(output_bin(7 downto 0)));
	

	output_integer (16 downto 0) <= (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

END bhv;