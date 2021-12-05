Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use STD.TEXTIO.ALL;
Library work;
use work.my_package.all;

entity input_number_tb is
end input_number_tb;

architecture tb of input_number_tb is

COMPONENT input_number 
port (
	input_nbr : in integer range 100000 to 999999;
	output_integer: out int_array
);
END component;

	signal input_nbr : integer range 100000 to 999999 :=161998 ;
	signal output_integer: int_array;
	FILE file_output : text open WRITE_MODE is "test_input_number.txt";
	signal clk 			:  std_logic := '1';
	--signal temp : std_logic_vector (207 downto 0);
	constant clk_period : time := 20 ns;
	
BEGIN


UUT:  entity work.input_number 
		port map ( input_nbr => input_nbr, output_integer => output_integer);
clk_process : process
		 begin
	  clk <= '1';
	  wait for clk_period/2;
	  clk <= '0';
	  wait for clk_period/2;
		end process clk_process;
		
	
	 
check: process (clk)
	variable str: line;
	 begin
	 if  (rising_edge (clk)) then
	 --temp <= TO_BITVECTOR();
	 print_to_file_integer(output_integer, file_output);
	 end if;
	 end process check;
	 
END;
