----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:52 02/23/2014 
-- Design Name: 
-- Module Name:    Compare - Behavioral 
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

entity Compare is
	Port( 
			ALU_out : in STD_LOGIC_VECTOR(31 downto 0);
         PSR : out STD_LOGIC_VECTOR(31 downto 0)
		 );
end Compare;

architecture Behavioral of Compare is
	
begin
		
	ProcCMP : process (ALU_out)
	begin	
	
		--	31 30 29 28			27-24					23-0
		--	Flags					Flags					Reserved
		--	Z	N	C	V 			Unused				Unused				
		
		--	Z Flag = if alu_out == 0 then 1 else 0
		IsALUZero : if (ALU_out or X"00000000") = X"00000000" then
			PSR(31) <= '1';
		else
			PSR(31) <= '0';
		end if IsALUZero;
		
		--	N Flag = alu_out[31]		
		PSR(30) <= ALU_out(31);

	end process ProcCMP; 

end Behavioral;

