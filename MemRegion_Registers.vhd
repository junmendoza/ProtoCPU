----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:20 02/04/2014 
-- Design Name: 
-- Module Name:    MemRegion_Registers - Behavioral 
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

use IEEE.NUMERIC_STD.ALL;
use work.cpu_types.all;

entity MemRegion_Registers is
	Port( 
			reg_addr : in STD_LOGIC_VECTOR(3 downto 0);
			reg_word : out STD_LOGIC_VECTOR(31 downto 0)
		  );
end MemRegion_Registers;

architecture Behavioral of MemRegion_Registers is

	signal MemoryRegion : t_MemRegion_Regs_size :=
	(
		X"00000001", 
		X"00000002", 
		X"00000003", 
		X"00000004",
		X"00000005", 
		X"00000006", 
		X"00000007", 
		X"00000008",
		X"00000009", 
		X"0000000A", 
		X"0000000B", 
		X"0000000C",
		X"0000000D", 
		X"0000000E", 
		X"0000000F"
	);
	
begin

	ProcMemAccess : process(reg_addr)
	
	variable offset_addr : integer;
	
	begin
			offset_addr := to_integer(signed(reg_addr));
			reg_word <= MemoryRegion(offset_addr);
			
	end process ProcMemAccess;

end Behavioral;

