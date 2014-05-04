--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:43:53 01/18/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_Decode.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
use work.cpu_types.all;
 
ENTITY Testbench_Decode IS
END Testbench_Decode;
 
ARCHITECTURE behavior OF Testbench_Decode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decode
    PORT(
			instruction : in STD_LOGIC_VECTOR(31 downto 0); 
			getnextpc : out STD_LOGIC;
			endprogram : out STD_LOGIC;
			ExecNextPC : out STD_LOGIC_VECTOR(31 downto 0);
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
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
	

 	--Outputs
	signal op_type : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');  
	signal op_alu : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  
	signal op_datamove : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); 
	signal ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal ALU_Rn1 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal ALU_Rn2 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal DataMove_Rd_addr : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal DataMove_Rd : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal addrmode : STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
	signal immd_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal memaddr_offset : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal ExecNextPC : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal getnextpc : STD_LOGIC := '0';
	signal endprogram : STD_LOGIC := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	uut: Decode PORT MAP
	(
		instruction 		=> instruction, 		
		op_type 				=> op_type, 				
		op_alu 				=> op_alu, 				
		op_datamove 		=> op_datamove, 		
		ALU_Rd_addr 		=> ALU_Rd_addr, 		
		ALU_Rn1 				=> ALU_Rn1, 				
		ALU_Rn2 				=> ALU_Rn2, 				
		DataMove_Rd_addr  => DataMove_Rd_addr, 
		DataMove_Rd 		=> DataMove_Rd, 		
		addrmode 			=> addrmode, 			
		immd_word 			=> immd_word, 			
		memaddr_offset 	=> memaddr_offset, 	
		ExecNextPC 			=> ExecNextPC, 			
		getnextpc 			=> getnextpc, 				
		endprogram 			=> endprogram 			
	);

   -- Stimulus process
   stim_proc: process
   begin		
	
	   -- [0] ldr R5, #1	
		-- [1] ldr R6, #10
		-- [2] add R7, R5, R6
		-- [3] str R7, [0x0000000B]
		--	[4] ldr R8, [0x0000000B]
		
		-- [0] ldr R5, %10	
		-- [1] str R5, 0x0000000B
		-- [2] ldr R5, 0x0000000B
		-- [3] ldr R6, %2	
		-- [4] add R5, R5, R6
		-- [5] str R5, 0x0000000F
		
		
		-- [0] ldr R5, %10		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000000001010"; 
		wait for 10 ns;
		

		-- [1] str R5, 0x0000000B
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		instruction <= "00010000000001010000000100001011"; 
		wait for 10 ns;
		
		
		-- [2] ldr R5, 0x0000000B
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		instruction <= "00001111000001010000000100001011"; 
		wait for 10 ns;
		
		
		-- [3] ldr R6, %2		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		instruction <= "00001111000001100000000000000010"; 
		wait for 10 ns;
		
		-- [4] add R5, R5, R6
		-- add
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		instruction <= "00000000000001010101001000000110"; 
		wait for 10 ns;
		
		
		-- [5] str R5, 0x0000000F
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		instruction <= "00010000000001010000000100001111"; 
		wait for 10 ns;
		
      wait;
   end process;

END;
