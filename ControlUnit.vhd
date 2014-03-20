----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:06:01 11/17/2013 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code. 
--library UNISIM;
--use UNISIM.VComponents.all;

use work.cpu_types.ALL;

entity ControlUnit is
    Port( 
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			result : out STD_LOGIC
		  );
			
end ControlUnit;


-------------------------------------
-- component ControlUnit()
--		MemoryInit()
--		LoadInstructions()
--		SetFirstPC()
--		Fetch(in pc, out instr)
--		Decode(in instr, out pc)
--		GetNextPC(out pc)
-- end component
-------------------------------------
	
architecture Behavioral of ControlUnit is

	------------------------------------
	-- Component definitions 
	------------------------------------
	component Fetch is 
		Port( 
				clock : in STD_LOGIC; 
				getnextpc : in STD_LOGIC;
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component Decode is  
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_type : out STD_LOGIC_VECTOR(3 downto 0);  
				op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
				op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
				ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				ALU_Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
				ALU_Rn2 : out STD_LOGIC_VECTOR(31 downto 0);
				DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				DataMove_Rd : out STD_LOGIC_VECTOR(31 downto 0);
				addrmode : out STD_LOGIC_VECTOR(3 downto 0); 
				immd_word : out STD_LOGIC_VECTOR(31 downto 0);
				memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0);
				ExecNextPC : out STD_LOGIC_VECTOR(31 downto 0);
				getnextpc : out STD_LOGIC
			 );
	end component Decode;
	
	component Execute is  
		Port( 
				op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
				ALU_op1 : in STD_LOGIC_VECTOR(31 downto 0); 
				ALU_op2 : in STD_LOGIC_VECTOR(31 downto 0);  
				memaddr_offset : in STD_LOGIC_VECTOR(31 downto 0); 
				Exec_out : out STD_LOGIC_VECTOR(31 downto 0);     
				effective_addr : out STD_LOGIC_VECTOR(31 downto 0)
			);
	end component Execute;
	
	component MemoryAccess is
		Port( 
				opcode : in STD_LOGIC_VECTOR(7 downto 0);	
				Rd : in STD_LOGIC_VECTOR(31 downto 0);							-- Word input from Decode (str)
				effective_addr : in STD_LOGIC_VECTOR(31 downto 0);			-- ldr word memory addr location/str dest memory addr
				mem_word : out STD_LOGIC_VECTOR(31 downto 0)					-- word retrieved from mem to load (ldr)
			 );
	end component MemoryAccess;
	
	component Mux_LoadWord is
		Port( 
				sel_src : in STD_LOGIC_VECTOR(3 downto 0);
				load_word_ID : in STD_LOGIC_VECTOR(31 downto 0);		-- Load word - immediate word from decode
				load_word_MEM : in STD_LOGIC_VECTOR(31 downto 0);		-- Load word - loaded from memory access
				load_word : out STD_LOGIC_VECTOR(31 downto 0)			
			 );
	end component Mux_LoadWord;
	
	component WriteBack is
		Port( 
				op_type : in STD_LOGIC_VECTOR(3 downto 0);  			-- select optype
				ALU_Rd_addr : in STD_LOGIC_VECTOR(3 downto 0);		-- ALU destination register
				Exec_out : in STD_LOGIC_VECTOR(31 downto 0);   		-- Execute operation result
				LDR_addr : in STD_LOGIC_VECTOR(3 downto 0);			-- Load word destination register
				LDR_word : in STD_LOGIC_VECTOR(31 downto 0)			-- Data to laod to register
			 );
	end component WriteBack;
	
	
	
	
	------------------------------------
	-- Pipeline Controls
	------------------------------------
	component PipelineControl_IF_ID is
	Port( 
			clock : in STD_LOGIC;
			in_REG_IF_ID_instr : in STD_LOGIC_VECTOR (31 downto 0);
			out_REG_IF_ID_instr : out STD_LOGIC_VECTOR (31 downto 0)
		 );
	end component PipelineControl_IF_ID;
	
	
	component PipelineControl_ID_EX is
		Port( 
				clock : in STD_LOGIC;
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
				in_REG_ID_EX_ExecNextPC 			: in STD_LOGIC_VECTOR(31 downto 0);
				in_REG_ID_EX_getnextpc 				: in STD_LOGIC;
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
				out_REG_ID_EX_memaddr_offset 		: out STD_LOGIC_VECTOR(31 downto 0);
				out_REG_ID_EX_ExecNextPC 			: out STD_LOGIC_VECTOR(31 downto 0);
				out_REG_ID_EX_getnextpc 			: out STD_LOGIC
				
			 );
	end component PipelineControl_ID_EX;


	component Pipelinecontrol_EX_MEM is
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
				out_REG_EX_MEM_immd_word 			: out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Pipelinecontrol_EX_MEM;
	
	
	component PipelineControl_MEM_WB is
		Port( 
				clock : in STD_LOGIC;
				
				in_MEM_load_mem_word : in STD_LOGIC_VECTOR(31 downto 0);
				in_REG_ID_EX_MEM_Exec_out : in STD_LOGIC_VECTOR(31 downto 0);     
				in_REG_ID_EX_MEM_addrmode : in STD_LOGIC_VECTOR(3 downto 0); 
				in_REG_ID_EX_MEM_immd_word : in STD_LOGIC_VECTOR(31 downto 0);
				in_REG_ID_EX_MEM_op_type : in STD_LOGIC_VECTOR(3 downto 0);  
				in_REG_ID_EX_MEM_ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
				in_REG_ID_EX_MEM_DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
				
				out_MEM_WB_load_mem_word : out STD_LOGIC_VECTOR(31 downto 0);
				out_REG_ID_EX_MEM_WB_Exec_out : out STD_LOGIC_VECTOR(31 downto 0);     
				out_REG_ID_EX_MEM_WB_addrmode : out STD_LOGIC_VECTOR(3 downto 0); 
				out_REG_ID_EX_MEM_WB_immd_word : out STD_LOGIC_VECTOR(31 downto 0);
				out_REG_ID_EX_MEM_WB_op_type : out STD_LOGIC_VECTOR(3 downto 0);  
				out_REG_ID_EX_MEM_WB_ALU_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				out_REG_ID_EX_MEM_WB_DataMove_Rd_addr : out STD_LOGIC_VECTOR(3 downto 0)
			 );
			 
	end component PipelineControl_MEM_WB;
		
	------------------------------------
	-- ControlUnit signals
	------------------------------------
	
	-- Registers
	signal R1  : STD_LOGIC_VECTOR(31 downto 0);
	signal R2  : STD_LOGIC_VECTOR(31 downto 0);
	signal R3  : STD_LOGIC_VECTOR(31 downto 0);
	signal R4  : STD_LOGIC_VECTOR(31 downto 0);
	signal R5  : STD_LOGIC_VECTOR(31 downto 0);
	signal R6  : STD_LOGIC_VECTOR(31 downto 0);
	signal R7  : STD_LOGIC_VECTOR(31 downto 0);
	signal R8  : STD_LOGIC_VECTOR(31 downto 0);
	signal R9  : STD_LOGIC_VECTOR(31 downto 0);
	signal R10 : STD_LOGIC_VECTOR(31 downto 0);
	signal R11 : STD_LOGIC_VECTOR(31 downto 0);
	signal R12 : STD_LOGIC_VECTOR(31 downto 0);
	signal R13 : STD_LOGIC_VECTOR(31 downto 0);
	signal R14 : STD_LOGIC_VECTOR(31 downto 0);
	signal R15 : STD_LOGIC_VECTOR(31 downto 0);
	
	signal exec_mem  	 : STD_LOGIC_VECTOR(7 downto 0);
	
	
	signal load_word : STD_LOGIC_VECTOR(31 downto 0);
	
	
	
	
	--------------------------------
	-- Pipline registers
	--------------------------------
	
	--------------------------------------------
	-- Fetch_Decode (IF_ID)
	--------------------------------------------
	signal REG_IF_ID_instr : STD_LOGIC_VECTOR(31 downto 0);
	
	
	--------------------------------------------
	-- Decode out signals
	--------------------------------------------
	signal ID_op_type : STD_LOGIC_VECTOR(3 downto 0);  
	signal ID_op_alu : STD_LOGIC_VECTOR(7 downto 0);  
	signal ID_op_datamove : STD_LOGIC_VECTOR(7 downto 0); 
	signal ID_ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ID_ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ID_DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_addrmode : STD_LOGIC_VECTOR(3 downto 0); 
	signal ID_immd_word : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_memaddr_offset : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_ExecNextPC : STD_LOGIC_VECTOR(31 downto 0);
	signal ID_getnextpc : STD_LOGIC;
	
	
	--------------------------------------------
	-- Execute out signals
	--------------------------------------------
	signal EX_Exec_Out : STD_LOGIC_VECTOR(31 downto 0);
	signal EX_effective_address : STD_LOGIC_VECTOR(31 downto 0);
	
	
	--------------------------------------------
	-- Mem access out signals
	--------------------------------------------
	signal MEM_load_mem_word : STD_LOGIC_VECTOR(31 downto 0);
	
	--------------------------------------------
	-- ID->EX Registers
	--------------------------------------------
	signal REG_ID_EX_op_type : STD_LOGIC_VECTOR(3 downto 0);  
	signal REG_ID_EX_op_alu : STD_LOGIC_VECTOR(7 downto 0);  
	signal REG_ID_EX_op_datamove : STD_LOGIC_VECTOR(7 downto 0); 
	signal REG_ID_EX_ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_addrmode : STD_LOGIC_VECTOR(3 downto 0); 
	signal REG_ID_EX_immd_word : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_memaddr_offset : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_ExecNextPC : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_getnextpc : STD_LOGIC;
	

	--------------------------------------------
	-- ID->EX->MEM Registers
	--------------------------------------------
	signal REG_ID_EX_MEM_op_type : STD_LOGIC_VECTOR(3 downto 0); 
	signal REG_ID_EX_MEM_op_datamove : STD_LOGIC_VECTOR(7 downto 0); 
	signal REG_ID_EX_MEM_DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_MEM_ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_MEM_DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_addrmode : STD_LOGIC_VECTOR(3 downto 0); 
	signal REG_ID_EX_MEM_immd_word : STD_LOGIC_VECTOR(31 downto 0);
	
