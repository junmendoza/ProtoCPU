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
	constant R1_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"0";	-- PC
	constant R2_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"1";	-- IR
	constant R3_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"2";	-- SP
	constant R4_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"3";	-- PSR
	constant R5_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"4";	-- GPR
	constant R6_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"5";	-- GPR
	constant R7_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"6";	-- GPR
	constant R8_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"7";	-- GPR
	constant R9_addr  : STD_LOGIC_VECTOR(3 downto 0) := X"8";	-- GPR
	constant R10_addr : STD_LOGIC_VECTOR(3 downto 0) := X"9";	-- GPR
	constant R11_addr : STD_LOGIC_VECTOR(3 downto 0) := X"A";  -- GPR
	constant R12_addr : STD_LOGIC_VECTOR(3 downto 0) := X"B";  -- GPR
	constant R13_addr : STD_LOGIC_VECTOR(3 downto 0) := X"C";  -- GPR
	constant R14_addr : STD_LOGIC_VECTOR(3 downto 0) := X"D";  -- GPR
	constant R15_addr : STD_LOGIC_VECTOR(3 downto 0) := X"E";  -- GPR
	
	
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
	
	constant mem_mov  : cmd_id_size := X"0E";
	constant mem_ldr  : cmd_id_size := X"0F";
	constant mem_str  : cmd_id_size := X"10";
	constant mem_push : cmd_id_size := X"11";
	constant mem_pop  : cmd_id_size := X"12";
	
	constant br_jmp   : cmd_id_size := X"13";
	
	constant sys_int  : cmd_id_size := X"14";
	
	constant cmd_none : cmd_id_size := X"15";
	
	
	-- comparison
	constant cond_true  : STD_LOGIC_VECTOR(3 downto 0) := X"0";
	constant cond_eq  : STD_LOGIC_VECTOR(3 downto 0) := X"1";
	constant cond_nq  : STD_LOGIC_VECTOR(3 downto 0) := X"2";
	constant cond_gt  : STD_LOGIC_VECTOR(3 downto 0) := X"3";
	constant cond_ge  : STD_LOGIC_VECTOR(3 downto 0) := X"4";
	constant cond_lt  : STD_LOGIC_VECTOR(3 downto 0) := X"5";
	constant cond_le  : STD_LOGIC_VECTOR(3 downto 0) := X"6";
	
	-- PSR flags
	--	31 30 29 28			27-24					23-0
	--	Flags					Flags					Reserved
	--	Z	N	C	V 			Unused				Unused	
	
	constant Z_Flag_BitPos : integer := 31;
	constant N_Flag_BitPos : integer := 30;
	constant C_Flag_BitPos : integer := 29;
	constant V_Flag_BitPos : integer := 28;
	
	
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
	
	constant reg_read1 : STD_LOGIC_VECTOR(1 downto 0) := "00";
	constant reg_read2 : STD_LOGIC_VECTOR(1 downto 0) := "01";
	constant reg_write : STD_LOGIC_VECTOR(1 downto 0) := "10"; 

end cpu_types;

package body cpu_types is

 
end cpu_types;
