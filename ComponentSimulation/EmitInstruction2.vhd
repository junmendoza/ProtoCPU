

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
constant CONFIG_CLEAR_DISPLAY_CLKWAIT 	: integer := 100000;

constant WRITE_CLKWAIT : integer := 3000;

constant WRITE_SETUP_HOLD : integer	:= 10;
constant WRITE_HOLD : integer	:= 20;
constant WRITE_NEXT_HOLD : integer	:= 10;
constant TRANSMIT_4BIT_HOLD : integer	:= 5;


-- LCD setup constants

-- 0x28 00101000	
-- 0x06 00000110
-- 0x0C 00001100
-- 0x01 00000001
-- write init 10001000


constant kSetupFunctionSet 	: STD_LOGIC_VECTOR(7 downto 0) := "00101000";
constant kSetupEntryModeSet 	: STD_LOGIC_VECTOR(7 downto 0) := "00000110";
constant kSetupDisplayOnOff 	: STD_LOGIC_VECTOR(7 downto 0) := "00001100";
constant kSetupClearDisplay 	: STD_LOGIC_VECTOR(7 downto 0) := "00000001";
constant kSetStartAddress 		: STD_LOGIC_VECTOR(7 downto 0) := "10001000";

constant kW1 : STD_LOGIC_VECTOR(7 downto 0) := "01001010";
constant kW2 : STD_LOGIC_VECTOR(7 downto 0) := "01110101";
constant kW3 : STD_LOGIC_VECTOR(7 downto 0) := "01101110";
constant kW4 : STD_LOGIC_VECTOR(7 downto 0) := "01001101";
constant kW5 : STD_LOGIC_VECTOR(7 downto 0) := "01001010";
constant kW6 : STD_LOGIC_VECTOR(7 downto 0) := "01110101";

signal CmdByte : STD_LOGIC_VECTOR(7 downto 0);
signal LCD_RS_Val : STD_LOGIC;


-- Flag that the LCD is powered on/off, enabled/disabled
type LCD_STATE is( 
						 LCD_DISABLED, 
						 LCD_ENABLED
					  );
						
-- Flag that the LCD has data to emit
type LCD_WRITE_FLAG is( 
								LCD_WRITE_FLAG_ON, 
								LCD_WRITE_FLAG_OFF
							 );
							 
	 
type LCD_TRANSMIT_STATE is(
									LCD_TRANSMIT_STATE_SELECT_COMMAND,
									LCD_TRANSMIT_STATE_EXECUTE_COMMAND,
									LCD_TRANSMIT_STATE_DONE
								 );

