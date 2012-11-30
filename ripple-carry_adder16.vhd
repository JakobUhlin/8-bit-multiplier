library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rippleCarry_adder16 is
    Port ( aa 		: in bit_vector (15 downto 0);
           bb 		: in bit_vector (15 downto 0);
           Cin 	: in bit;
           Cout 	: out bit;
           Sum 	: out bit_vector (15 downto 0));
end rippleCarry_adder16;

architecture Behavioral of rippleCarry_adder16 is
component full_adder
port(x,y,Cin : in bit; Cout, Sum : out bit);
end component;
signal C: bit_vector(15 downto 0);
begin
Stages : for i in 15 downto 0 generate
				LowBit: if i = 0 generate
				FA: full_adder port map(AA(0), BB(0), Cin, C(0), Sum(0));
				end generate;
				OtherBits: if i /= 0 generate
				FA: full_adder port map(AA(i), BB(i), C(i-1), C(i), Sum(i));
				end generate;
			end generate;
	Cout <= C(15);
end Behavioral;

