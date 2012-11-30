library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
    generic (TS : time := 0.11 ns; TC : time := 0.1 ns);
	 Port ( x 		: in bit;
           y 		: in bit;
           Cin 	: in bit;
           Cout 	: out bit;
           Sum 	: out bit);
end full_adder;

architecture Behavioral of full_adder is
begin
Sum <= x xor y xor Cin after TS;
Cout <= (x and y) or (x and Cin) or (Y and Cin) after TC;
end Behavioral;

