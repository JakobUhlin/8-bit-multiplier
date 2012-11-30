library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftReg is
	generic ( TCQ : time := 0.3 ns; TLQ : time := 0.5 ns;
				 TSQ : time := 0.7 ns);
	port (clk, clr, l, sh, dir : in bit;
			d: in bit_vector;
			Q: out bit_vector);
--	begin assert (d'length <= Q'length)
--			report "D wider than output Q" severity Failure;
end ShiftReg;

architecture Behavioral of ShiftReg is
begin
	Shift: process(clr, clk)
	subtype InB is natural range d'length-1 downto 0;
	subtype outB is natural range Q'length-1 downto 0;
	variable St: bit_vector(outB);
	begin
		if clr = '1' then	
			St := (others => '0');
			Q <= St after TCQ;
		elsif clk'event and clk = '1' then
			if l = '1' then
				St := (others => '0');
				St(InB) := d;
				Q <= St after TLQ;
			elsif sh = '1' then
				case dir is
				when '0' => St := '0' & St(St'left downto 1);
				when '1' => St := St(St'left-1 downto 0) & '0';
				end case;
				Q <= St after TSQ;
			end if;
		end if;
	end process;
end Behavioral;

