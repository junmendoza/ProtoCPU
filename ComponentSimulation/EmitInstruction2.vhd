

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
							 
							 
-- Flag that a command byte is being transmitted to the LCD
type LCD_TRANSMIT_BYTE_FLAG is( 
								TRANSMIT_CMD_ON, 
								TRANSMIT_CMD_WAIT, 
								TRANSMIT_CMD_OFF
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
									LCD_TRANSMIT_4BIT_READY,
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
signal initLCDPowerOn 		: LCD_POWERON;
signal transmitByteState	: LCD_TRANSMIT_BYTE_FLAG;
signal transmit4BitState	: LCD_TRANSMIT_4BIT;
signal transmitNibbleState	: LCD_TRANSMIT_NIBBLE;


signal LCDBusPowerOn : STD_LOGIC_VECTOR(3 downto 0);
signal LCDBusWrite : STD_LOGIC_VECTOR(3 downto 0);
signal LCD_E_PowerOn : STD_LOGIC;
signal LCD_E_Write : STD_LOGIC;
signal SendCMD : STD_LOGIC;

begin


with lcdEnableState select
LCDDataBus(7 downto 4) <= LCDBusPowerOn when LCD_DISABLED, LCDBusWrite when others; 

with lcdEnableState select
LCD_E <= LCD_E_PowerOn when LCD_DISABLED, LCD_E_Write when others; 

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
		
	begin
		ResetState : if reset = '1' then
			clockCycles := 0;
			transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
			transmit4BitState <= LCD_TRANSMIT_4BIT_READY;
			transmitByteState <= TRANSMIT_CMD_OFF;
			LCD_RW <= '0';
			LCD_RS <= '0';		
			LCD_E_Write <= '0';
		elsif reset = '0' then
			if transmitByteState = TRANSMIT_CMD_OFF then
				if SendCMD = '1' then	
					transmitByteState <= TRANSMIT_CMD_ON;
				end if;
			elsif transmitByteState = TRANSMIT_CMD_ON then
				if transmit4BitState = LCD_TRANSMIT_4BIT_READY then
					--if clockCycles > TRANSMIT_4BIT_HOLD then
						transmit4BitState <= LCD_TRANSMIT_4BIT_UPPER;
						clockCycles := 0;
					--end if;
				elsif transmit4BitState = LCD_TRANSMIT_4BIT_UPPER then
					if transmitNibbleState = LCD_TRANSMIT_NIBBLE_SETUP then
						if clockCycles < WRITE_SETUP_HOLD then
							LCDBusWrite <= CmdByte(7 downto 4);
							LCD_E_Write <= '0';
						else
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_HOLD;
							clockCycles := 0;
						end if;
					elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_HOLD then
						if clockCycles < WRITE_HOLD then
							LCDBusWrite <= CmdByte(7 downto 4);
							LCD_E_Write <= '1';
						else
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_NEXT;
							clockCycles := 0;
						end if;
					elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_NEXT then
						if clockCycles < WRITE_NEXT_HOLD then
							LCD_E_Write <= '0';
						else
							transmit4BitState <= LCD_TRANSMIT_4BIT_LOWER;
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
							clockCycles := 0;
						end if;
					end if;
				elsif transmit4BitState = LCD_TRANSMIT_4BIT_LOWER then
				
					if transmitNibbleState = LCD_TRANSMIT_NIBBLE_SETUP then
						if clockCycles < WRITE_SETUP_HOLD then
							LCDBusWrite <= CmdByte(3 downto 0);
							LCD_E_Write <= '0';
						else
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_HOLD;
							clockCycles := 0;
						end if;
					elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_HOLD then
						if clockCycles < WRITE_HOLD then
							LCDBusWrite <= CmdByte(3 downto 0);
							LCD_E_Write <= '1';
						else
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_NEXT;
							clockCycles := 0;
						end if;
					elsif transmitNibbleState = LCD_TRANSMIT_NIBBLE_NEXT then
						if clockCycles < WRITE_NEXT_HOLD then
							LCD_E_Write <= '0';
						else
							transmit4BitState <= LCD_TRANSMIT_4BIT_DONE;
							transmitNibbleState <= LCD_TRANSMIT_NIBBLE_SETUP;
							clockCycles := 0;
						end if;
					end if;
				elsif transmit4BitState = LCD_TRANSMIT_4BIT_DONE then
					if clockCycles < TRANSMIT_4BIT_HOLD then
						LCD_E_Write <= '0';
					else
						transmit4BitState <= LCD_TRANSMIT_4BIT_READY;
						transmitByteState <= TRANSMIT_CMD_OFF;
						clockCycles := 0;
					end if;
				end if;
				clockCycles := clockCycles + 1;
			end if;
		end if ResetState;
	end process;
	
	-- Process to handle LCD state
	ProcLCDState : process(clock, reset, transmit4BitState)
	
	variable clockCycles : integer;
		
	begin
		ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
				clockCycles := 0;
				lcdEnableState <= LCD_DISABLED;
				SendCMD <= '0';
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
									LCDBusPowerOn <= "0011";	
									LCD_E_PowerOn <= '1';			-- Set pulse high
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_3;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_3 then
								if clockCycles < POWERON_CLKWAIT_3 then
									LCDBusPowerOn <= "0000";	
									LCD_E_PowerOn <= '0';			-- Set pulse low
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_4;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_4 then
								if clockCycles < POWERON_CLKWAIT_4 then
									LCDBusPowerOn <= "0011";
									LCD_E_PowerOn <= '1';			-- Set pulse high
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_5;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_5 then
								if clockCycles < POWERON_CLKWAIT_5 then
									LCDBusPowerOn <= "0000";	
									LCD_E_PowerOn <= '0';			-- Set pulse low
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_6;
								end if;
							elsif initLCDPowerOn = LCD_POWERON_6 then
								if clockCycles < POWERON_CLKWAIT_6 then
									LCDBusPowerOn <= "0011";
									LCD_E_PowerOn <= '1';			-- Set pulse high
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_7;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_7 then
								if clockCycles < POWERON_CLKWAIT_7 then
									LCDBusPowerOn <= "0000";	
									LCD_E_PowerOn <= '0';			-- Set pulse low
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_8;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_8 then
								if clockCycles < POWERON_CLKWAIT_8 then
									LCDBusPowerOn <= "0010";
									LCD_E_PowerOn <= '1';			-- Set pulse high
								else
									clockCycles := 0;
									initLCDPowerOn <= LCD_POWERON_9;
								end if;
								
							elsif initLCDPowerOn = LCD_POWERON_9 then
								if clockCycles < POWERON_CLKWAIT_9 then
									LCDBusPowerOn <= "0000";	
									LCD_E_PowerOn <= '0';			-- Set pulse low
								else
									clockCycles := 0;
									lcdEnableState <= LCD_ENABLED;
									lcdWriteState <= LCD_CONFIG_FUNCTION_SET;
								end if;
							end if IsPoweredOn;
							
						elsif lcdEnableState = LCD_ENABLED then
							if transmitByteState = TRANSMIT_CMD_ON then
								if transmit4BitState = LCD_TRANSMIT_4BIT_UPPER and SendCMD = '1' then 
									-- Reset this command while the current one is being transmitted to the LCD
									SendCMD <= '0';
								end if;
							elsif transmitByteState = TRANSMIT_CMD_OFF then
								IsTransmitReady : if transmit4BitState = LCD_TRANSMIT_4BIT_READY then
									WriteState : if lcdWriteState = LCD_CONFIG_FUNCTION_SET then
										CmdByte <= kSetupFunctionSet;
										lcdWriteState <= LCD_CONFIG_ENTRYMODE_SET;
									elsif lcdWriteState = LCD_CONFIG_ENTRYMODE_SET then
										CmdByte <= kSetupEntryModeSet;
										lcdWriteState <= LCD_CONFIG_DISPLAY_ONOFF;
									elsif lcdWriteState = LCD_CONFIG_DISPLAY_ONOFF then
										CmdByte <= kSetupDisplayOnOff;
										lcdWriteState <= LCD_CONFIG_CLEAR_DISPLAY;
									elsif lcdWriteState = LCD_CONFIG_CLEAR_DISPLAY then
										CmdByte <= kSetupClearDisplay;
										lcdWriteState <= WRITE_INIT;
									elsif lcdWriteState = WRITE_INIT then
										CmdByte <= kSetStartAddress;
										lcdWriteState <= W1;
									elsif lcdWriteState = W1 then
										CmdByte <= kW1;
										lcdWriteState <= W2;
									elsif lcdWriteState = W2 then
										CmdByte <= kW2;
										lcdWriteState <= W3;
									elsif lcdWriteState = W3 then
										CmdByte <= kW3;
										lcdWriteState <= W4;
									elsif lcdWriteState = W4 then
										CmdByte <= kW4;
										lcdWriteState <= W5;
									elsif lcdWriteState = W5 then
										CmdByte <= kW5;
									end if WriteState; 
									
									SendCMD <= '1';
								end if;
								
							end if ;
						end if ;
						
						clockCycles := clockCycles + 1;
						
					end if IfThereIsDataToEmit;
				end if ResetState;
			end if ClockSync;
		end process ProcLCDState;
	end Behavioral;
	
	
	
	
	

