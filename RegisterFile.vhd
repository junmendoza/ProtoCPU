----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:10 04/01/2014 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
	Port( 
			rw_sel : in STD_LOGIC_VECTOR(1 downto 0);
			Read_Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Read_Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
			Write_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
			write_word : in STD_LOGIC_VECTOR(31 downto 0);		-- Write this word to Write_Rn_addr
			Rn1_word : out STD_LOGIC_VECTOR(31 downto 0);		-- Read this word from Read_Rn1_addr
			Rn2_word : out STD_LOGIC_VECTOR(31 downto 0)			-- Read this word from Read_Rn2_addr
		  );
end RegisterFile;

architecture Behavioral of RegisterFile is

	signal RegisterMemory : t_MemRegion_Regs :=
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

	ProcRegisterAccess : process(rw_sel)
	
	variable read_addr1 : integer;
	variable read_addr2 : integer;
	variable write_addr : integer;
	
	begin
			
			reg_rw_mode : if rw_sel = reg_read1 then
			
				read_addr1 := to_integer(unsigned(Read_Rn1_addr));
				Rn1_word <= RegisterMemory(read_addr1);
				
			elsif rw_sel = reg_read2
			
				read_addr1 := to_integer(unsigned(Read_Rn1_addr));
				read_addr2 := to_integer(unsigned(Read_Rn2_addr));
			
				Rn1_word <= RegisterMemory(read_addr1);
				Rn2_word <= RegisterMemory(read_addr2);
				
			elsif rw_sel = reg_write then 
			
				write_addr := to_integer(unsigned(Write_Rn_addr));
				RegisterMemory(write_addr) <= write_word;
				
			end if reg_rw_mode;
			
	end process ProcRegisterAccess;

end Behavioral;

