----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:35 10/07/2012 
-- Design Name: 
-- Module Name:    sign_collect - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_collect is
    Port ( inp : in  STD_LOGIC_VECTOR (7 downto 0);
           save : in  STD_LOGIC;
			  checkedE18 : in std_logic;
			  savea : out std_logic;
			  we : out std_logic;
           d : out  STD_LOGIC_VECTOR (7 downto 0)
			);
end sign_collect;

architecture Behavioral of sign_collect is

begin
process(save,checkedE18)
  begin
			if (save = '1') then
				we <= '1';
				savea <= '1';
			elsif (checkedE18 = '1') then
				we <='1';
				savea <= '0';
			end if;
			
			d<=inp;
end process;
end Behavioral;

