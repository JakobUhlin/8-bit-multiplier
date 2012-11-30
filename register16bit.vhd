library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity register16bit is
    Port ( d : in  bit_vector (15 downto 0);
           clk : in  bit;
           clr : in  bit;
           Q : out  bit_vector (15 downto 0));
end register16bit;

architecture Structure of register16bit is
component D_flipflop
		port (clr, clk, d: in bit; Q, QB : out bit);
end component;
begin
	STAGES: for i in 15 downto 0 generate
	FF: D_flipflop port map (clr, clk, d(i), Q(i), open);
	end generate;
end Structure;

