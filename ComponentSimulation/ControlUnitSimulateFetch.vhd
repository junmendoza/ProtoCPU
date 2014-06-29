
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


use work.cpu_types.ALL;

entity ControlUnitSimulateFetch is
    Port( 
			 clock   : in STD_LOGIC;
			 reset   : in STD_LOGIC;
			 result  : out STD_LOGIC;
			 LCD_E   : out STD_LOGIC;
			 LCD_RS  : out STD_LOGIC;
			 LCD_RW  : out STD_LOGIC;
			 LCD_DB7 : out STD_LOGIC;
			 LCD_DB6 : out STD_LOGIC;
			 LCD_DB5 : out STD_LOGIC;
			 LCD_DB4 : out STD_LOGIC;
			 LCD_DB3 : out STD_LOGIC;
			 LCD_DB2 : out STD_LOGIC;
			 LCD_DB1 : out STD_LOGIC;
			 LCD_DB0 : out STD_LOGIC
		  );
			
end ControlUnitSimulateFetch;


architecture Behavioral of ControlUnitSimulateFetch is

	component Fetch is 
		Port( 
				clock : in STD_LOGIC; 
				sel_getnextpc : in STD_LOGIC;
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component EmitInstruction is
		Port( 
				clock : in STD_LOGIC; 
				instruction : in STD_LOGIC_VECTOR(31 downto 0);
				LCD_E   : out STD_LOGIC;
				LCD_RS  : out STD_LOGIC;
				LCD_RW  : out STD_LOGIC;
				LCD_DB7 : out STD_LOGIC;
				LCD_DB6 : out STD_LOGIC;
				LCD_DB5 : out STD_LOGIC;
				LCD_DB4 : out STD_LOGIC;
				LCD_DB3 : out STD_LOGIC;
				LCD_DB2 : out STD_LOGIC;
				LCD_DB1 : out STD_LOGIC;
				LCD_DB0 : out STD_LOGIC
			 );
	end component EmitInstruction;
	
--	component EndProgram is
--		Port( 
--				endexecution : in  STD_LOGIC
--			 );
--	end component EndProgram;
	
	 
	signal R2 : STD_LOGIC_VECTOR(31 downto 0); 
	signal nextPC : STD_LOGIC_VECTOR(31 downto 0); 
	
begin
	
	FetchInstruction : Fetch port map
	(
		clock => clock, 
		sel_getnextpc => '1',	-- in fetch op
		pc => nextPC, 				-- in current pc
		instr => R2					-- out next instruction -> ID
	);
	
	Emit : EmitInstruction port map
	(
		clock => clock, 
		instruction => R2,
		LCD_E   => LCD_E,   
		LCD_RS  => LCD_RS,  
		LCD_RW  => LCD_RW, 
		LCD_DB7 => LCD_DB7, 
		LCD_DB6 => LCD_DB6, 
		LCD_DB5 => LCD_DB5, 
		LCD_DB4 => LCD_DB4, 
		LCD_DB3 => LCD_DB3, 
		LCD_DB2 => LCD_DB2, 
		LCD_DB1 => LCD_DB1, 
		LCD_DB0 => LCD_DB0 
	);
	
--	EndProgramExecution : EndProgram port map 
--	(
--		endexecution	=> ID_endprogram			
--	);
	
end architecture Behavioral;

