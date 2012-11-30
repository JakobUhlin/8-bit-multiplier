library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer16bit is
	generic( TPD : time := 1 ns);
	port ( aa : in bit_vector(15 downto 0);
			bb	: in bit_vector(15 downto 0);
			Sel : in bit := '0';
			y : out bit_vector(15 downto 0));
end multiplexer16bit;

architecture Behavioral of multiplexer16bit is
begin
	y <= aa after TPD when Sel = '1' else bb after TPD;
end Behavioral;

