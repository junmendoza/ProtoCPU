----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:39 03/17/2014 
-- Design Name: 
-- Module Name:    Pipelinecontrol_EX_MEM - Behavioral 
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


entity Pipelinecontrol_EX_MEM is
	Port(
			clock : in  STD_LOGIC;			
			
			-- From Execute
			in_REG_EX_MEM_Exec_out 				: in STD_LOGIC_VECTOR(31 downto 0);     
			in_REG_EX_MEM_effective_addr 		: in STD_LOGIC_VECTOR(31 downto 0);
			
			-- From Decode
			in_REG_ID_EX_op_type 				: in STD_LOGIC_VECTOR(3 downto 0);  
			in_REG_ID_EX_op_datamove 			: in STD_LOGIC_VECTOR(7 downto 0); 
			in_REG_ID_EX_ALU_Rd_addr 			: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_DataMove_Rd_addr 	: in STD_LOGIC_VECTOR(3 downto 0);
			in_REG_ID_EX_DataMove_Rd 			: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_addrmode 				: in STD_LOGIC_VECTOR(3 downto 0); 
			in_REG_ID_EX_immd_word 				: in STD_LOGIC_VECTOR(31 downto 0);
			
			in_REG_ID_EX_ExecNextPC 			: in STD_LOGIC_VECTOR(31 downto 0);
			in_REG_ID_EX_getnextpc 				: in STD_LOGIC;
			in_REG_ID_EX_endprogram 			: in STD_LOGIC;
			
			
			-- From Execute
			out_REG_EX_MEM_Exec_out 			: out STD_LOGIC_VECTOR(31 downto 0);     
			out_REG_EX_MEM_effective_addr 	: out STD_LOGIC_VECTOR(31 downto 0);
			
			-- From Decode
			out_REG_EX_MEM_op_type 				: out STD_LOGIC_VECTOR(3 downto 0);  
			out_REG_EX_MEM_op_datamove 		: out STD_LOGIC_VECTOR(7 downto 0); 
			out_REG_EX_MEM_ALU_Rd_addr 		: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_EX_MEM_DataMove_Rd_addr 	: out STD_LOGIC_VECTOR(3 downto 0);
			out_REG_EX_MEM_DataMove_Rd 		: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_EX_MEM_addrmode 			: out STD_LOGIC_VECTOR(3 downto 0); 
			out_REG_EX_MEM_immd_word 			: out STD_LOGIC_VECTOR(31 downto 0);
			
			out_REG_ID_EX_MEM_ExecNextPC 		: out STD_LOGIC_VECTOR(31 downto 0);
			out_REG_ID_EX_MEM_getnextpc 		: out STD_LOGIC;
			out_REG_ID_EX_MEM_endprogram 		: out STD_LOGIC
		 );
		 
end Pipelinecontrol_EX_MEM;

architecture Behavioral of Pipelinecontrol_EX_MEM is

begin

	PipelineProcess : process
	(
		clock, 
		in_REG_EX_MEM_Exec_out,
		in_REG_EX_MEM_effective_addr,
		in_REG_ID_EX_op_type, 			
		in_REG_ID_EX_op_datamove, 		
		in_REG_ID_EX_ALU_Rd_addr, 		
		in_REG_ID_EX_DataMove_Rd_addr, 
		in_REG_ID_EX_DataMove_Rd, 		
		in_REG_ID_EX_addrmode, 			
		in_REG_ID_EX_immd_word,
		in_REG_ID_EX_ExecNextPC,
		in_REG_ID_EX_getnextpc,
		in_REG_ID_EX_endprogram
	)
	
	begin
	
		ClockSync : if rising_edge(clock) then
		
			-- From Execute
			out_REG_EX_MEM_Exec_out 				<= in_REG_EX_MEM_Exec_out;
			out_REG_EX_MEM_effective_addr 		<= in_REG_EX_MEM_effective_addr;
			
			-- From Decode
			out_REG_EX_MEM_op_type 					<= in_REG_ID_EX_op_type; 					
			out_REG_EX_MEM_op_datamove 		   <= in_REG_ID_EX_op_datamove; 		
			out_REG_EX_MEM_ALU_Rd_addr 		   <= in_REG_ID_EX_ALU_Rd_addr; 		
			out_REG_EX_MEM_DataMove_Rd_addr   	<= in_REG_ID_EX_DataMove_Rd_addr; 
			out_REG_EX_MEM_DataMove_Rd 		   <= in_REG_ID_EX_DataMove_Rd; 		
			out_REG_EX_MEM_addrmode 			   <= in_REG_ID_EX_addrmode; 			
			out_REG_EX_MEM_immd_word 		   	<= in_REG_ID_EX_immd_word; 
			
			out_REG_ID_EX_MEM_ExecNextPC 			<= in_REG_ID_EX_ExecNextPC; 
			out_REG_ID_EX_MEM_getnextpc 			<= in_REG_ID_EX_getnextpc;	
			
		end if ClockSync;
		
	end process PipelineProcess;

end Behavioral;

