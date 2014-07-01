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

entity InitializeCPU is
	Port( 
			clock 		: in  STD_LOGIC; 
			reset 		: in  STD_LOGIC; 
			cpu_init		: out STD_LOGIC;
			firstPC 		: out STD_LOGIC_VECTOR(31 downto 0); -- firstPC signals the first isntruction needs to be fetched
			LCDDataBus	: out STD_LOGIC_VECTOR(7 downto 0); -- DB7-DB0
			LCDControl	: out STD_LOGIC_VECTOR(2 downto 0)	-- LCD_E, LCD_RS, LCD_RW
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
							LCD_POWERON_750000CLK,
							LCD_POWERON_12CLK_1, 
							LCD_POWERON_205000CLK, 
							LCD_POWERON_12CLK_2, 
							LCD_POWERON_5000CLK,
							LCD_POWERON_12CLK_3,
							LCD_POWERON_2000CLK_1,
							LCD_POWERON_12CLK_4,
							LCD_POWERON_2000CLK_2
							);
							
type LCD_CONFIG is (
							LCD_CONFIG_START,
							LCD_CONFIG_82000CLK
						 );
							
							
signal initstate : INIT_STATE;
signal initLCD : LCD_START;
signal initLCDPowerOn : LCD_POWERON;
signal initLCDConfig : LCD_CONFIG;

begin

	process(clock, reset)
	
	variable clockCycles : integer;
	
	begin
		ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
				initstate 		<= INIT_STATE_LCD;
				initLCD 			<= LCD_START_POWERON;
				initLCDPowerOn <= LCD_POWERON_750000CLK;
				initLCDConfig 	<= LCD_CONFIG_START;
				clockCycles 	:= 0;
			else
				InitStateStart: if initstate = INIT_STATE_LCD then
				
					InitStateLCD : if initLCD = LCD_START_POWERON then
					
						PowerOnState : if initLCDPowerOn = LCD_POWERON_750000CLK then
							if clockCycles > 750000 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_12CLK_1;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_12CLK_1 then
							if clockCycles > 12 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_205000CLK;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_205000CLK then
							if clockCycles > 205000 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_12CLK_2;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_12CLK_2 then
							if clockCycles > 12 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_5000CLK;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_5000CLK then
							if clockCycles > 5000 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_12CLK_3;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_12CLK_3 then
							if clockCycles > 12 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_2000CLK_1;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_2000CLK_1 then
							if clockCycles > 2000 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_12CLK_4;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_12CLK_4 then
							if clockCycles > 12 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_2000CLK_2;
							end if;
							
						elsif initLCDPowerOn = LCD_POWERON_2000CLK_2 then
							if clockCycles > 2000 then
								clockCycles := 0;
								initLCDPowerOn <= LCD_POWERON_750000CLK;
								initLCD <= LCD_START_CONFIG;
							end if;
						end if PowerOnState;
						
					elsif initLCD = LCD_START_CONFIG then
					
						ConfigState : if initLCDConfig = LCD_CONFIG_START then
							initLCDConfig <= LCD_CONFIG_82000CLK;
						elsif initLCDConfig = LCD_CONFIG_82000CLK then
							initstate <= INIT_STATE_CPU;
						end if ConfigState;
							
					end if InitStateLCD;
					
					clockCycles := clockCycles + 1;
					
				elsif initstate = INIT_STATE_CPU then
					firstPC <= "00000000000000000000000000000000";
					initstate <= INIT_STATE_DONE;
				end if InitStateStart;
			end if ResetState; 
		end if ClockSync;
	end process;
	

end Behavioral;

