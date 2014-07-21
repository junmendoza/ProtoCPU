
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
			 LCD_E   : out STD_LOGIC;
			 LCD_RS  : out STD_LOGIC;
			 LCD_RW  : out STD_LOGIC;
			 LCD_DB	: out STD_LOGIC_VECTOR(7 downto 0);
			 LED 		: out STD_LOGIC_VECTOR(7 downto 0)
		  );
			
end ControlUnitSimulateFetch;


architecture Behavioral of ControlUnitSimulateFetch is

	component InitializeCPU is
		Port( 
				clock 		: in  STD_LOGIC;
				reset 		: in  STD_LOGIC; 
				enable_lcd	: out STD_LOGIC; 
				lcd_state	: out STD_LOGIC;
				firstPC 		: out STD_LOGIC_VECTOR(31 downto 0);
				LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0);
				LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
			 );
	end component InitializeCPU;
	
	component LCDInterface is
		Port( 
				reset 				: in STD_LOGIC;	
				sel 					: in STD_LOGIC;	-- 0 -> Initialize LCD, 1 -> Write LCD	
				enable_lcd 			: in STD_LOGIC;	-- 0 -> Disable signals to LCD, 1 -> Enable signals to LCD 	
			
				init_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
				init_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
				
				write_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
				write_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
				
				LCDDataBus			: out STD_LOGIC_VECTOR(7 downto 0); 
				LCDControl			: out STD_LOGIC_VECTOR(2 downto 0);
				LED : out STD_LOGIC_VECTOR(7 downto 0)
			 );
	end component LCDInterface;

	component Fetch is 
		Port( 
				clock : in STD_LOGIC; 
				enable : in STD_LOGIC; 
				sel_getnextpc : in STD_LOGIC;
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component EmitInstruction is
		Port( 
				clock 		: in STD_LOGIC;
				enable 		: in STD_LOGIC; 		-- 0 - initializing, 1 - ready for writing
				instruction : in STD_LOGIC_VECTOR(31 downto 0);
				LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0); 
				LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
			 );
	end component EmitInstruction;

	signal lcd_state		: STD_LOGIC := '0';   
	signal enable_lcd		: STD_LOGIC := '0';   
	signal emit				: STD_LOGIC := '0';  
	signal emit_done		: STD_LOGIC := '0';  
	
	-- Manually set the flag for retrieving the next PC. 
	-- '0' - Use specified pc, '1' - increment current pc  
	signal sel_getnextpc		: STD_LOGIC := '1';   
	
	
	-- LCD signals local to the control unit
	-- These are multiplxed to the LCD 
	signal init_LCD_DB 	: STD_LOGIC_VECTOR(7 downto 0); 
	signal init_LCD_E		: STD_LOGIC;   
	signal init_LCD_RS  	: STD_LOGIC;  
	signal init_LCD_RW  	: STD_LOGIC; 
	
	
	signal write_LCD_DB 	: STD_LOGIC_VECTOR(7 downto 0); 
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
		enable_lcd => enable_lcd,
		lcd_state => lcd_state,
		firstPC  => nextPC, 

		LCDDataBus => init_LCD_DB,
		LCDControl(2)  => init_LCD_E,   
		LCDControl(1)  => init_LCD_RS,  
		LCDControl(0)  => init_LCD_RW
	);
	
	LCDControl : LCDInterface port map
	(	
		reset 					=> reset,	
		sel 						=> lcd_state,
		enable_lcd 				=> enable_lcd,
		
		init_LCDDataBus 		=> init_LCD_DB,
		init_LCDControl(2)	=> init_LCD_E,   
		init_LCDControl(1)	=> init_LCD_RS,  
		init_LCDControl(0)	=> init_LCD_RW, 
		
		write_LCDDataBus 		=> write_LCD_DB,
		write_LCDControl(2)	=> write_LCD_E,   
		write_LCDControl(1)	=> write_LCD_RS,  
		write_LCDControl(0)	=> write_LCD_RW, 
		
		LCDDataBus 				=> LCD_DB, 
		LCDControl(2) 			=> LCD_E,   
		LCDControl(1) 			=> LCD_RS,  
		LCDControl(0) 			=> LCD_RW,
		LED  => LED		
	);
	
	FetchInstruction : Fetch port map
	(
		clock => clock, 
		enable => lcd_state,
		sel_getnextpc => sel_getnextpc,	-- in fetch op
		pc => nextPC, 				-- in current pc
		instr => R2					-- out next instruction -> ID
	);
	
	EmitInstr : EmitInstruction port map
	(
		clock => clock, 
		enable => lcd_state, 	-- 0 - initializing, 1 - ready for writing
		instruction => R2,	
		LCDDataBus 	=> write_LCD_DB, 
		LCDControl(2)  => write_LCD_E,   
		LCDControl(1)  => write_LCD_RS,  
		LCDControl(0)  => write_LCD_RW
	);
	
end architecture Behavioral;

