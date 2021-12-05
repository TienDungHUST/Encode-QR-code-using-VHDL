library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

---------------------------------------------------
entity encoding_block is
	port (
		-- 9 std_logic_vector for checking results
		cout1: out std_logic_vector(0 to 7);
		cout2: out std_logic_vector(0 to 7);
		cout3: out std_logic_vector(0 to 7);
		cout4: out std_logic_vector(0 to 7);
		cout5: out std_logic_vector(0 to 7);
		cout6: out std_logic_vector(0 to 7);
		cout7: out std_logic_vector(0 to 7);
		cout8: out std_logic_vector(0 to 7);
		cout9: out std_logic_vector(0 to 7)
		);
end encoding_block;
---------------------------------------------------
architecture behavior of encoding_block is
	type input_array is array (0 to 5) of integer range 0 to 9;			-- array type of 6 input number
	type output_numbs is array (0 to 8) of integer range 0 to 255;		-- array type of 9 output numbers
	type output_bytes is array (0 to 8) of std_logic_vector(0 to 7);	-- array type of 9 output bytes
	signal X: input_array;
	signal module_indi: 	std_logic_vector(0 to 3);
	signal count_indi:	std_logic_vector(0 to 9);
	signal I1: integer range 0 to 999;
	signal I2: integer range 0 to 999;
	signal O1: std_logic_vector(0 to 9);
	signal O2: std_logic_vector(0 to 9);
	signal pad_bytes: std_logic_vector (0 to 37);
	signal final_bit_vector: std_logic_vector (0 to 71);
	signal final_numbs_array: output_numbs;
	signal final_bytes_array: output_bytes;
begin
	X <= (8, 6, 7, 5, 3, 0);
	module_indi <= "0001";													-- Mode indicator of Numeric mode
	count_indi  <= conv_std_logic_vector(6, count_indi'length);	-- 10 bits indicate the lengtg of array
	I1 <= X(0)*100 + X(1)*10 + X(2);										-- value of first 3 numbers
	I2 <= X(3)*100 + X(4)*10 + X(5);										-- value of second 3 numbers
	O1 <= conv_std_logic_vector(I1, O1'length);						-- convert to stc_logic_vector
	O2 <= conv_std_logic_vector(I2, O2'length);						-- convert to stc_logic_vector
	pad_bytes <= "00000011101100000100011110110000010001";		-- add pad bytes to fill array of 72 bits
	final_bit_vector <= module_indi & count_indi & O1 & O2 & pad_bytes;		-- combine all to 72 bits
	
	-- convert 72 bits to 9 bytes and calculate decimal value
	G1: for i in 0 to 8 generate
		final_numbs_array(i) <= conv_integer(unsigned(final_bit_vector((i*8) to ((i+1)*8 -1 ))));
		final_bytes_array(i)	<= final_bit_vector((i*8) to ((i+1)*8 -1 ));
	end generate;
	
	-- revert decimal valua to std_logic_vector for checking
	cout1 <= final_bytes_array(0); --conv_std_logic_vector(final_numbs_array(0), 8);
	cout2 <= final_bytes_array(1); --conv_std_logic_vector(final_numbs_array(1), 8);
	cout3 <= final_bytes_array(2); --conv_std_logic_vector(final_numbs_array(2), 8);
	cout4 <= final_bytes_array(3); --conv_std_logic_vector(final_numbs_array(3), 8);
	cout5 <= final_bytes_array(4); --conv_std_logic_vector(final_numbs_array(4), 8);
	cout6 <= final_bytes_array(5); --conv_std_logic_vector(final_numbs_array(5), 8);
	cout7 <= final_bytes_array(6); --conv_std_logic_vector(final_numbs_array(6), 8);
	cout8 <= final_bytes_array(7); --conv_std_logic_vector(final_numbs_array(7), 8);
	cout9 <= final_bytes_array(8); --conv_std_logic_vector(final_numbs_array(8), 8);
end behavior;
--------------------------------------------------
	