----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:27 05/03/2014 
-- Design Name: 
-- Module Name:    DecodeInterruptCmd - Behavioral 
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

use work.cpu_types.all;

entity DecodeInterruptCmd is	
	Port( 
			InterruptData : in STD_LOGIC_VECTOR(23 downto 0); 
			endprogram : out STD_LOGIC
		 );
end DecodeInterruptCmd;

architecture Behavioral of DecodeInterruptCmd is

begin


	-----------------------------------
	-- 23-4		|	3-0
	-- Reserved	|	Interrupt command
	-----------------------------------
	
	
	ProcInterrupt : process(InterruptData)
	
	variable interrupt_cmd : STD_LOGIC_VECTOR(3 downto 0); 
	
	begin
		
		interrupt_cmd := InterruptData(3 downto 0);
		
		ifIntCmd : if interrupt_cmd = intcmd_endprogram then
			endprogram <= '1';
		end if ifIntCmd;
		
	end process ProcInterrupt;
	
end Behavioral;

