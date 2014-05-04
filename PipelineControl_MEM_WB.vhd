----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:19:04 03/20/2014 
-- Design Name: 
-- Module Name:    PipelineControl_MEM_WB - Behavioral 
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

entity PipelineControl_MEM_WB is
	Port( 
			clock 											: in STD_LOGIC;
				
			in_MEM_load_mem_word 						: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_EX_MEM_Exec_out 						: in STD_LOGIC_VECTOR(31 downto 0);   
			in_REG_ID_EX_MEM_op_type 					: in STD_LOGIC_VECTOR(3 downto 0);  
			in_REG_ID_EX_MEM_ALU_Rd_addr 				: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_MEM_DataMove_Rd_addr 		: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_MEM_ExecNextPC 				: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_MEM_getnextpc 				: in STD_LOGIC;
			in_REG_ID_EX_MEM_endprogram 				: in STD_LOGIC;
				
			out_MEM_WB_load_mem_word 					: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_EX_MEM_WB_Exec_out 				: out STD_LOGIC_VECTOR(31 downto 0);   
			out_REG_ID_EX_MEM_WB_op_type 				: out STD_LOGIC_VECTOR(3 downto 0);  
			out_REG_ID_EX_MEM_WB_ALU_Rd_addr 		: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_ID_EX_MEM_WB_DataMove_Rd_addr 	: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_ID_EX_MEM_WB_ExecNextPC 			: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_MEM_WB_getnextpc 			: out STD_LOGIC;
			out_REG_ID_EX_MEM_WB_endprogram 			: out STD_LOGIC
		 );
		 
end PipelineControl_MEM_WB;

architecture Behavioral of PipelineControl_MEM_WB is

begin

	PipelineProcess : process
	(
		clock,
		in_MEM_load_mem_word, 					
		in_REG_EX_MEM_Exec_out, 					
		in_REG_ID_EX_MEM_op_type, 				
		in_REG_ID_EX_MEM_ALU_Rd_addr, 			
		in_REG_ID_EX_MEM_DataMove_Rd_addr, 	
		in_REG_ID_EX_MEM_ExecNextPC, 			
		in_REG_ID_EX_MEM_getnextpc, 			
		in_REG_ID_EX_MEM_endprogram 		
	)
	
	begin
	
		ClockSync : if rising_edge(clock) then
		
			out_MEM_WB_load_mem_word 					<=	in_MEM_load_mem_word; 							
			out_REG_EX_MEM_WB_Exec_out 				<= in_REG_EX_MEM_Exec_out; 				
			out_REG_ID_EX_MEM_WB_op_type 				<= in_REG_ID_EX_MEM_op_type; 				
			out_REG_ID_EX_MEM_WB_ALU_Rd_addr 		<= in_REG_ID_EX_MEM_ALU_Rd_addr; 		
			out_REG_ID_EX_MEM_WB_DataMove_Rd_addr 	<= in_REG_ID_EX_MEM_DataMove_Rd_addr;
			out_REG_ID_EX_MEM_WB_ExecNextPC			<= in_REG_ID_EX_MEM_ExecNextPC;
			out_REG_ID_EX_MEM_WB_getnextpc			<= in_REG_ID_EX_MEM_getnextpc;
			out_REG_ID_EX_MEM_WB_endprogram			<= in_REG_ID_EX_MEM_endprogram;
			
		end if ClockSync;
		
	end process PipelineProcess;

end Behavioral;

