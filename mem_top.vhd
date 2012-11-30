library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mem_top is
    Port ( a : in  std_logic_vector (7 downto 0);
           b : in  std_logic_vector (7 downto 0);
			  start : in std_logic;
           clk : in  std_logic;
           reset : in  std_logic;
           done : out  std_logic;
           result : out  std_logic_vector (15 downto 0);
			  save2 : out std_logic;
			  checkE18 : in std_logic
			  );

end mem_top;

architecture Behavioral of mem_top is
signal sraa, srbb, ADDout, MUXout, REGout : bit_vector(15 downto 0);
signal zero, init, shift, add, low: bit := '0'; signal high: bit := '1';
signal f, OFL, REGclr:bit;
signal aa, bb : bit_vector(7 downto 0);
signal startt,clkt,resett,donet : bit:= '0';

component ShiftReg is
	generic ( TCQ : time := 0.3 ns; TLQ : time := 0.5 ns;
				 TSQ : time := 0.7 ns);
	port (clk, clr, l, sh, dir : in bit;
			d: in bit_vector;
			Q: out bit_vector);
end component;

component AllZero is
	generic ( TPD : time := 1 ns);
	port ( 	x : in bit_vector;
				f : out bit);
end component;
 
component rippleCarry_adder16 is
    Port ( aa		: in bit_vector (15 downto 0);
           bb 		: in bit_vector (15 downto 0);
           Cin 	: in bit;
           Cout 	: out bit;
           Sum 	: out bit_vector (15 downto 0));
end component;

component multiplexer16bit is
	generic( TPD : time := 1 ns);
	port ( 	aa : in bit_vector(15 downto 0);
				bb	: in bit_vector(15 downto 0);
				Sel : in bit := '0';
				y : out bit_vector(15 downto 0));
end component;

component register16bit is
    Port ( d : in  bit_vector (15 downto 0);
           clk : in  bit;
           clr : in  bit;
           Q : out  bit_vector (15 downto 0));
end component;

component State_m is
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
end component;

begin
process(checkE18)
begin
	if (checkE18 ='1') then
		save2 <='1';
	end if;
end process;
aa <= to_bitvector(a);
bb <= to_bitvector(b);
startt <= to_bit(start);
clkt <= to_bit(clk);
resett <=to_bit(reset);
done <= to_stdUlogic(donet);

Regclr <= init or resett;
result <= to_stdlogicvector(REGout);
SR1 : ShiftReg 
port map(clk=>clkt, 
clr=>resett,
 l => init, 
 sh => shift,
 dir => low,
 d=>aa, 
 Q=>sraa);
 
SR2 : ShiftReg port map(clk=>clkt, clr=>resett, l=> init,sh=>shift,dir=>high, d=>bb, Q=> srbb);
Z1 : AllZero port map(x=>sraa, f=>zero);
A1 : RippleCarry_adder16 port map(aa=> srbb, bb => REGout, Cin=>low,Cout=>OFL, Sum =>ADDout);
M1 : multiplexer16bit port map(aa=>ADDout, bb=>REGout, sel => add, y=>MUXout);
R1 : register16bit port map(d=>MUXout, Q=>REGout, clk=>clkt, clr=> REGclr);
F1 : State_m port map(startt, clkt, sraa(0),zero,resett,init,shift,add,donet);

end Behavioral;