--	--------------------------------------------
--	-- Decode Execute (ID_EX)
--	--------------------------------------------
--	-- ID->EX
--	signal REG_ID_EX_op_alu : STD_LOGIC_VECTOR(7 downto 0);  
--	signal REG_ID_EX_ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0);
--	signal REG_ID_EX_ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0);
--	signal REG_ID_EX_memaddr_offset : STD_LOGIC_VECTOR(31 downto 0);


--	
--	-- ID->EX, EX->MEM
--	signal REG_ID_EX_op_datamove : STD_LOGIC_VECTOR(7 downto 0); 
--	signal REG_ID_EX_DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
--	signal REG_ID_EX_MEM_op_datamove : STD_LOGIC_VECTOR(7 downto 0); 
--	signal REG_ID_EX_MEM_DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_Exec_out : STD_LOGIC_VECTOR(31 downto 0);     
	signal REG_ID_EX_MEM_effective_addr : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_ExecNextPC : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_getnextpc : STD_LOGIC;


	
	-- ID->EX, EX->MEM, MEM->WB
	signal MEM_WB_load_mem_word : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_WB_op_type : STD_LOGIC_VECTOR(3 downto 0);  
	signal REG_ID_EX_MEM_WB_DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_MEM_WB_ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal REG_ID_EX_MEM_WB_Exec_out : STD_LOGIC_VECTOR(31 downto 0);     
	signal REG_ID_EX_MEM_WB_addrmode : STD_LOGIC_VECTOR(3 downto 0); 
	signal REG_ID_EX_MEM_WB_immd_word : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_WB_ExecNextPC : STD_LOGIC_VECTOR(31 downto 0);
	signal REG_ID_EX_MEM_WB_getnextpc : STD_LOGIC;

	
	--------------------------------------------
	-- Execute MemAccess(EX_MEM)
	--------------------------------------------
	-- EX->MEM
	
	-- EX->MEM, MEM->WB
	signal REG_EX_MEM_WB_Exec_out : STD_LOGIC_VECTOR(31 downto 0);     
	signal REG_EX_MEM_WB_effective_addr : STD_LOGIC_VECTOR(31 downto 0);
	
	
	--------------------------------------------
	-- MemAccess Writeback (MEM_WB)
	--------------------------------------------
	signal REG_MEM_WB_mem_word : STD_LOGIC_VECTOR(31 downto 0);					
	signal REG_MEM_WB_load_word : STD_LOGIC_VECTOR(31 downto 0);		
	
	 
