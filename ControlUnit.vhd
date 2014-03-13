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
				op_datamove : in STD_LOGIC_VECTOR(7 downto 0); 
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
	
	-- Command signals
	signal op_type  	 : STD_LOGIC_VECTOR(3 downto 0); 
	signal exec_alu  	 : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_mem  	 : STD_LOGIC_VECTOR(7 downto 0);
	
	
	signal Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0);
	signal ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0);
	signal Exec_Out : STD_LOGIC_VECTOR(31 downto 0);
	
	signal DataMove_Rd_Addr : STD_LOGIC_VECTOR(3 downto 0);
	signal DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal addrmode : STD_LOGIC_VECTOR(3 downto 0);
	signal immd_word : STD_LOGIC_VECTOR(31 downto 0);
	signal memaddr_offset : STD_LOGIC_VECTOR(31 downto 0);
	signal effective_address : STD_LOGIC_VECTOR(31 downto 0);
	
	signal load_word : STD_LOGIC_VECTOR(31 downto 0);
	signal load_mem_word : STD_LOGIC_VECTOR(31 downto 0);
	
	signal getnextpc : STD_LOGIC;
	 
begin
	
	FetchInstruction : Fetch port map
	(
		clock => clock, 
		getnextpc => getnextpc,
		pc => R1, 			-- in current pc
		instr => R2			-- out next instruction -> ID
	);

	DecodeInstruction : Decode port map 
	(
		instruction => R2,						-- in instruction to decode 				<- IF
		op_type => op_type,						-- out instr/operation type				-> WB	
		op_alu => exec_alu,  	
		op_datamove => exec_mem,				-- out datamove operation					-> MEM
		ALU_Rd_addr => Rd_addr,					-- out Dest reg addr for ALU op 			-> WB
		ALU_Rn1 => ALU_Rn1,						-- out ALU operand 1							-> ALU
		ALU_Rn2 => ALU_Rn2,						-- out ALU operand 2							-> ALU
		DataMove_Rd_Addr => DataMove_Rd_Addr,	-- out Dest reg addr for ALU op 		-> WB
		DataMove_Rd => DataMove_Rd,			-- out str register data 					-> MEM
		addrmode => addrmode,					-- out ldr word source						-> MUX Load word
		immd_word => immd_word,					-- out ldr word 								-> MUX Load word
		memaddr_offset => memaddr_offset,	-- out ldr/str memory addr					-> EX
		ExecNextPC => R1				
	);
	
	
	ExecuteCommand : Execute port map
	(
		op_alu => exec_alu,  	
		op_datamove => exec_mem,
		ALU_op1 => ALU_Rn1,							-- in ALU operand 1								<- ID
		ALU_op2 => ALU_Rn2,							-- in ALU operand 2								<- ID
		memaddr_offset => memaddr_offset,		-- in ldr/str memory addr 						<- ID
		Exec_out => Exec_Out,						-- out Execute result 							-> WB
		effective_addr => effective_address		-- out effective address of ldr/str ops 	-> MEM 
	);
	
	MemAccess : MemoryAccess port map
	(
		opcode => exec_mem,							-- in datamove operation 					<- ID
		Rd => DataMove_Rd,							-- in str register data						<- ID
		effective_addr => effective_address,	-- in effective address of ldr/str ops <- EX
		mem_word => load_mem_word					-- out word retrieved from mem to load -> WB
	);
	
	MuxLDR : Mux_LoadWord port map
	(
		sel_src => addrmode, 				-- in ldr data source 						<- ID
		load_word_ID => immd_word,			-- in immediate data 						<- ID
		load_word_MEM => load_mem_word,	-- in data loaded from memory 			<- MEM
		load_word => load_word				-- Muxed data to load in a register 	-> WB
	);
	
	Register_WriteBack : WriteBack port map
	(
		op_type => op_type,					-- in instr/operation type				<- ID				
		ALU_Rd_addr => Rd_addr,				-- in Dest addr for ALU operation 	<- ID
		Exec_out => Exec_out,				-- in Execute operation result 		<- EX
		LDR_addr => DataMove_Rd_Addr,		-- in Dest register addr for LDR 	<- ID 
		LDR_word => load_word				-- data to load to register 			<- Mux(ID/MEM)
	);
	
end architecture Behavioral;

