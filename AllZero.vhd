library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AllZero is
	generic ( TPD : time := 1 ns);
	port ( 	x : in bit_vector;
				f : out bit);
end AllZero;

architecture Behavioral of AllZero is
begin
	process (x)
	begin
		f <= '1' after TPD;
		for j in x'range loop
			if x(j) = '1' then 
				f <= '0' after TPD;
			end if;
		end loop;
	end process;
end Behavioral;