begin
	
	FetchInstruction : Fetch port map
	(
		clock => clock, 
		getnextpc => REG_ID_EX_MEM_WB_getnextpc,		-- in fetch op
		pc => REG_ID_EX_MEM_WB_ExecNextPC, 				-- in current pc
		instr => R2												-- out next instruction -> ID
	);
	
	Pipeline_IF_ID : PipelineControl_IF_ID port map
	(
		clock => clock, 
		in_REG_IF_ID_instr => R2,
		out_REG_IF_ID_instr => REG_IF_ID_instr
	);

	DecodeInstruction : Decode port map 
	(
		instruction 		=> R2,						-- in instruction to decode 			<- IF
		op_type 				=> ID_op_type,				-- out instr/operation type			-> WB	
		op_alu 				=> ID_op_alu,  			-- out  ALU operation					-> ALU
		op_datamove 		=> ID_op_datamove,		-- out datamove operation				-> MEM
		ALU_Rd_addr 		=> ID_ALU_Rd_addr,		-- out Dest reg addr for ALU op 		-> WB
		ALU_Rn1 				=> ID_ALU_Rn1,				-- out ALU operand 1						-> ALU
		ALU_Rn2 				=> ID_ALU_Rn2,				-- out ALU operand 2						-> ALU
		DataMove_Rd_Addr 	=> ID_DataMove_Rd_addr,	-- out Dest reg addr for ALU op 		-> WB
		DataMove_Rd 		=> ID_DataMove_Rd,		-- out str register data 				-> MEM
		addrmode 			=> ID_addrmode,			-- out ldr word source					-> MUX Load word
		immd_word 			=> ID_immd_word,			-- out ldr word 							-> MUX Load word
		memaddr_offset 	=> ID_memaddr_offset,	-- out ldr/str memory addr				-> EX
		ExecNextPC 			=> ID_ExecNextPC,			-- out next pc to execute				-> Fetch
		getnextpc 			=> ID_getnextpc			-- out flag immediate jump				-> Fetch
	);
	
	
	Pipeline_ID_EX : PipelineControl_ID_EX port map
	(
		clock 									=> clock, 
		
		in_REG_ID_EX_op_type 		 		=> ID_op_type,						
		in_REG_ID_EX_op_alu 					=> ID_op_alu,  			
		in_REG_ID_EX_op_datamove 			=> ID_op_datamove,		
		in_REG_ID_EX_ALU_Rd_addr 			=> ID_ALU_Rd_addr,		
		in_REG_ID_EX_ALU_Rn1 				=> ID_ALU_Rn1,			
		in_REG_ID_EX_ALU_Rn2 				=> ID_ALU_Rn2,			
		in_REG_ID_EX_DataMove_Rd_addr 	=> ID_DataMove_Rd_addr,
		in_REG_ID_EX_DataMove_Rd 			=> ID_DataMove_Rd,		
		in_REG_ID_EX_addrmode 				=> ID_addrmode,			
		in_REG_ID_EX_immd_word 				=> ID_immd_word,			
		in_REG_ID_EX_memaddr_offset 		=> ID_memaddr_offset,	
		in_REG_ID_EX_ExecNextPC 			=> ID_ExecNextPC,									
		in_REG_ID_EX_getnextpc 				=> ID_getnextpc,
		
		out_REG_ID_EX_op_type 				=> REG_ID_EX_op_type,					
		out_REG_ID_EX_op_alu 				=> REG_ID_EX_op_alu,  			
		out_REG_ID_EX_op_datamove 			=> REG_ID_EX_op_datamove,		
		out_REG_ID_EX_ALU_Rd_addr 			=> REG_ID_EX_ALU_Rd_addr,		
		out_REG_ID_EX_ALU_Rn1 				=> REG_ID_EX_ALU_Rn1,			
		out_REG_ID_EX_ALU_Rn2 				=> REG_ID_EX_ALU_Rn2,			
		out_REG_ID_EX_DataMove_Rd_addr 	=> REG_ID_EX_DataMove_Rd_addr,
		out_REG_ID_EX_DataMove_Rd 			=> REG_ID_EX_DataMove_Rd,		
		out_REG_ID_EX_addrmode 				=> REG_ID_EX_addrmode,			
		out_REG_ID_EX_immd_word 			=> REG_ID_EX_immd_word,			
		out_REG_ID_EX_memaddr_offset 		=> REG_ID_EX_memaddr_offset,	
		out_REG_ID_EX_ExecNextPC 			=> REG_ID_EX_ExecNextPC,									
		out_REG_ID_EX_getnextpc 			=> REG_ID_EX_getnextpc
	);
	
	
	ExecuteCommand : Execute port map
	(
		op_alu 				=> REG_ID_EX_op_alu,  			-- IN ALU operation								<- ID
		ALU_op1 				=> REG_ID_EX_ALU_Rn1,			-- in ALU operand 1								<- ID
		ALU_op2 				=> REG_ID_EX_ALU_Rn2,			-- in ALU operand 2								<- ID
		memaddr_offset 	=> REG_ID_EX_memaddr_offset,	-- in ldr/str memory addr 						<- ID
		Exec_out 			=> EX_Exec_out,					-- out Execute result 							-> WB
		effective_addr 	=> EX_effective_address			-- out effective address of ldr/str ops 	-> MEM 
	);

	
	Pipeline_EX_MEM : PipelineControl_EX_MEM port map
	(
		clock => clock, 
		
		in_REG_EX_MEM_Exec_out 				=> EX_Exec_out,				
		in_REG_EX_MEM_effective_addr 		=> EX_effective_address,

		in_REG_ID_EX_op_type 				=> REG_ID_EX_op_type,
		in_REG_ID_EX_op_datamove 			=> REG_ID_EX_op_datamove,
		in_REG_ID_EX_ALU_Rd_addr 			=> REG_ID_EX_ALU_Rd_addr,
		in_REG_ID_EX_DataMove_Rd_addr 	=> REG_ID_EX_DataMove_Rd_addr,
		in_REG_ID_EX_DataMove_Rd 			=> REG_ID_EX_DataMove_Rd,
		in_REG_ID_EX_addrmode 				=> REG_ID_EX_addrmode,
		in_REG_ID_EX_immd_word 				=> REG_ID_EX_immd_word,

		out_REG_EX_MEM_Exec_out 			=> REG_ID_EX_MEM_Exec_out,				
		out_REG_EX_MEM_effective_addr 	=> REG_ID_EX_MEM_effective_addr,

		out_REG_EX_MEM_op_type 				=> REG_ID_EX_MEM_op_type, 
		out_REG_EX_MEM_op_datamove 		=> REG_ID_EX_MEM_op_datamove,  
		out_REG_EX_MEM_ALU_Rd_addr 		=> REG_ID_EX_MEM_ALU_Rd_addr, 
		out_REG_EX_MEM_DataMove_Rd_addr	=> REG_ID_EX_MEM_DataMove_Rd_addr, 
		out_REG_EX_MEM_DataMove_Rd 		=> REG_ID_EX_MEM_DataMove_Rd, 
		out_REG_EX_MEM_addrmode 			=> REG_ID_EX_MEM_addrmode, 
		out_REG_EX_MEM_immd_word 			=> REG_ID_EX_MEM_immd_word
	);            
	
	
	MemAccess : MemoryAccess port map
	(
		opcode 			=> REG_ID_EX_MEM_op_datamove,			-- in datamove operation 					<- ID
		Rd 				=> REG_ID_EX_MEM_DataMove_Rd,			-- in str register data						<- ID
		effective_addr => REG_ID_EX_MEM_effective_addr,		-- in effective address of ldr/str ops <- EX
		mem_word 		=> MEM_load_mem_word						-- out word retrieved from mem to load -> WB
	);
	
	
	Pipeline_MEM_WB : PipelineControl_MEM_WB port map
	(
		clock => clock,
		
		in_MEM_load_mem_word 						=> MEM_load_mem_word, 						
		in_REG_ID_EX_MEM_Exec_out 					=> REG_ID_EX_MEM_Exec_out, 					
		in_REG_ID_EX_MEM_addrmode 					=> REG_ID_EX_MEM_addrmode, 					
		in_REG_ID_EX_MEM_immd_word  				=> REG_ID_EX_MEM_immd_word,				
		in_REG_ID_EX_MEM_op_type  					=> REG_ID_EX_MEM_op_type,					
		in_REG_ID_EX_MEM_ALU_Rd_addr 	 			=> REG_ID_EX_MEM_ALU_Rd_addr,			
		in_REG_ID_EX_MEM_DataMove_Rd_addr  		=> REG_ID_EX_MEM_DataMove_Rd_addr,		
		
		out_MEM_WB_load_mem_word 		 			=> MEM_WB_load_mem_word,			
		out_REG_ID_EX_MEM_WB_Exec_out 	 		=> REG_ID_EX_MEM_WB_Exec_out,		
		out_REG_ID_EX_MEM_WB_addrmode 	 		=> REG_ID_EX_MEM_WB_addrmode,		
		out_REG_ID_EX_MEM_WB_immd_word  			=> REG_ID_EX_MEM_WB_immd_word,			
		out_REG_ID_EX_MEM_WB_op_type 		 		=> REG_ID_EX_MEM_WB_op_type, 		
		out_REG_ID_EX_MEM_WB_ALU_Rd_addr  		=> REG_ID_EX_MEM_WB_ALU_Rd_addr,		
		out_REG_ID_EX_MEM_WB_DataMove_Rd_addr	=> REG_ID_EX_MEM_WB_DataMove_Rd_addr
		
	);
	
--	MuxLDR : Mux_LoadWord port map
--	(
--		sel_src => addrmode, 				-- in ldr data source 						<- ID
--		load_word_ID => immd_word,			-- in immediate data 						<- ID
--		load_word_MEM => load_mem_word,	-- in data loaded from memory 			<- MEM
--		load_word => load_word				-- Muxed data to load in a register 	-> WB
--	);


--	
--	Register_WriteBack : WriteBack port map
--	(
--		op_type => op_type,					-- in instr/operation type				<- ID				
--		ALU_Rd_addr => Rd_addr,				-- in Dest addr for ALU operation 	<- ID
--		Exec_out => Exec_out,				-- in Execute operation result 		<- EX
--		LDR_addr => DataMove_Rd_Addr,		-- in Dest register addr for LDR 	<- ID 
--		LDR_word => load_word				-- data to load to register 			<- Mux(ID/MEM)
--	);
	
end architecture Behavioral;

