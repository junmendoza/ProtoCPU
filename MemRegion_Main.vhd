----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:20 02/04/2014 
-- Design Name: 
-- Module Name:    MemRegion_Main - Behavioral 
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

entity MemRegion_Main is
	Port( 
			rw_sel : in STD_LOGIC;
			offset : in STD_LOGIC_VECTOR(31 downto 0);
			store_word : in STD_LOGIC_VECTOR(31 downto 0);
			load_word : out STD_LOGIC_VECTOR(31 downto 0)
		  );
end MemRegion_Main;

architecture Behavioral of MemRegion_Main is

	signal MemoryRegion : t_MemRegion_Main :=
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
		X"0000000F",
		X"00010000", 
		
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
		X"0000000F",
		X"00010000", 
		
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
		X"0000000F",
		X"00010000", 
		
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
		X"0000000F",
		X"00010000"
	);
	
begin

	ProcMemAccess : process(offset)
	
	variable offset_addr : integer;
	
	begin
			offset_addr := to_integer(unsigned(offset));
			
			mem_rw_mode : if rw_sel = mem_read then
				load_word <= MemoryRegion(offset_addr);
			elsif rw_sel = mem_write then 
				MemoryRegion(offset_addr) <= store_word;
			end if mem_rw_mode;
			
	end process ProcMemAccess;

end Behavioral;

