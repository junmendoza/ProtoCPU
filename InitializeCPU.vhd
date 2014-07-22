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
			enable_lcd	: out STD_LOGIC; 
			firstPC 		: out STD_LOGIC_VECTOR(31 downto 0)
		 );
end InitializeCPU; 

architecture Behavioral of InitializeCPU is

begin

	process(clock)
	begin
			ClockSync : if rising_edge(clock) then
			ResetState : if reset = '1' then
			elsif reset = '0' then
				enable_lcd <= '1';
				firstPC <= "00000000000000000000000000000001";
			end if ResetState; 
		end if ClockSync;
	end process;
--		ClockSync : if rising_edge(clock) then
--			ResetState : if reset = '1' then
--				initstate 		<= INIT_STATE_LCD;
--				initLCD 			<= LCD_START_POWERON;
--				initLCDPowerOn <= LCD_POWERON_1;
--				initLCDConfig 	<= LCD_CONFIG_FUNCTION_SET;
--				enable_lcd 		<= '1';
--				clockCycles 	:= 0;
--				opstate <= "00";
--			elsif reset = '0' then
--				InitStateStart: if initstate = INIT_STATE_LCD then
--				
--					lcd_state <= '0';
--					
--					InitStateLCD : if initLCD = LCD_START_POWERON then
--					
--						PowerOnState : if initLCDPowerOn = LCD_POWERON_1 then
--							if clockCycles > POWERON_CLKWAIT_1 then
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_2;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_2 then
--							if clockCycles < POWERON_CLKWAIT_2 then
--								LCDDataBus(7 downto 4) <= "0011";	
--								LCDControl(2) <= '1';			-- Set pulse high
--								opstate <= "01";
--							else
--								LCDDataBus(7 downto 4) <= "0000";	
--								LCDControl(2) <= '0';			-- Set pulse low
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_3;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_3 then
--							if clockCycles > POWERON_CLKWAIT_3 then
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_4;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_4 then
--							if clockCycles < POWERON_CLKWAIT_4 then
--								LCDDataBus(7 downto 4) <= "0011";
--								LCDControl(2) <= '1';			-- Set pulse high
--							else
--								LCDDataBus(7 downto 4) <= "0000";	
--								LCDControl(2) <= '0';			-- Set pulse low
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_5;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_5 then
--							if clockCycles > POWERON_CLKWAIT_5 then
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_6;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_6 then
--							if clockCycles < POWERON_CLKWAIT_6 then
--								LCDDataBus(7 downto 4) <= "0011";
--								LCDControl(2) <= '1';			-- Set pulse high
--							else
--								LCDDataBus(7 downto 4) <= "0000";	
--								LCDControl(2) <= '0';			-- Set pulse low
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_7;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_7 then
--							if clockCycles > POWERON_CLKWAIT_7 then
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_8;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_8 then
--							if clockCycles < POWERON_CLKWAIT_8 then
--								LCDDataBus(7 downto 4) <= "0010";
--								LCDControl(2) <= '1';			-- Set pulse high
--							else
--								LCDDataBus(7 downto 4) <= "0000";	
--								LCDControl(2) <= '0';			-- Set pulse low
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_9;
--							end if;
--							
--						elsif initLCDPowerOn = LCD_POWERON_9 then
--							if clockCycles > POWERON_CLKWAIT_9 then
--								clockCycles := 0;
--								initLCDPowerOn <= LCD_POWERON_1;
--								initLCD <= LCD_START_CONFIG;
--								initLCDConfig <= LCD_CONFIG_FUNCTION_SET;
--							end if;
--						end if PowerOnState;
--						
--					elsif initLCD = LCD_START_CONFIG then
--					
--						ConfigState : if initLCDConfig = LCD_CONFIG_FUNCTION_SET then
--							-- 0x28
--							LCDDataBus <= "00101000";
--							LCDControl(1) <= '0';		
--							if clockCycles > CONFIG_FUNCTIONSET_CLKWAIT then
--								clockCycles := 0; 
--								initLCDConfig <= LCD_CONFIG_ENTRYMODE_SET;
--							end if;
--							
--						elsif initLCDConfig = LCD_CONFIG_ENTRYMODE_SET then
--							-- 0x06
--							LCDDataBus <= "00000110";
--							LCDControl(1) <= '0';		
--							if clockCycles > CONFIG_ENTRYMODE_CLKWAIT then
--								clockCycles := 0;
--								initLCDConfig <= LCD_CONFIG_DISPLAY_ONOFF;
--							end if;
--							
--						
--						elsif initLCDConfig = LCD_CONFIG_DISPLAY_ONOFF then
--							-- 0x0C
--							--LCDDataBus <= "00001100";
--							LCDDataBus <= "00001000";
--							LCDControl(1) <= '0';		
--							if clockCycles > CONFIG_DISPLAY_ONOFF_CLKWAIT then
--								clockCycles := 0;
--								initLCDConfig <= LCD_CONFIG_CLEAR_DISPLAY;
--							end if;	
--						
--					
--						elsif initLCDConfig = LCD_CONFIG_CLEAR_DISPLAY then
--							LCDDataBus <= "00000001";
--							LCDControl(1) <= '0';		
--							if clockCycles > CONFIG_CLEAR_DISPLAY_CLKWAIT then
--								clockCycles := 0;
--								initstate <= INIT_STATE_CPU;
--							end if;
--						end if ConfigState; 
--					end if InitStateLCD;
--					
--					clockCycles := clockCycles + 1;
--					   
--				elsif initstate = INIT_STATE_CPU then
--					firstPC <= "00000000000000000000000000000001";
--					initstate <= INIT_STATE_DONE;
--					
--					lcd_state <= '1';
--					
--					opstate <= "10";
--					
--				end if InitStateStart;
--			end if ResetState; 
--		end if ClockSync;
--	end process;
	

end Behavioral;

