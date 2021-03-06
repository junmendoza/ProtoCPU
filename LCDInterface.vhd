----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:38:29 06/30/2014 
-- Design Name: 
-- Module Name:    LCDInterface - Behavioral 
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

entity LCDInterface is
	Port( 
			clock 			: in STD_LOGIC;	-- 0 -> Disable signals to LCD, 1 -> Enable signals to LCD 	
			reset 			: in STD_LOGIC;	-- 0 -> Disable signals to LCD, 1 -> Enable signals to LCD 	
			sel 					: in STD_LOGIC_VECTOR(1 downto 0);	-- 0 -> Initialize LCD, 1 -> Write LCD	
			enable_lcd 			: in STD_LOGIC;	-- 0 -> Disable signals to LCD, 1 -> Enable signals to LCD 	
		
			init_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
			init_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
			
			write_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
			write_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
			
			LCDDataBus			: out STD_LOGIC_VECTOR(7 downto 0); 
			LCDControl			: out STD_LOGIC_VECTOR(2 downto 0);
			LED : out STD_LOGIC_VECTOR(7 downto 0)
		 );
end LCDInterface;

architecture Behavioral of LCDInterface is

begin

	process (clock, reset)
	begin
		if reset = '1' then
			LED(4) <= '0';
			LED(5) <= '0';
		elsif reset = '0' then 
			if rising_edge(clock) then
				if enable_lcd = '1' then
					if sel = "01" then
						LED(4) <= '1';
						LCDDataBus <= init_LCDDataBus;
						LCDControl <= init_LCDControl;
					elsif sel = "10" then
						LCDDataBus <= write_LCDDataBus;
						LCDControl <= write_LCDControl;
						LED(5) <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
--	process (init_LCDDataBus, init_LCDControl, write_LCDDataBus, write_LCDControl)
--	begin
--		if enable_lcd = '1' then
--			if sel = "01" then
--				LED(4) <= '1';
--				LCDDataBus <= init_LCDDataBus;
--				LCDControl <= init_LCDControl;
--			elsif sel = "10" then
--				LCDDataBus <= write_LCDDataBus;
--				LCDControl <= write_LCDControl;
--				LED(5) <= '1';
--			end if;
--		else
--			LED(6) <= '1';
--		end if;
--	end process;

	
end Behavioral;

