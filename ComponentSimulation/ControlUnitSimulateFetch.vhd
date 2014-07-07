
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

	component InitializeCPU is
		Port( 
				clock 		: in  STD_LOGIC;
				reset 		: in  STD_LOGIC; 
				cpu_init		: out STD_LOGIC;
				firstPC 		: out STD_LOGIC_VECTOR(31 downto 0);
				LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0);
				LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
			 );
	end component InitializeCPU;
	
	component LCDInterface is
		Port( 
				sel 					: in STD_LOGIC;	-- 0 -> Initialize LCD, 1 -> Write LCD	
			
				init_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
				init_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
				
				write_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
				write_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
				
				LCDDataBus			: out STD_LOGIC_VECTOR(7 downto 0); 
				LCDControl			: out STD_LOGIC_VECTOR(2 downto 0)
			 );
	end component LCDInterface;

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
				reset	: in STD_LOGIC; 
				instruction : in STD_LOGIC_VECTOR(31 downto 0);
				LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0); 
				LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
			 );
	end component EmitInstruction;
	
--	component EndProgram is
--		Port( 
--				endexecution : in  STD_LOGIC
--			 );
--	end component EndProgram;


	signal cpu_init		: STD_LOGIC;   
	
	-- LCD signals local to the control unit
	-- These are multiplxed to the LCD 
	signal init_LCD_DB7 	: STD_LOGIC; 
	signal init_LCD_DB6 	: STD_LOGIC;
	signal init_LCD_DB5 	: STD_LOGIC;
	signal init_LCD_DB4	: STD_LOGIC;
	signal init_LCD_DB3 	: STD_LOGIC; 
	signal init_LCD_DB2 	: STD_LOGIC; 
	signal init_LCD_DB1 	: STD_LOGIC; 
	signal init_LCD_DB0 	: STD_LOGIC; 
	signal init_LCD_E		: STD_LOGIC;   
	signal init_LCD_RS  	: STD_LOGIC;  
	signal init_LCD_RW  	: STD_LOGIC; 
	
	
	signal write_LCD_DB7 	: STD_LOGIC; 
	signal write_LCD_DB6 	: STD_LOGIC;
	signal write_LCD_DB5 	: STD_LOGIC;
	signal write_LCD_DB4		: STD_LOGIC;
	signal write_LCD_DB3 	: STD_LOGIC; 
	signal write_LCD_DB2 	: STD_LOGIC; 
	signal write_LCD_DB1 	: STD_LOGIC; 
	signal write_LCD_DB0 	: STD_LOGIC; 
	signal write_LCD_E		: STD_LOGIC;   
	signal write_LCD_RS  	: STD_LOGIC;  
	signal write_LCD_RW  	: STD_LOGIC; 
	
	 
	signal R2 : STD_LOGIC_VECTOR(31 downto 0); 
	signal nextPC : STD_LOGIC_VECTOR(31 downto 0); 
	
begin
		
	InitCPU : InitializeCPU port map
	(
		clock		=> clock, 
		reset		=> reset,
		cpu_init => cpu_init,
		firstPC  => nextPC, 
		LCDDataBus(7) 	=> init_LCD_DB7, 
		LCDDataBus(6) 	=> init_LCD_DB6, 
		LCDDataBus(5) 	=> init_LCD_DB5, 
		LCDDataBus(4) 	=> init_LCD_DB4, 
		LCDDataBus(3) 	=> init_LCD_DB3, 
		LCDDataBus(2) 	=> init_LCD_DB2, 
		LCDDataBus(1) 	=> init_LCD_DB1, 
		LCDDataBus(0) 	=> init_LCD_DB0, 
		LCDControl(2)  => init_LCD_E,   
		LCDControl(1)  => init_LCD_RS,  
		LCDControl(0)  => init_LCD_RW 
	);
	
	LCDControl : LCDInterface port map
	(
		sel => cpu_init,
		
		init_LCDDataBus(7)	=> init_LCD_DB7, 
		init_LCDDataBus(6)	=> init_LCD_DB6, 
		init_LCDDataBus(5)	=> init_LCD_DB5, 
		init_LCDDataBus(4)	=> init_LCD_DB4, 
		init_LCDDataBus(3)	=> init_LCD_DB3, 
		init_LCDDataBus(2)	=> init_LCD_DB2, 
		init_LCDDataBus(1)	=> init_LCD_DB1, 
		init_LCDDataBus(0)	=> init_LCD_DB0, 
		init_LCDControl(2)	=> init_LCD_E,   
		init_LCDControl(1)	=> init_LCD_RS,  
		init_LCDControl(0)	=> init_LCD_RW, 
		
		write_LCDDataBus(7)	=> write_LCD_DB7, 
		write_LCDDataBus(6)	=> write_LCD_DB6, 
		write_LCDDataBus(5)	=> write_LCD_DB5, 
		write_LCDDataBus(4)	=> write_LCD_DB4, 
		write_LCDDataBus(3)	=> write_LCD_DB3, 
		write_LCDDataBus(2)	=> write_LCD_DB2, 
		write_LCDDataBus(1)	=> write_LCD_DB1, 
		write_LCDDataBus(0)	=> write_LCD_DB0,
		write_LCDControl(2)	=> write_LCD_E,   
		write_LCDControl(1)	=> write_LCD_RS,  
		write_LCDControl(0)	=> write_LCD_RW, 
		
		LCDDataBus(7) => LCD_DB7, 
		LCDDataBus(6) => LCD_DB6, 
		LCDDataBus(5) => LCD_DB5, 
		LCDDataBus(4) => LCD_DB4, 
		LCDDataBus(3) => LCD_DB3, 
		LCDDataBus(2) => LCD_DB2, 
		LCDDataBus(1) => LCD_DB1, 
		LCDDataBus(0) => LCD_DB0,
		LCDControl(2) => LCD_E,   
		LCDControl(1) => LCD_RS,  
		LCDControl(0) => LCD_RW
	);
	
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
		reset	=> reset,
		instruction => R2,
		LCDDataBus(7) 	=> write_LCD_DB7, 
		LCDDataBus(6) 	=> write_LCD_DB6, 
		LCDDataBus(5) 	=> write_LCD_DB5, 
		LCDDataBus(4) 	=> write_LCD_DB4, 
		LCDDataBus(3) 	=> write_LCD_DB3, 
		LCDDataBus(2) 	=> write_LCD_DB2, 
		LCDDataBus(1) 	=> write_LCD_DB1, 
		LCDDataBus(0) 	=> write_LCD_DB0, 
		LCDControl(2)  => write_LCD_E,   
		LCDControl(1)  => write_LCD_RS,  
		LCDControl(0)  => write_LCD_RW 
	);
	
--	EndProgramExecution : EndProgram port map 
--	(
--		endexecution	=> ID_endprogram			
--	);
	
end architecture Behavioral;

