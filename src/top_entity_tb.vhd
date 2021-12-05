Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use STD.TEXTIO.ALL;
Library work;
use work.my_package.all;

entity top_entity_tb is
end top_entity_tb;

architecture tb of top_entity_tb is

COMPONENT top_entity 
Port (
	clk 			: in std_logic;
	input_nbr 	: in integer range 100000 to 999999;
	outp_bin 	: out std_logic_vector (207 downto 0));
END component;

	signal clk 			:  std_logic := '1';
	signal input_nbr 	: integer range 100000 to 999999 :=161998;
	signal outp_bin 	: std_logic_vector (207 downto 0);
	signal outp_bin_TEMP : bit_vector (207 downto 0);
	signal clock_wr 	: Std_logic := '0';
	FILE file_output : text open WRITE_MODE is "test_log.txt";
	constant clk_period : time := 20 ns;
	constant clock_wr_period : time := 4860 ns;
	
BEGIN
clk_process : process
		 begin
	  clk <= '1';
	  wait for clk_period/2;
	  clk <= '0';
	  wait for clk_period/2;
		end process clk_process;

UUT:  entity work.top_entity 
		port map (clk => clk, input_nbr => input_nbr, outp_bin => outp_bin);
		
create_clock: process
	 begin
		wait for clock_wr_period;
	  clock_wr <= '1';
	  wait for clock_wr_period/2;
	  clock_wr <= '0';
	  wait for clock_wr_period/2;
	 end process create_clock;
	 
	outp_bin_TEMP <= TO_BITVECTOR(outp_bin);
		
check: process (clock_wr)
	variable str: line;
	 begin
	 if  (rising_edge (clock_wr)) then
	
		print_to_file(outp_bin_TEMP, file_output);
	
	 end if;
	 end process check;
	 
END;
