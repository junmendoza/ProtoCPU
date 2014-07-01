

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- EmitInstruction is a component that emits the instruction to a multi-character display / LED 

entity EmitInstruction is
	Port( 
			clock : in STD_LOGIC; 
			instruction : in STD_LOGIC_VECTOR(31 downto 0);
			LCD_DB7 : out STD_LOGIC;
			LCD_DB6 : out STD_LOGIC;
			LCD_DB5 : out STD_LOGIC;
			LCD_DB4 : out STD_LOGIC;
			LCD_DB3 : out STD_LOGIC;
			LCD_DB2 : out STD_LOGIC;
			LCD_DB1 : out STD_LOGIC;
			LCD_DB0 : out STD_LOGIC;
			LCD_E   : out STD_LOGIC;
			LCD_RS  : out STD_LOGIC;
			LCD_RW  : out STD_LOGIC
		 );
end EmitInstruction;

architecture Behavioral of EmitInstruction is
	
begin

	EmitData : process(clock, instruction)
	begin
		ClockSync : if rising_edge(clock) then
			
		end if ClockSync;
	end process EmitData;

end Behavioral;

