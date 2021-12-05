Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;

entity output_bin is
port (
	full_array_int : in int_array;
	outp_bin : out std_logic_vector (207 downto 0)
);

end entity;

architecture bhv of output_bin is


BEGIN
	outp_bin (207 downto 200) <= std_logic_vector(to_unsigned(full_array_int(25),8));
	outp_bin (199 downto 192) <= std_logic_vector(to_unsigned(full_array_int(24),8));
	outp_bin (191 downto 184) <= std_logic_vector(to_unsigned(full_array_int(23),8));
	outp_bin (183 downto 176) <= std_logic_vector(to_unsigned(full_array_int(22),8));
	outp_bin (175 downto 168) <= std_logic_vector(to_unsigned(full_array_int(21),8));
	outp_bin (167 downto 160) <= std_logic_vector(to_unsigned(full_array_int(20),8));
	outp_bin (159 downto 152) <= std_logic_vector(to_unsigned(full_array_int(19),8));
	outp_bin (151 downto 144) <= std_logic_vector(to_unsigned(full_array_int(18),8));
	outp_bin (143 downto 136) <= std_logic_vector(to_unsigned(full_array_int(17),8));
	
	outp_bin (135 downto 128) <= std_logic_vector(to_unsigned(full_array_int(16),8));
	outp_bin (127 downto 120) <= std_logic_vector(to_unsigned(full_array_int(15),8));
	outp_bin (119 downto 112) <= std_logic_vector(to_unsigned(full_array_int(14),8));
	outp_bin (111 downto 104) <= std_logic_vector(to_unsigned(full_array_int(13),8));
	outp_bin (103 downto 96) <= std_logic_vector(to_unsigned(full_array_int(12),8));
	outp_bin (95 downto 88) <= std_logic_vector(to_unsigned(full_array_int(11),8));
	outp_bin (87 downto 80) <= std_logic_vector(to_unsigned(full_array_int(10),8));
	outp_bin (79 downto 72) <= std_logic_vector(to_unsigned(full_array_int(9),8));
	outp_bin (71 downto 64) <= std_logic_vector(to_unsigned(full_array_int(8),8));
	outp_bin (63 downto 56) <= std_logic_vector(to_unsigned(full_array_int(7),8));
	outp_bin (55 downto 48) <= std_logic_vector(to_unsigned(full_array_int(6),8));
	outp_bin (47 downto 40) <= std_logic_vector(to_unsigned(full_array_int(5),8));
	outp_bin (39 downto 32) <= std_logic_vector(to_unsigned(full_array_int(4),8));
	outp_bin (31 downto 24) <= std_logic_vector(to_unsigned(full_array_int(3),8));
	outp_bin (23 downto 16) <= std_logic_vector(to_unsigned(full_array_int(2),8));
	outp_bin (15 downto 8) <= std_logic_vector(to_unsigned(full_array_int(1),8));
	outp_bin (7 downto 0) <= std_logic_vector(to_unsigned(full_array_int(0),8));


end architecture;