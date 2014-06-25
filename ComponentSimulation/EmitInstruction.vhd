

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- EmitInstruction is a component that emits the instruction and pc to a multi-character display / LED 

entity EmitInstruction is
	Port( 
			clock : in STD_LOGIC; 
			instruction : in STD_LOGIC_VECTOR(31 downto 0)
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

