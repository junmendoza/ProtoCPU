----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:36 07/06/2014 
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

begin
   

end Behavioral;

