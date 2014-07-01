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
			sel : in STD_LOGIC;	-- 0 -> Initialize LCD, 1 -> Write LCD	
			
				init_LCD_DB7 : in STD_LOGIC;
				init_LCD_DB6 : in STD_LOGIC;
				init_LCD_DB5 : in STD_LOGIC;
				init_LCD_DB4 : in STD_LOGIC;
				init_LCD_DB3 : in STD_LOGIC;
				init_LCD_DB2 : in STD_LOGIC;
				init_LCD_DB1 : in STD_LOGIC;
				init_LCD_DB0 : in STD_LOGIC;
				init_LCD_E   : in STD_LOGIC;
				init_LCD_RS  : in STD_LOGIC;
				init_LCD_RW  : in STD_LOGIC;
				
				write_LCD_DB7 : in STD_LOGIC;
				write_LCD_DB6 : in STD_LOGIC;
				write_LCD_DB5 : in STD_LOGIC;
				write_LCD_DB4 : in STD_LOGIC;
				write_LCD_DB3 : in STD_LOGIC;
				write_LCD_DB2 : in STD_LOGIC;
				write_LCD_DB1 : in STD_LOGIC;
				write_LCD_DB0 : in STD_LOGIC;
				write_LCD_E   : in STD_LOGIC;
				write_LCD_RS  : in STD_LOGIC;
				write_LCD_RW  : in STD_LOGIC;
				
				LCD_DB7 : out STD_LOGIC;
				LCD_DB6 : out STD_LOGIC;
				LCD_DB5 : out STD_LOGIC;
				LCD_DB4 : out STD_LOGIC;
				LCD_DB3 : out STD_LOGIC;
				LCD_DB2 : out STD_LOGIC;
				LCD_DB1 : out STD_LOGIC;
				LCD_DB0 : out STD_LOGIC;
				LCD_E   : out STD_LOGIC;
				LCD_RS  : out STD_LOGIC;
				LCD_RW  : out STD_LOGIC
		 );
end LCDInterface;

architecture Behavioral of LCDInterface is

begin
	LCD_E 	<= init_LCD_E		when sel='0' else write_LCD_E;
	LCD_RS 	<= init_LCD_RS  	when sel='0' else write_LCD_RS;  
	LCD_RW	<= init_LCD_RW 	when sel='0' else write_LCD_RW; 
	LCD_DB7 	<= init_LCD_DB7 	when sel='0' else write_LCD_DB7; 
	LCD_DB6 	<= init_LCD_DB6 	when sel='0' else write_LCD_DB6; 
	LCD_DB5  <= init_LCD_DB5 	when sel='0' else write_LCD_DB5;
	LCD_DB4 	<= init_LCD_DB4 	when sel='0' else write_LCD_DB4; 
	LCD_DB3  <= init_LCD_DB3 	when sel='0' else write_LCD_DB3;
	LCD_DB2  <= init_LCD_DB2 	when sel='0' else write_LCD_DB2;
	LCD_DB1  <= init_LCD_DB1 	when sel='0' else write_LCD_DB1;
	LCD_DB0 	<= init_LCD_DB0 	when sel='0' else write_LCD_DB0; 
end Behavioral;

