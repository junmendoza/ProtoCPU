----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:23 06/29/2014 
-- Design Name: 
-- Module Name:    InitializeCPU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;   

use work.cpu_types.ALL;
 
entity InitializeCPU is   
	Port( 
			clock 		: in  STD_LOGIC; 
			reset 		: in  STD_LOGIC; 
			lcd_state	: out STD_LOGIC;
			firstPC 		: out STD_LOGIC_VECTOR(31 downto 0);
			LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0);
			LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)
		 );
end InitializeCPU; 

architecture Behavioral of InitializeCPU is

type INIT_STATE is (	INIT_STATE_LCD, 
							INIT_STATE_CPU, 
							INIT_STATE_DONE
						 );
						 
type LCD_START is (	LCD_START_POWERON, 
							LCD_START_CONFIG
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
							
type LCD_CONFIG is (
							LCD_CONFIG_FUNCTION_SET,
							LCD_CONFIG_ENTRYMODE_SET,
							LCD_CONFIG_DISPLAY_ONOFF,
							LCD_CONFIG_CLEAR_DISPLAY,
							LCD_CONFIG_82000CLK
						 );
						 
						 
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
--constant CONFIG_FUNCTIONSET_CLKWAIT 	: integer := 2000;
--constant CONFIG_ENTRYMODE_CLKWAIT 		: integer := 2000;
--constant CONFIG_DISPLAY_ONOFF_CLKWAIT 	: integer := 2000;
--constant CONFIG_CLEAR_DISPLAY_CLKWAIT 	: integer := 82000;


constant POWERON_CLKWAIT_1 : integer := 1;
constant POWERON_CLKWAIT_2 : integer := 1;
constant POWERON_CLKWAIT_3 : integer := 1;
constant POWERON_CLKWAIT_4 : integer := 1;
constant POWERON_CLKWAIT_5 : integer := 1;
constant POWERON_CLKWAIT_6 : integer := 1;
constant POWERON_CLKWAIT_7 : integer := 1;
constant POWERON_CLKWAIT_8 : integer := 1;
constant POWERON_CLKWAIT_9 : integer := 1;


constant CONFIG_FUNCTIONSET_CLKWAIT 	: integer := 1;
constant CONFIG_ENTRYMODE_CLKWAIT 		: integer := 1;
constant CONFIG_DISPLAY_ONOFF_CLKWAIT 	: integer := 1;
constant CONFIG_CLEAR_DISPLAY_CLKWAIT 	: integer := 1;
							
							
signal initstate : INIT_STATE;
signal initLCD : LCD_START;
signal initLCDPowerOn : LCD_POWERON;
signal initLCDConfig : LCD_CONFIG;

begin

	process(clock)
	
	variable clockCycles : integer;
	
	begin
		ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
				initstate 		<= INIT_STATE_LCD;
				initLCD 			<= LCD_START_POWERON;
				initLCDPowerOn <= LCD_POWERON_1;
				initLCDConfig 	<= LCD_CONFIG_FUNCTION_SET;
				clockCycles 	:= 0;
			else
				InitStateStart: if initstate = INIT_STATE_LCD then
				
					lcd_state <= '0';
					
					InitStateLCD : if initLCD = LCD_START_POWERON then
					
						PowerOnState : if initLCDPowerOn = LCD_POWERON_1 then
							if clockCycles > POWERON_CLKWAIT_1 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_2;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_2 then
							LCDDataBus <= "00110000";
							LCDControl <= "100";
							if clockCycles > POWERON_CLKWAIT_2 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_3;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_3 then
							if clockCycles > POWERON_CLKWAIT_3 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_4;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_4 then
							LCDDataBus <= "00110000";
							LCDControl <= "100";
							if clockCycles > POWERON_CLKWAIT_4 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_5;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_5 then
							if clockCycles > POWERON_CLKWAIT_5 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_6;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_6 then
							LCDDataBus <= "00110000";
							LCDControl <= "100";
							if clockCycles > POWERON_CLKWAIT_6 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_7;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_7 then
							if clockCycles > POWERON_CLKWAIT_7 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_8;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_8 then
							LCDDataBus <= "00100000";
							LCDControl <= "100";
							if clockCycles > POWERON_CLKWAIT_8 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_9;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_9 then
							if clockCycles > POWERON_CLKWAIT_9 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_1;
								initLCD <= LCD_START_CONFIG;
								initLCDConfig <= LCD_CONFIG_FUNCTION_SET;
							end if;
						end if PowerOnState;
						
					elsif initLCD = LCD_START_CONFIG then
					
						ConfigState : if initLCDConfig = LCD_CONFIG_FUNCTION_SET then
							-- 0x28
							LCDDataBus <= "00101000";
							if clockCycles > CONFIG_FUNCTIONSET_CLKWAIT then
								clockCycles := 0;
								initLCDConfig <= LCD_CONFIG_ENTRYMODE_SET;
							end if;
							
						elsif initLCDConfig = LCD_CONFIG_ENTRYMODE_SET then
							-- 0x06
							LCDDataBus <= "00000110";
							if clockCycles > CONFIG_ENTRYMODE_CLKWAIT then
								clockCycles := 0;
								initLCDConfig <= LCD_CONFIG_DISPLAY_ONOFF;
							end if;
							
						
						elsif initLCDConfig = LCD_CONFIG_DISPLAY_ONOFF then
							-- 0x0C
							LCDDataBus <= "00001100";
							if clockCycles > CONFIG_DISPLAY_ONOFF_CLKWAIT then
								clockCycles := 0;
								initLCDConfig <= LCD_CONFIG_CLEAR_DISPLAY;
							end if;	
							
						elsif initLCDConfig = LCD_CONFIG_CLEAR_DISPLAY then
							LCDDataBus <= "00000001";
							if clockCycles > CONFIG_CLEAR_DISPLAY_CLKWAIT then
								clockCycles := 0;
								initstate <= INIT_STATE_CPU;
							end if;
						end if ConfigState; 
					end if InitStateLCD;
					
					clockCycles := clockCycles + 1;
					   
				elsif initstate = INIT_STATE_CPU then
					firstPC <= "00000000000000000000000000000000";
					initstate <= INIT_STATE_DONE;
					
					lcd_state <= '1';
					
					
				end if InitStateStart;
			end if ResetState; 
		end if ClockSync;
	end process;
	

end Behavioral;

