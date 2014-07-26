

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- EmitInstruction is a component that emits the instruction to a multi-character display / LED 
-- Each fetched instruction is associated with one call to this component

entity EmitInstruction2 is
	Port( 
			clock 		: in STD_LOGIC;
			reset 		: in STD_LOGIC; 		
			instruction : in STD_LOGIC_VECTOR(31 downto 0);
			LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0); 
			LCD_E			: out STD_LOGIC;
			LCD_RS		: out STD_LOGIC;
			LCD_RW		: out STD_LOGIC
		 );
end EmitInstruction2;

architecture Behavioral of EmitInstruction2 is


--constant POWERON_CLKWAIT_1 : integer := 750000;
--constant POWERON_CLKWAIT_2 : integer := 12;
--constant POWERON_CLKWAIT_3 : integer := 205000;
--constant POWERON_CLKWAIT_4 : integer := 12;
--constant POWERON_CLKWAIT_5 : integer := 5000;
--constant POWERON_CLKWAIT_6 : integer := 12;
--constant POWERON_CLKWAIT_7 : integer := 2000;
--constant POWERON_CLKWAIT_8 : integer := 12;
--constant POWERON_CLKWAIT_9 : integer := 2000;
--
--
--constant CONFIG_FUNCTIONSET_CLKWAIT 	: integer := 2000;
--constant CONFIG_ENTRYMODE_CLKWAIT 		: integer := 2000;
--constant CONFIG_DISPLAY_ONOFF_CLKWAIT 	: integer := 2000;
--constant CONFIG_CLEAR_DISPLAY_CLKWAIT 	: integer := 82000;


constant POWERON_CLKWAIT_1 : integer := 800000;
constant POWERON_CLKWAIT_2 : integer := 30;
constant POWERON_CLKWAIT_3 : integer := 300000;
constant POWERON_CLKWAIT_4 : integer := 30;
constant POWERON_CLKWAIT_5 : integer := 7000;
constant POWERON_CLKWAIT_6 : integer := 30;
constant POWERON_CLKWAIT_7 : integer := 4000;
constant POWERON_CLKWAIT_8 : integer := 30;
constant POWERON_CLKWAIT_9 : integer := 4000;


constant CONFIG_FUNCTIONSET_CLKWAIT 	: integer := 3000;
constant CONFIG_ENTRYMODE_CLKWAIT 		: integer := 3000;
constant CONFIG_DISPLAY_ONOFF_CLKWAIT 	: integer := 3000;
constant CONFIG_CLEAR_DISPLAY_CLKWAIT 	: integer := 120000;



constant WRITE_CLKWAIT : integer := 3000;


type LCD_STATE is ( LCD_DISABLED, 
						  LCD_ENABLED
						);
						
-- Flag that the LCD has data to emit
type LCD_WRITE_FLAG is ( LCD_WRITE_FLAG_ON, 
								 LCD_WRITE_FLAG_OFF
							  );

type LCD_POWERON is (
							LCD_POWERON_1,
							LCD_POWERON_2, 
							LCD_POWERON_3, 
							LCD_POWERON_4, 
							LCD_POWERON_5,
							LCD_POWERON_6,
							LCD_POWERON_7,
							LCD_POWERON_8,
							LCD_POWERON_9
							);
							
type LCD_WRITE_STATE is (
							LCD_CONFIG_FUNCTION_SET,
							LCD_CONFIG_ENTRYMODE_SET,
							LCD_CONFIG_DISPLAY_ONOFF,
							LCD_CONFIG_CLEAR_DISPLAY,
							LCD_CONFIG_82000CLK,
							WRITE_INIT,
							W1,
							W2,
							W3,
							W4,
							WRITE_DONE
						 );


signal lcdWriteflag 		: LCD_WRITE_FLAG := LCD_WRITE_FLAG_OFF;
signal lcdEnableState 	: LCD_STATE;
signal lcdWriteState	 	: LCD_WRITE_STATE;
signal initLCDPowerOn 	: LCD_POWERON;

begin

	-- Process to handle incoming data to emit
	process(instruction)
	begin
		ResetState : if reset = '1' then
			lcdWriteflag <= LCD_WRITE_FLAG_OFF;
		elsif reset = '0' then
			lcdWriteflag <= LCD_WRITE_FLAG_ON;
		end if ResetState;
	end process;

