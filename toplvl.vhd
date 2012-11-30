----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:58 10/06/2012 
-- Design Name: 
-- Module Name:    toplvl - Behavioral 
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

-- Uncomment the fol lowing library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplvl is
    Port ( switches : in std_logic_vector(7 downto 0);
			  Saveing2 : in std_logic;
			  clk 	  : in std_logic;
			  save	  : in std_logic;
			  pushforresult : in std_logic;
			  resetera      : in std_logic;
			  klarkoppladtilldone : out std_logic;
			  segmenten				 : out std_logic_vector(7 downto 0);
			  ut       				 : out std_logic_vector (7 downto 0);
	        anoderna 				 : out std_logic_vector(3 downto 0)
				);
end toplvl;
 
architecture Behavioral of toplvl is

signal adress	: std_logic_vector(3 downto 0); 
signal adress2 : std_logic_vector(3 downto 0); 
signal weable	: std_logic;
signal data		: std_logic_vector(7 downto 0);
signal saving 	: std_logic;
signal savingsec : std_logic;
signal tal1 	: std_logic_vector (7 downto 0);
signal tal2 	: std_logic_vector (7 downto 0);
signal result 	: std_logic_vector(7 downto 0);

signal thisisit : std_logic_vector(15 downto 0);
------------Collect the signals from Top level inputs-----------
COMPONENT sign_collect
  PORT (
	inp 		: in std_logic_vector(7 downto 0);
	save 		: in std_logic;
	checkedE18 : in std_logic;
	d 			: out std_logic_vector(7 downto 0);
	we 		: out std_logic;
	savea 	: out std_logic
	);
END COMPONENT;

-----------------------	
COMPONENT Memory1
  PORT (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    dpo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

------------Generates 4bits adress for the memory-----------	
COMPONENT Adressgen
  PORT (
	savea			: in std_logic;
	save2			: in std_logic;
	result		: in std_logic;
	adressgen1	: out std_logic_vector(3 downto 0);
	adressgen2	: out std_logic_vector(3 downto 0)
  );
END COMPONENT;


------------Collects two signals and multiply them with eachother-----------
COMPONENT mem_top
  PORT (
	a			: in  std_logic_vector (7 downto 0);
   b			: in  std_logic_vector (7 downto 0);
	start 	: in	std_logic;
   clk 		: in  std_logic;
   reset 	: in  std_logic;
	checkE18 : in	std_logic;
   done 		: out std_logic;
   result	: out std_logic_vector (15 downto 0);
	save2 	: out std_logic
  );
END COMPONENT;

Component display
  PORT (
	clk		: in std_logic;
	result	: in  std_logic_vector (15 downto 0);
	resulte	: in std_logic;
   segments : out  std_logic_vector (7 downto 0);
	anode 	: out std_logic_vector(3 downto 0)		 
  );
end component;

----Starting all signal declaration here.
begin

mymemory : Memory1
  PORT MAP (
    a 	=> adress,
    d 	=> data,
    dpra => adress2,
    clk 	=> clk,
    we 	=> weable,
    spo 	=> tal1,
    dpo 	=> tal2
  );

portarna : sign_collect
	PORT MAP (
	inp	=> switches,	
	d 		=> data,
	we 	=> weable,
	save	=> save,
	savea => saving,
	checkedE18 => Saveing2
	);
	
adressgenerator : Adressgen
	PORT MAP (
	savea 		=> saving,
	save2 		=> savingsec,
	adressgen1	=> adress,
	adressgen2	=> adress2,
	result 		=> pushforresult
	);

vadsomhelst : mem_top
  PORT MAP (
    clk			=> clk,
    a				=> tal1,
    b				=> tal2,
    result		=> thisisit,
	 save2		=> savingsec,
	 checkE18	=> Saveing2,
	 start 		=> Saveing2,
	 done 		=> klarkoppladtilldone,
	 reset		=> resetera
   );
 
displayendu : display
  PORT MAP (
	clk		=> clk,
	result	=> thisisit,
	resulte	=> pushforresult,
   segments => segmenten,
	anode		=> anoderna
	);

process(tal2,adress)
begin
	ut <=tal2(7 downto 0);

end process;	
end Behavioral;