type LCD_POWERON is(
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
							
type LCD_WRITE_STATE is(
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
								W5,
								WRITE_DONE
							  );
							  
type LCD_TRANSMIT_4BIT is(
									LCD_TRANSMIT_4BIT_UPPER,
									LCD_TRANSMIT_4BIT_LOWER,
									LCD_TRANSMIT_4BIT_DONE
								 );
						 
type LCD_TRANSMIT_NIBBLE is(
										LCD_TRANSMIT_NIBBLE_SETUP,
										LCD_TRANSMIT_NIBBLE_HOLD,
										LCD_TRANSMIT_NIBBLE_NEXT
									);


signal lcdWriteflag 			: LCD_WRITE_FLAG := LCD_WRITE_FLAG_OFF;
signal lcdEnableState 		: LCD_STATE;
signal lcdWriteState	 		: LCD_WRITE_STATE;
signal lcdTransmitState		: LCD_TRANSMIT_STATE;
signal initLCDPowerOn 		: LCD_POWERON;
signal transmit4BitState	: LCD_TRANSMIT_4BIT;
signal transmitNibbleState	: LCD_TRANSMIT_NIBBLE;

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
	
	-- Process to handle transmission of 8-bit data to the LCD bus
	process(clock, reset)
		variable clockCycles : integer;
		variable nextCmdWait : integer;
	
	begin
		ResetState : if reset = '1' then
			clockCycles := 0;
			transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
			transmit4BitState <= LCD_TRANSMIT_4BIT_UPPER;
			LCD_RW <= '0';
			LCD_RS <= '0';		
			LCD_E <= '0';
			LCD_RS_Val <= '0';
			nextCmdWait := 0;
		elsif reset = '0' then
			ClockSync : if rising_edge(clock) then
			
				IfThereIsDataToEmit : if lcdWriteflag = LCD_WRITE_FLAG_ON then
					
					IsReadyForWrite : if lcdEnableState = LCD_DISABLED then
						-- Power on sequence
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
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_3;
							end if;
								
						elsif initLCDPowerOn = LCD_POWERON_3 then
							if clockCycles < POWERON_CLKWAIT_3 then
								LCDDataBus(7 downto 4) <= "0000";	
								LCD_E <= '0';			-- Set pulse low
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_4;
							end if;
								
						elsif initLCDPowerOn = LCD_POWERON_4 then
							if clockCycles < POWERON_CLKWAIT_4 then
								LCDDataBus(7 downto 4) <= "0011";
								LCD_E <= '1';			-- Set pulse high
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_5;
							end if;
						elsif initLCDPowerOn = LCD_POWERON_5 then
							if clockCycles < POWERON_CLKWAIT_5 then
								LCDDataBus(7 downto 4) <= "0000";	
								LCD_E <= '0';			-- Set pulse low
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_6;
							end if;
						elsif initLCDPowerOn = LCD_POWERON_6 then
							if clockCycles < POWERON_CLKWAIT_6 then
								LCDDataBus(7 downto 4) <= "0011";
								LCD_E <= '1';			-- Set pulse high
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_7;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_7 then
							if clockCycles < POWERON_CLKWAIT_7 then
								LCDDataBus(7 downto 4) <= "0000";	
								LCD_E <= '0';			-- Set pulse low
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_8;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_8 then
							if clockCycles < POWERON_CLKWAIT_8 then
								LCDDataBus(7 downto 4) <= "0010";
								LCD_E <= '1';			-- Set pulse high
							else
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_9;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_9 then
							if clockCycles < POWERON_CLKWAIT_9 then
								LCDDataBus(7 downto 4) <= "0000";	
								LCD_E <= '0';			-- Set pulse low
							else
								clockCycles := 0;
								lcdEnableState <= LCD_ENABLED;
								lcdTransmitState <= LCD_TRANSMIT_STATE_SELECT_COMMAND;
								lcdWriteState <= LCD_CONFIG_FUNCTION_SET;
							end if;
						end if IsPoweredOn;
					
					elsif lcdEnableState = LCD_ENABLED then
					
						TransmitState : if lcdTransmitState = LCD_TRANSMIT_STATE_SELECT_COMMAND then
						
							lcdTransmitState <= LCD_TRANSMIT_STATE_EXECUTE_COMMAND;

							WriteState : if lcdWriteState = LCD_CONFIG_FUNCTION_SET then
								CmdByte <= kSetupFunctionSet;
								LCD_RS_Val <= '0';
								nextCmdWait := CONFIG_FUNCTIONSET_CLKWAIT;
								lcdWriteState <= LCD_CONFIG_ENTRYMODE_SET;
							elsif lcdWriteState = LCD_CONFIG_ENTRYMODE_SET then
								CmdByte <= kSetupEntryModeSet;
								LCD_RS_Val <= '0';
								nextCmdWait := CONFIG_ENTRYMODE_CLKWAIT;
								lcdWriteState <= LCD_CONFIG_DISPLAY_ONOFF;
							elsif lcdWriteState = LCD_CONFIG_DISPLAY_ONOFF then
								CmdByte <= kSetupDisplayOnOff;
								LCD_RS_Val <= '0';
								nextCmdWait := CONFIG_DISPLAY_ONOFF_CLKWAIT;
								lcdWriteState <= LCD_CONFIG_CLEAR_DISPLAY;
							elsif lcdWriteState = LCD_CONFIG_CLEAR_DISPLAY then
								CmdByte <= kSetupClearDisplay;
								LCD_RS_Val <= '0';
								nextCmdWait := CONFIG_CLEAR_DISPLAY_CLKWAIT;
								lcdWriteState <= WRITE_INIT;
							elsif lcdWriteState = WRITE_INIT then
								CmdByte <= kSetStartAddress;
								LCD_RS_Val <= '0';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= W1;
							elsif lcdWriteState = W1 then
								CmdByte <= kW1;
								LCD_RS_Val <= '1';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= W2;
							elsif lcdWriteState = W2 then
								CmdByte <= kW2;
								LCD_RS_Val <= '1';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= W3;
							elsif lcdWriteState = W3 then
								CmdByte <= kW3;
								LCD_RS_Val <= '1';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= W4;
							elsif lcdWriteState = W4 then
								CmdByte <= kW4;
								LCD_RS_Val <= '1';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= W5;
							elsif lcdWriteState = W5 then
								CmdByte <= kW5;
								LCD_RS_Val <= '1';
								nextCmdWait := WRITE_CLKWAIT;
								lcdWriteState <= WRITE_DONE;
							elsif lcdWriteState = WRITE_DONE then
								lcdTransmitState <= LCD_TRANSMIT_STATE_DONE;
							end if WriteState;
							
						elsif lcdTransmitState = LCD_TRANSMIT_STATE_EXECUTE_COMMAND then
					
							if transmit4BitState = LCD_TRANSMIT_4BIT_UPPER then
								if transmitNibbleState = LCD_TRANSMIT_NIBBLE_SETUP then
									if clockCycles < WRITE_SETUP_HOLD then
										LCDDataBus(7 downto 4) <= CmdByte(7 downto 4);
										LCD_RS <= LCD_RS_Val;
										LCD_E <= '0';
									else
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_HOLD;
										clockCycles := 0;
									end if;
								elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_HOLD then
									if clockCycles < WRITE_HOLD then
										LCDDataBus(7 downto 4) <= CmdByte(7 downto 4);
										LCD_RS <= LCD_RS_Val;
										LCD_E <= '1';
									else
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_NEXT;
										clockCycles := 0;
									end if;
								elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_NEXT then
									if clockCycles < WRITE_NEXT_HOLD then
										LCD_E <= '0';
									else
										transmit4BitState <= LCD_TRANSMIT_4BIT_LOWER;
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
										clockCycles := 0;
									end if;
								end if;
							elsif transmit4BitState = LCD_TRANSMIT_4BIT_LOWER then
							
								if transmitNibbleState = LCD_TRANSMIT_NIBBLE_SETUP then
									if clockCycles < WRITE_SETUP_HOLD then
										LCDDataBus(7 downto 4) <= CmdByte(3 downto 0);
										LCD_RS <= LCD_RS_Val;
										LCD_E <= '0';
									else
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_HOLD;
										clockCycles := 0;
									end if;
								elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_HOLD then
									if clockCycles < WRITE_HOLD then
										LCDDataBus(7 downto 4) <= CmdByte(3 downto 0);
										LCD_RS <= LCD_RS_Val;
										LCD_E <= '1';
									else
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_NEXT;
										clockCycles := 0;
									end if;
								elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_NEXT then
									if clockCycles < WRITE_NEXT_HOLD then
										LCD_E <= '0';
									else
										transmit4BitState <= LCD_TRANSMIT_4BIT_DONE;
										transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
										clockCycles := 0;
									end if;
								end if;
							elsif transmit4BitState = LCD_TRANSMIT_4BIT_DONE then
								if clockCycles < nextCmdWait then
									LCD_E <= '0';
								else
									transmit4BitState <= LCD_TRANSMIT_4BIT_UPPER;
									lcdTransmitState <= LCD_TRANSMIT_STATE_SELECT_COMMAND;
									clockCycles := 0;
								end if;
							end if;
						end if TransmitState;
					end if IsReadyForWrite;
					clockCycles := clockCycles + 1;
				end if IfThereIsDataToEmit;	
			end if ClockSync;
		end if ResetState;
	end process;

end Behavioral;













