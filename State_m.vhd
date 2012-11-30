library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity State_m is
    generic ( TPD : time := 1 ns);
	 Port ( start : in  bit;
           clk : in  bit;
           lsb : in  bit;
           stop : in  bit;
           reset : in  bit;
           init : out  bit;
           shift : out  bit;
           add : out  bit;
           done : out  bit);
end State_m;

architecture moore of State_m is
type statetype is (I, C, A, S, E);
signal state : statetype;
begin
init <= '1' after TPD when state = I
		else '0' after TPD;
add <= '1' after TPD when state = A
		else '0' after TPD;
shift <= '1' after TPD when state = S
		else '0' after TPD;
done <= '1' after TPD when state = E
		else '0' after TPD;
		
	process(clk, reset)
	begin
		if reset = '1' then state <= E;
		elsif clk'event and clk = '1' then
			case state is
			when I => state <= C;
			when C =>
					if lsb = '1' then state <= A;
					elsif stop = '0' then state <= S;
					else state <= E;
					end if;
			when A => state <= S;
			when S => state <= C;
			when E =>
					if start = '1' then state <= I;
					end if;
			end case;
		end if;
	end process;
end moore;

