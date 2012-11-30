library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flipflop is
    generic(TRQ : time := 2 ns; TCQ : time := 2 ns);
	 Port ( clr : in  bit;
           clk : in  bit;
           d : in  bit;
           Q : out  bit;
           QB : out  bit);
end D_flipflop;

architecture Behavioral of D_flipflop is
signal Qi : bit;
begin
QB <= not Qi;
Q <= Qi;
	process (clk, clr) begin
		if clr = '1' then Qi <= '0' after TRQ;
		elsif clk'event and clk = '1'
			then Qi <= d after TCQ;
		end if;
	end process;
end Behavioral;

