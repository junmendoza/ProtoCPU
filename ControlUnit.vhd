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
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component Fetch;
	
	component Decode is  
		Port( 
				instruction : in STD_LOGIC_VECTOR(31 downto 0); 
				op_alu : out STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : out STD_LOGIC_VECTOR(7 downto 0); 
				op_datamove : out STD_LOGIC_VECTOR(7 downto 0); 
				op_system : out STD_LOGIC_VECTOR(7 downto 0);
				Rd_addr : out STD_LOGIC_VECTOR(3 downto 0);
				ALU_Rd : out STD_LOGIC_VECTOR(31 downto 0);
				ALU_Rn : out STD_LOGIC_VECTOR(31 downto 0);
				DataMove_Rd : out STD_LOGIC_VECTOR(31 downto 0);
				shifter_immd : out STD_LOGIC_VECTOR(7 downto 0);
				shifter_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
				shifter_reg_addr : out STD_LOGIC_VECTOR(7 downto 0);
				addrmode_immd : out STD_LOGIC_VECTOR(7 downto 0);
				addrmode_immd_addr : out STD_LOGIC_VECTOR(7 downto 0);
				addrmode_reg_addr : out STD_LOGIC_VECTOR(7 downto 0)
			 );
	end component Decode;
	
	component Execute is  
		Port( 
				op_alu : in STD_LOGIC_VECTOR(7 downto 0);  
				op_branch : in STD_LOGIC_VECTOR(7 downto 0); 
				op_datamove : in STD_LOGIC_VECTOR(7 downto 0); 
				op_system : in STD_LOGIC_VECTOR(7 downto 0);
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
				operand1 : in STD_LOGIC_VECTOR(31 downto 0); 
				operand2 : in STD_LOGIC_VECTOR(31 downto 0); 
				operand3 : in STD_LOGIC_VECTOR(31 downto 0); 
				nextpc : out STD_LOGIC;
				endprogram : out STD_LOGIC
			);
	end component Execute;
	
	component GetNextPC is 
		Port( 
				clock : in STD_LOGIC;
				nextpc : in STD_LOGIC;	
			   pc : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	end component GetNextPC;
	
	
	------------------------------------
	-- ControlUnit signals
	------------------------------------
	
	signal endexecution : STD_LOGIC;
	signal exec_getpc : STD_LOGIC;
	
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
	signal exec_alu  	 : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_mem  	 : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_branch : STD_LOGIC_VECTOR(7 downto 0);
	signal exec_system : STD_LOGIC_VECTOR(7 downto 0);
	
	
	signal Rd_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ALU_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal ALU_Rn : STD_LOGIC_VECTOR(31 downto 0);
	signal Op3 : STD_LOGIC_VECTOR(31 downto 0);
	signal DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0);
	signal Shift : STD_LOGIC_VECTOR(11 downto 0);
	signal AddrMode : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Shifter signals
	signal shifter_immd : STD_LOGIC_VECTOR(7 downto 0);
	signal shifter_immd_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal shifter_reg_addr : STD_LOGIC_VECTOR(7 downto 0);
	
	-- AddressMode signals
	signal addrmode_immd : STD_LOGIC_VECTOR(7 downto 0);
	signal addrmode_immd_addr : STD_LOGIC_VECTOR(7 downto 0);
	signal addrmode_reg_addr : STD_LOGIC_VECTOR(7 downto 0);
	
	------------------------------------
	-- Initialize program region (Instruction Stream)
	-- 32 * 16-bit
	------------------------------------
--	signal memregion_program : t_MemProgramData_32_32 := 
--	(
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000"	
--	);
--	
--	signal memregion_register : t_MemRegister_15_32 := 
--	(
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000", X"00000000",
--		X"00000000", X"00000000", X"00000000"
--	);
	 
begin
	
	FetchInstruction : Fetch port map
	(
		clock, 
		R1, 
		R2
	);

	DecodeInstruction : Decode port map 
	(
		R2,
		exec_alu,  	
		exec_mem,
		exec_branch,
		exec_system,
		Rd_addr => Rd_addr,
		ALU_Rd => ALU_Rd,
		ALU_Rn => ALU_Rn,
		DataMove_Rd => DataMove_Rd,
		shifter_immd => shifter_immd,
		shifter_immd_addr => shifter_immd_addr,
		shifter_reg_addr => shifter_reg_addr,
		addrmode_immd => addrmode_immd,
		addrmode_immd_addr => addrmode_immd_addr,
		addrmode_reg_addr => addrmode_reg_addr
	);
	
	ExecuteCommand: Execute port map
	(
		exec_alu,  	
		exec_mem,
		exec_branch,
		exec_system,	
		
		Rd_addr,
		ALU_Rd,
		ALU_Rn,
		Op3,
		
		exec_getpc,
		endexecution
--		mem_regs(R1_addr) => R1, 
--		mem_regs(R2_addr) => R2, 
--		mem_regs(R3_addr) => R3, 
--		mem_regs(R4_addr) => R4, 
--		mem_regs(R5_addr) => R5, 
--		mem_regs(R6_addr) => R6, 
--		mem_regs(R7_addr) => R7, 
--		mem_regs(R8_addr) => R8, 
--		mem_regs(R9_addr) => R9, 
--		mem_regs(R10_addr) => R10, 
--		mem_regs(R11_addr) => R11, 
--		mem_regs(R12_addr) => R12, 
--		mem_regs(R13_addr) => R13, 
--		mem_regs(R14_addr) => R14, 
--		mem_regs(R15_addr) => R15
	);
	
	GetPC : GetNextPC port map(clock, exec_getpc, R1);	
	
end architecture Behavioral;

