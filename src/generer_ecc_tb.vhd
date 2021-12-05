Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use STD.TEXTIO.ALL;
Library work;
use work.my_package.all;

entity generer_ecc_tb is
end generer_ecc_tb;

architecture tb of generer_ecc_tb is

COMPONENT generer_ecc 
port (
	clk: in std_logic;
	mes_poly_nbr: in int_array;
	ecc_out : out int_array
);
END component;

	signal clk 			:  std_logic := '1';
	signal mes_poly_nbr: int_array := (16,24,161,249,128,236,17,236,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
	signal ecc_out :  int_array;
	
	constant clk_period : time := 20 ns;
	
BEGIN
clk_process : process
		 begin
	  clk <= '1';
	  wait for clk_period/2;
	  clk <= '0';
	  wait for clk_period/2;
		end process clk_process;

UUT:  entity work.generer_ecc 
		port map (clk => clk, mes_poly_nbr => mes_poly_nbr, ecc_out => ecc_out);
		
	 
END;
