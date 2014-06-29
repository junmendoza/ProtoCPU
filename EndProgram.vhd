----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:10 12/25/2013 
-- Design Name: 
-- Module Name:    EndProgram - Behavioral 
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

entity EndProgram is
	Port( 
			clock : in STD_LOGIC; 
			endexecution : in STD_LOGIC
		 );
end EndProgram;

architecture Behavioral of EndProgram is
	 
begin

	ExecDone: process(clock, endexecution)
	begin
		ClockSync : if rising_edge(clock) then
			
		end if ClockSync;
	end process ExecDone;


end Behavioral;

