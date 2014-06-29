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
			clock 	: in  STD_LOGIC; 
			cpu_init	: out  STD_LOGIC;
			firstPC 	: out STD_LOGIC_VECTOR(31 downto 0); -- firstPC signals the first isntruction needs to be fetched
			LCD_E  	: out STD_LOGIC; 
			LCD_RS  	: out STD_LOGIC;
			LCD_RW  	: out STD_LOGIC;
			LCD_DB7 	: out STD_LOGIC;
			LCD_DB6	: out STD_LOGIC;
			LCD_DB5 	: out STD_LOGIC;
			LCD_DB4 	: out STD_LOGIC;
			LCD_DB3 	: out STD_LOGIC;
			LCD_DB2 	: out STD_LOGIC;
			LCD_DB1 	: out STD_LOGIC;
			LCD_DB0 	: out STD_LOGIC
		 );
end InitializeCPU;

architecture Behavioral of InitializeCPU is

begin

	ProcessInitCPU : process(clock)
	begin
		ClockSync : if rising_edge(clock) then
			
		end if ClockSync;
	end process ProcessInitCPU;

end Behavioral;

