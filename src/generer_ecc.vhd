Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
Library work;
use work.my_package.all;
---------
entity generer_ecc is
port (
	clk: in std_logic;
	mes_poly_nbr: in int_array;
	ecc_out : out int_array
);
constant gen_poly : int_array := (0,43,139,206,78,43,239,123,206,214,147,24,99,150,39,243,163,136,0,0,0,0,0,0,0,0);
end generer_ecc;
---------
architecture rtl of  generer_ecc is
	signal temp1: int_array ;
	signal temp_tg : int_array;
	signal i : my_integer := 0;
	signal j : my_integer := 0;
begin

	process (clk)
		variable mes_poly_anpha : int_array ;
		variable mang_anpha : int_array ;
		variable mang_number : int_array ;
		variable arr1,arr2, arr_temp: std_logic_vector(7 downto 0);
	begin 
	  if(rising_edge (clk)) then 
			if( i < 26 ) then
				  				 
				  -- Nhân vô hương gen_poly voi phan tử đầu tiên của mes_poly_anpha
						if (j = 0) then
						 mes_poly_anpha(25) := Convert_number_to_anpha(mes_poly_nbr(25));
						 mang_anpha(25-i) := gen_poly(25-i) + mes_poly_anpha (25);
						 mang_anpha(25-i) := mang_anpha(25-i)rem 255;
						elsif(j=1) then
							mes_poly_anpha(24) := Convert_number_to_anpha(temp_tg(24));
							if (i<25) then
								mang_anpha(24-i) := gen_poly(25-i) + mes_poly_anpha(24);
								mang_anpha(24-i) := mang_anpha(24-i)rem 255;
								mang_anpha(25) := 256;
							end if;
						elsif (j=2) then
							mes_poly_anpha(23) := Convert_number_to_anpha(temp_tg(23));
							if (i<24) then
								mang_anpha(23-i) := gen_poly(25-i) + mes_poly_anpha(23);
								mang_anpha(23-i) := mang_anpha(23-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;
							end if;
						elsif (j=3) then
							mes_poly_anpha(22) := Convert_number_to_anpha(temp_tg(22));
							if (i<23) then
								mang_anpha(22-i) := gen_poly(25-i) + mes_poly_anpha(22);
								mang_anpha(22-i) := mang_anpha(22-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;
							end if;	
						elsif (j=4) then
							mes_poly_anpha(21) := Convert_number_to_anpha(temp_tg(21));
							if (i<22) then
								mang_anpha(21-i) := gen_poly(25-i) + mes_poly_anpha(21);
								mang_anpha(21-i) := mang_anpha(21-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;mang_anpha(22) := 256;
							end if;	
						elsif (j=5) then
							mes_poly_anpha(20) := Convert_number_to_anpha(temp_tg(20));
							if (i<21) then
								mang_anpha(20-i) := gen_poly(25-i) + mes_poly_anpha(20);
								mang_anpha(20-i) := mang_anpha(20-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;mang_anpha(22) := 256; mang_anpha(21) := 256;
							end if;	
						elsif (j=6) then
							mes_poly_anpha(19) := Convert_number_to_anpha(temp_tg(19));
							if (i<20) then
								mang_anpha(19-i) := gen_poly(25-i) + mes_poly_anpha(19);
								mang_anpha(19-i) := mang_anpha(19-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;mang_anpha(22) := 256; mang_anpha(21) := 256;mang_anpha(20) := 256;
							end if;
						elsif (j=7) then
							mes_poly_anpha(18) := Convert_number_to_anpha(temp_tg(18));
							if (i<19) then
								mang_anpha(18-i) := gen_poly(25-i) + mes_poly_anpha(18);
								mang_anpha(18-i) := mang_anpha(18-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;mang_anpha(22) := 256; mang_anpha(21) := 256;mang_anpha(20) := 256;mang_anpha(19) := 256;
							end if;		
						elsif (j=8) then
							mes_poly_anpha(17) := Convert_number_to_anpha(temp_tg(17));
							if (i<18) then
								mang_anpha(17-i) := gen_poly(25-i) + mes_poly_anpha(17);
								mang_anpha(17-i) := mang_anpha(17-i)rem 255;
								mang_anpha(25) := 256; mang_anpha(24) := 256;mang_anpha(23) := 256;mang_anpha(22) := 256; mang_anpha(21) := 256;mang_anpha(20) := 256;mang_anpha(19) := 256;mang_anpha(18) := 256;
							end if;		
						
						end if;

				  -- convert mảng mang_anpha dạng number sang number
				  mang_number(25-i) := Convert_anpha_to_number(mang_anpha(25-i)); 
				  -- Chuẩn bị cho phép xor
					arr1 := std_logic_vector(to_unsigned(mang_number(25-i),8));
					if (j=0) then
						arr2 := std_logic_vector(to_unsigned(mes_poly_nbr(25-i),8));
					else 
						arr2 := std_logic_vector(to_unsigned(temp_tg(25-i),8));
				  end if;
				  arr_temp := arr1 xor arr2;
				  temp1(25-i) <= to_integer(unsigned(arr_temp));
				  if ((25-i)<= (7-j)) then
				  temp1(25-i)<=0;
				  end if;
				  i <= i+1;
			 else 
				  i <= 0;
				  j <= j + 1;
				  temp_tg <= temp1;
				  if (j = 9) then
					j <= 0;
					end if;	
			end if;
	  end if;
	end process;
	 
	 ecc_out <= temp1;
	 
end rtl;