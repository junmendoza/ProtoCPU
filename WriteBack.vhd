----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:17 02/16/2014 
-- Design Name: 
-- Module Name:    WriteBack - Behavioral 
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

use work.cpu_types.all;

entity WriteBack is
	Port( 
			op_type : in STD_LOGIC_VECTOR(3 downto 0);  			-- select optype
			ALU_Rd_addr : in STD_LOGIC_VECTOR(3 downto 0);		-- ALU destination register
			Exec_out : in STD_LOGIC_VECTOR(31 downto 0);   		-- Execute operation result
			LDR_addr : in STD_LOGIC_VECTOR(3 downto 0);			-- Load word destination register
			LDR_word : in STD_LOGIC_VECTOR(31 downto 0)			-- Data to laod to register
		 );
end WriteBack;

architecture Behavioral of WriteBack is

	component RegisterFile is
		Port( 
				rw_sel : in STD_LOGIC_VECTOR(1 downto 0);
				Read_Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				Read_Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
				Write_Rn_addr : in STD_LOGIC_VECTOR(3 downto 0);
				write_word : in STD_LOGIC_VECTOR(31 downto 0);
				Rn1_word : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');		
				Rn2_word : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')			
			  );
	end component RegisterFile;
	
	signal Rn_write_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal write_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin
	
	ReadReg : RegisterFile port map
	(
		rw_sel			=> reg_rw_write,
		Read_Rn1_addr 	=> open,
		Read_Rn2_addr 	=> open,
		Write_Rn_addr 	=> Rn_write_addr,
		write_word 		=> write_word,
		Rn1_word 		=> open,	
		Rn2_word 		=> open	
	);
	
	ProcWriteRegister : process(op_type)
	
	begin
	
		ifOptype : if op_type = optype_alu then
			-- Write back the alu result
			Rn_write_addr <= ALU_Rd_addr;
			write_word <= Exec_out;
		
		elsif op_type = optype_datamove then
			-- Write back the word from ldr
			Rn_write_addr <= LDR_addr;
			write_word <= LDR_word;
		
		end if ifOptype;
		
	end process ProcWriteRegister;

end Behavioral;

