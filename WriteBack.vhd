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
			ALU_op_addr : in STD_LOGIC_VECTOR(3 downto 0);		-- ALU write destination register
			ALU_op : in STD_LOGIC_VECTOR(31 downto 0);   		-- ALU operation result
			LDR_addr : in STD_LOGIC_VECTOR(3 downto 0);			-- Load word destination register
			LDR_word : in STD_LOGIC_VECTOR(31 downto 0)			-- Data to laod to register
		 );
end WriteBack;

architecture Behavioral of WriteBack is

	component MemRegion_Registers is
		Port( 
				rw_sel : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(3 downto 0);
				write_word : in STD_LOGIC_VECTOR(31 downto 0);
				read_word : out STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component MemRegion_Registers;
	
	signal reg_offset : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal write_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal read_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); -- This is an unnecessary wire, resolve this

begin

	memreg_registers : MemRegion_Registers port map
	(
		rw_sel => reg_write,
		offset => reg_offset,
		write_word => write_word,
		read_word => read_word
	);
	
	ProcWriteRegister : process(op_type)
	
	begin
	
		ifOptype : if op_type = optype_alu then
			-- Write back the alu result
			reg_offset <= ALU_op_addr;
			write_word <= ALU_op;
		
		elsif op_type = optype_datamove then
			-- Write back the word from ldr
			reg_offset <= LDR_addr;
			write_word <= LDR_word;
		
		end if ifOptype;
		
	end process ProcWriteRegister;

end Behavioral;

