----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:15 10/09/2012 
-- Design Name: 
-- Module Name:    adressgen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adressgen is
    Port ( savea : in  STD_LOGIC;
			  save2 : in std_logic;
			  result: in std_logic;
           adressgen1 : out  STD_LOGIC_VECTOR (3 downto 0);
			  adressgen2 : out std_logic_vector(3 downto 0)
);
end adressgen;

architecture Behavioral of adressgen is

begin
process(savea,save2)
	begin
		if savea = '1' then
			adressgen1 <= "0001";
		elsif save2 = '1' then
			adressgen1 <= "0010";
		elsif result = '1' then
			adressgen1 <= "0010";
			adressgen2 <= "0001";
--			adressgen2 <= "0001";
--			if save2 = '0' then
--				adressgen1 <= "0010";
--			adressgen2 <= "0001";
--			end if;
	end if;
end process;
end Behavioral;

