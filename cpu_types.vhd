--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package cpu_types is

	
	-- Declare the constant max size of the program data
	type t_MemProgramData_32_32 is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- Declare the constant max size of the register region
	type t_MemRegister_15_32 is array (0 to 14) of STD_LOGIC_VECTOR(31 downto 0);
	
	type t_MemRegion_Main is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	type t_MemRegion_Regs is array (0 to 14) of STD_LOGIC_VECTOR(31 downto 0);
	type t_MemRegion_Program is array (0 to 63) of STD_LOGIC_VECTOR(31 downto 0);
	
	-- CPU Registers address
	constant R1_addr  : integer := 0; 	-- PC
	constant R2_addr  : integer := 1; 	-- IR
	constant R3_addr  : integer := 2; 	-- SP
	constant R4_addr  : integer := 3; 	-- PSR
	constant R5_addr  : integer := 4; 	-- GPR
	constant R6_addr  : integer := 5; 	-- GPR
	constant R7_addr  : integer := 6; 	-- GPR
	constant R8_addr  : integer := 7; 	-- GPR
	constant R9_addr  : integer := 8; 	-- GPR
	constant R10_addr : integer := 9; 	-- GPR
	constant R11_addr : integer := 10;  -- GPR
	constant R12_addr : integer := 11;  -- GPR
	constant R13_addr : integer := 12;  -- GPR
	constant R14_addr : integer := 13;  -- GPR
	constant R15_addr : integer := 14;  -- GPR
	
	
	-- command id
	subtype cmd_id_size is STD_LOGIC_VECTOR(7 downto 0);
	constant alu_add  : cmd_id_size := X"00";
	constant alu_sub  : cmd_id_size := X"01";
	constant alu_mul  : cmd_id_size := X"02";
	constant alu_div  : cmd_id_size := X"03";
	constant alu_and  : cmd_id_size := X"04";
	constant alu_nand : cmd_id_size := X"05";
	constant alu_or   : cmd_id_size := X"06";
	constant alu_nor  : cmd_id_size := X"07";
	constant alu_xor  : cmd_id_size := X"08";
	constant alu_xnor : cmd_id_size := X"09";
	constant alu_not  : cmd_id_size := X"0A";
	constant alu_cmp  : cmd_id_size := X"0B";
	constant alu_shl  : cmd_id_size := X"0C";
	constant alu_shr  : cmd_id_size := X"0D";
	
	constant mem_mov  : cmd_id_size := X"0D";
	constant mem_ldr  : cmd_id_size := X"0E";
	constant mem_str  : cmd_id_size := X"0F";
	constant mem_push : cmd_id_size := X"10";
	constant mem_pop  : cmd_id_size := X"11";
	
	constant br_jmp   : cmd_id_size := X"12";
	
	constant sys_int  : cmd_id_size := X"13";
	
	constant cmd_none : cmd_id_size := X"14";
	
	
	-- Instruction operation type
	constant optype_alu  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant optype_datamove  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant optype_branch  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	constant optype_compare  : STD_LOGIC_VECTOR(3 downto 0) := "0011";
	constant optype_system  : STD_LOGIC_VECTOR(3 downto 0) := "0100";
	
	
	-- Decode contants
	constant shft_mode_immd  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant shft_mode_memaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant shft_mode_regaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	
	constant addrmode_mode_immd  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	constant addrmode_mode_memaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0001";
	constant addrmode_mode_regaddr  : STD_LOGIC_VECTOR(3 downto 0) := "0010";
	
	-- Memory access
	constant mem_read : STD_LOGIC := '0';
	constant mem_write : STD_LOGIC := '1'; 
	
	constant reg_read : STD_LOGIC := '0';
	constant reg_write : STD_LOGIC := '1'; 

end cpu_types;

package body cpu_types is

 
end cpu_types;
