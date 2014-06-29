
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


use work.cpu_types.ALL;

entity ControlUnitSimulateFetch is
    Port( 
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			result : out STD_LOGIC
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
				instruction : in STD_LOGIC_VECTOR(31 downto 0)
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
		instruction => R2
	);
	
--	EndProgramExecution : EndProgram port map 
--	(
--		endexecution	=> ID_endprogram			
--	);
	
end architecture Behavioral;

