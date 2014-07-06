

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- EmitInstruction is a component that emits the instruction to a multi-character display / LED 
-- Each fetched instruction is associated with one call to this component

entity EmitInstruction is
	Port( 
			clock 		: in STD_LOGIC; 
			reset 		: in STD_LOGIC; 
			instruction : in STD_LOGIC_VECTOR(31 downto 0);
			LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0); 
			LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
		 );
end EmitInstruction;

architecture Behavioral of EmitInstruction is

	type WRITE_STATE is(	WRITE_INIT, 
								WRITE_DATA
							 );
							 
	signal writeState : WRITE_STATE;
	constant WRITE_CLKWAIT : integer := 1;

begin

	EmitData : process(clock, instruction)
	
	variable clockCycles : integer;
		
	begin
		ClockSync : if rising_edge(clock) then
		
		-- From the Spartan3A user guide:
		
		-- To write data to the display, specify the start address, followed by one or more data values.
			
		-- Before writing any data, issue a Set DD RAM Address command to specify the initial seven-bit address in the DD RAM. 
			
		-- Write data to the display using a Write Data to CG RAM or DD RAM command. 
		-- The eightbit data value represents the look-up address into the CG ROM or CG RAM, shown in Figure 5-4. 
		-- The stored bitmap in the CG ROM or CG RAM drives the 5 x 8 dot matrix torepresent the associated character.	
		
		
		
--		DB3	DB2	Operation
--		0 		0 		Shift the cursor position to the left. The address counter is decremented by one.
--		0 		1 		Shift the cursor position to the right. The address counter is incremented by one.
--		1 		0 		Shift the entire display to the left. The cursor follows the display shift. The address counter is unchanged.
--		1 		1 		Shift the entire display to the right. The cursor follows the display shift. The address counter is unchanged.
		
		
			ResetState : if reset = '1' then
				writeState	<= WRITE_INIT;
				clockCycles := 0;
			else
				if writeState = WRITE_INIT then
					LCDDataBus <= "00001000";
					if clockCycles > WRITE_CLKWAIT then
						clockCycles := 0;
						writeState <= WRITE_DATA;
					end if;
					
				elsif writeState = WRITE_DATA then
					if clockCycles > WRITE_CLKWAIT then
						clockCycles := 0;
						writeState <= WRITE_INIT;
					end if;
				end if; 
				
				clockCycles := clockCycles + 1;
			
			end if ResetState;
		end if ClockSync;
	end process EmitData;

end Behavioral;

