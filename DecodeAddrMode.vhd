----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:14:43 01/28/2014 
-- Design Name: 
-- Module Name:    DecodeAddrMode - Behavioral 
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

entity DecodeAddrMode is
	Port( 
			DataMove_AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			addrmode_immd: out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_immd_addr: out STD_LOGIC_VECTOR(7 downto 0);
			addrmode_reg_addr: out STD_LOGIC_VECTOR(7 downto 0)
		 );
end DecodeAddrMode;

architecture Behavioral of DecodeAddrMode is

begin
	
	ProcAddrMode : process(DataMove_AddrMode)
	
	variable mode : STD_LOGIC_VECTOR(3 downto 0) := DataMove_AddrMode(11 downto 8); 
	variable address : STD_LOGIC_VECTOR(7 downto 0) := DataMove_AddrMode(7 downto 0);
	
	begin
		
		if_mode : if mode = addrmode_mode_immd then
			addrmode_immd <= address;
		elsif mode = addrmode_mode_memaddr then
			addrmode_immd_addr <= address;
		elsif mode = addrmode_mode_regaddr then
			addrmode_reg_addr <= address;
		end if if_mode;
		
	end process ProcAddrMode;

end Behavioral;
