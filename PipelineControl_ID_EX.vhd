----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:57 03/17/2014 
-- Design Name: 
-- Module Name:    PipelineControl_ID_EX - Behavioral 
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

entity PipelineControl_ID_EX is
	Port( 
			clock : in STD_LOGIC;
			in_REG_ID_EX_getnextpc 				: in STD_LOGIC;
			in_REG_ID_EX_ExecNextPC 			: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_op_type 				: in STD_LOGIC_VECTOR(3 downto 0);  
			in_REG_ID_EX_op_alu 					: in STD_LOGIC_VECTOR(7 downto 0);  
			in_REG_ID_EX_op_datamove 			: in STD_LOGIC_VECTOR(7 downto 0); 
			in_REG_ID_EX_ALU_Rd_addr 			: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_ALU_Rn1 				: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_ALU_Rn2 				: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_DataMove_Rd_addr 	: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_DataMove_Rd 			: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_addrmode 				: in STD_LOGIC_VECTOR(3 downto 0); 
			in_REG_ID_EX_immd_word 				: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_memaddr_offset 		: in STD_LOGIC_VECTOR(31 downto 0);

			out_REG_ID_EX_getnextpc 			: out STD_LOGIC;
			out_REG_ID_EX_ExecNextPC 			: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_op_type 				: out STD_LOGIC_VECTOR(3 downto 0);  
			out_REG_ID_EX_op_alu 				: out STD_LOGIC_VECTOR(7 downto 0);  
			out_REG_ID_EX_op_datamove 			: out STD_LOGIC_VECTOR(7 downto 0); 
			out_REG_ID_EX_ALU_Rd_addr 			: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_ID_EX_ALU_Rn1 				: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_ALU_Rn2 				: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_DataMove_Rd_addr 	: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_ID_EX_DataMove_Rd 			: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_addrmode 				: out STD_LOGIC_VECTOR(3 downto 0); 
			out_REG_ID_EX_immd_word 			: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_memaddr_offset 		: out STD_LOGIC_VECTOR(31 downto 0)
			
		 );
end PipelineControl_ID_EX;

architecture Behavioral of PipelineControl_ID_EX is

begin

	PipelineProcess : process(
		clock, 
		in_REG_ID_EX_op_type, 			
		in_REG_ID_EX_op_alu,				
		in_REG_ID_EX_op_datamove, 		
		in_REG_ID_EX_ALU_Rd_addr, 		
		in_REG_ID_EX_ALU_Rn1, 			
		in_REG_ID_EX_ALU_Rn2, 			
		in_REG_ID_EX_DataMove_Rd_addr, 
		in_REG_ID_EX_DataMove_Rd, 		
		in_REG_ID_EX_addrmode, 			
		in_REG_ID_EX_immd_word, 			
		in_REG_ID_EX_memaddr_offset, 	
		in_REG_ID_EX_ExecNextPC, 		
		in_REG_ID_EX_getnextpc 		
	)
	begin
	
		ClockSync : if rising_edge(clock) then
		
			out_REG_ID_EX_op_type 				<= in_REG_ID_EX_op_type; 			
			out_REG_ID_EX_op_alu 				<= in_REG_ID_EX_op_alu;				
			out_REG_ID_EX_op_datamove 			<= in_REG_ID_EX_op_datamove; 		
			out_REG_ID_EX_ALU_Rd_addr 			<= in_REG_ID_EX_ALU_Rd_addr; 		
			out_REG_ID_EX_ALU_Rn1 				<= in_REG_ID_EX_ALU_Rn1; 			
			out_REG_ID_EX_ALU_Rn2 				<= in_REG_ID_EX_ALU_Rn2; 			
			out_REG_ID_EX_DataMove_Rd_addr	<= in_REG_ID_EX_DataMove_Rd_addr; 
			out_REG_ID_EX_DataMove_Rd 			<= in_REG_ID_EX_DataMove_Rd; 		
			out_REG_ID_EX_addrmode 				<= in_REG_ID_EX_addrmode; 			
			out_REG_ID_EX_immd_word 			<= in_REG_ID_EX_immd_word; 			
			out_REG_ID_EX_memaddr_offset 		<= in_REG_ID_EX_memaddr_offset; 	
			out_REG_ID_EX_ExecNextPC 			<= in_REG_ID_EX_ExecNextPC; 		
			out_REG_ID_EX_getnextpc 			<= in_REG_ID_EX_getnextpc; 	
			
		end if ClockSync;
		
	end process PipelineProcess;

end Behavioral;