--	process(reset, instruction)
--	begin
--		if reset = '0' then
--			lcdWriteflag <= LCD_WRITE_FLAG_ON;
--		end if;
--	end process;
	
	
	-- Process to handle LCD state
	process(clock, reset)
	
	variable clockCycles : integer;
		
	begin
		ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
				clockCycles := 0;
				lcdEnableState <= LCD_DISABLED;
			elsif reset = '0' then
				IfThereIsDataToEmit : if lcdWriteflag = LCD_WRITE_FLAG_ON then
					IsReadyForWrite : if lcdEnableState = LCD_DISABLED then
						IsPoweredOn : if initLCDPowerOn = LCD_POWERON_1 then
							if clockCycles > POWERON_CLKWAIT_1 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_2;
								end if;
							elsif initLCDPowerOn = LCD_POWERON_2 then
								if clockCycles < POWERON_CLKWAIT_2 then
									LCDDataBus(7 downto 4) <= "0011";	
									LCD_E <= '1';			-- Set pulse high
								else
									LCDDataBus(7 downto 4) <= "0000";	
									LCD_E <= '0';			-- Set pulse low
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_3;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_3 then
								if clockCycles > POWERON_CLKWAIT_3 then
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_4;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_4 then
								if clockCycles < POWERON_CLKWAIT_4 then
									LCDDataBus(7 downto 4) <= "0011";
									LCD_E <= '1';			-- Set pulse high
								else
									LCDDataBus(7 downto 4) <= "0000";	
									LCD_E <= '0';			-- Set pulse low
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_5;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_5 then
								if clockCycles > POWERON_CLKWAIT_5 then
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_6;
								end if;
							elsif initLCDPowerOn = LCD_POWERON_6 then
								if clockCycles < POWERON_CLKWAIT_6 then
									LCDDataBus(7 downto 4) <= "0011";
									LCD_E <= '1';			-- Set pulse high
								else
									LCDDataBus(7 downto 4) <= "0000";	
									LCD_E <= '0';			-- Set pulse low
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_7;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_7 then
								if clockCycles > POWERON_CLKWAIT_7 then
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_8;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_8 then
								if clockCycles < POWERON_CLKWAIT_8 then
									LCDDataBus(7 downto 4) <= "0010";
									LCD_E <= '1';			-- Set pulse high
								else
									LCDDataBus(7 downto 4) <= "0000";	
									LCD_E <= '0';			-- Set pulse low
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_9;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_9 then
								if clockCycles > POWERON_CLKWAIT_9 then
									clockCycles := 0;
									lcdEnableState <= LCD_ENABLED;
									lcdWriteState <= LCD_CONFIG_FUNCTION_SET;
								end if;
							end if IsPoweredOn;
							
						elsif lcdEnableState = LCD_ENABLED then
						
							WriteState : if lcdWriteState = LCD_CONFIG_FUNCTION_SET then
								-- 0x28
								LCDDataBus <= "00101000";
								LCD_E <= '1';		
								if clockCycles > CONFIG_FUNCTIONSET_CLKWAIT then
									clockCycles := 0; 
									lcdWriteState <= LCD_CONFIG_ENTRYMODE_SET;
								end if;
								
							elsif lcdWriteState = LCD_CONFIG_ENTRYMODE_SET then
								-- 0x06
								LCDDataBus <= "00000110";
								LCD_E <= '1';		
								if clockCycles > CONFIG_ENTRYMODE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= LCD_CONFIG_DISPLAY_ONOFF;
								end if;
								
							
							elsif lcdWriteState = LCD_CONFIG_DISPLAY_ONOFF then
								-- 0x0C
								--LCDDataBus <= "00001100";
								LCDDataBus <= "00001100";
								LCD_E <= '1';		
								if clockCycles > CONFIG_DISPLAY_ONOFF_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= LCD_CONFIG_CLEAR_DISPLAY;
								end if;	
							
						
							elsif lcdWriteState = LCD_CONFIG_CLEAR_DISPLAY then
								LCDDataBus <= "00000001";
								LCD_E <= '1';		
								if clockCycles > CONFIG_CLEAR_DISPLAY_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= WRITE_INIT;
								end if;
								
							elsif lcdWriteState = WRITE_INIT then
								LCDDataBus <= "00001100";
								LCD_RS <= '1';		
								if clockCycles > WRITE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= W1;
								end if;
							
							elsif lcdWriteState = W1 then
								LCDDataBus <= "01000110";
								LCD_RS <= '1';		
								if clockCycles > WRITE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= W2;
								end if;
							
							elsif lcdWriteState = W2 then
								LCDDataBus <= "01010000";
								LCD_RS <= '1';		
								if clockCycles > WRITE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= W3;
								end if;
							
							elsif lcdWriteState = W3 then
								LCDDataBus <= "01000111";
								LCD_RS <= '1';			
								if clockCycles > WRITE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= W4;
								end if;
								
							elsif lcdWriteState = W4 then
								LCDDataBus <= "01000001";
								LCD_RS <= '1';		
								if clockCycles > WRITE_CLKWAIT then
									clockCycles := 0;
									lcdWriteState <= WRITE_DONE;
								end if;
							end if WriteState; 
						end if IsReadyForWrite;
						
						clockCycles := clockCycles + 1;
						
					end if IfThereIsDataToEmit;
				end if ResetState;
			end if ClockSync;
		end process;
	end Behavioral;

