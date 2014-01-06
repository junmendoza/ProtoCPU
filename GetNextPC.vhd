----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:30 11/17/2013 
-- Design Name: 
-- Module Name:    GetNextPC - Behavioral 
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

entity GetNextPC is
    Port( clock : in STD_LOGIC;
			 nextpc : in STD_LOGIC;	
			 pc : out STD_LOGIC_VECTOR(31 downto 0)
			);
end GetNextPC;

architecture Behavioral of GetNextPC is

begin

	GetPC : process(nextpc) is 
	
	begin
		ClockSync : if rising_edge(clock) then
			-- Get the PC from the PC register
			-- Increment PC
			-- Store the PC back to the PC register       
		end if ClockSync;
	end process GetPC;
	
end architecture Behavioral;

