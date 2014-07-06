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
			sel 					: in STD_LOGIC;	-- 0 -> Initialize LCD, 1 -> Write LCD	
		
			init_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
			init_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
			
			write_LCDDataBus	: in STD_LOGIC_VECTOR(7 downto 0); 
			write_LCDControl	: in STD_LOGIC_VECTOR(2 downto 0);
			
			LCDDataBus			: out STD_LOGIC_VECTOR(7 downto 0); 
			LCDControl			: out STD_LOGIC_VECTOR(2 downto 0)
		 );
end LCDInterface;

architecture Behavioral of LCDInterface is

begin

	ProcMux : process (sel, init_LCDDataBus, init_LCDControl, write_LCDDataBus, write_LCDControl)
	begin
		if sel = '0' then
			LCDDataBus <= init_LCDDataBus;
			LCDControl <= init_LCDControl;
		elsif sel = '1' then
			LCDDataBus <= write_LCDDataBus;
			LCDControl <= write_LCDControl;
		end if;
	end process ProcMux;
	
end Behavioral;

