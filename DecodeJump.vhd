----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:28 02/23/2014 
-- Design Name: 
-- Module Name:    DecodeCondition - Behavioral 
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

entity DecodeJump is
	Port( 
			cond : in STD_LOGIC_VECTOR(3 downto 0);
			NextPC : out STD_LOGIC_VECTOR(31 downto 0)
		  );
end DecodeJump;

architecture Behavioral of DecodeJump is

	component DecodeCondition is
		Port( 
				cond : in STD_LOGIC_VECTOR(3 downto 0);
				cond_true : out STD_LOGIC
			 );
	end component DecodeCondition;

begin


end Behavioral;

