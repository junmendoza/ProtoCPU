--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:36:08 01/24/2014
-- Design Name:   
-- Module Name:   D:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeOpcode.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeOpcode
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
 
ENTITY Testbench_DecodeOpcode IS
END Testbench_DecodeOpcode;
 
ARCHITECTURE behavior OF Testbench_DecodeOpcode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeOpcode
    PORT(
			instruction 		: in STD_LOGIC_VECTOR(31 downto 0);
			op_type 				: out STD_LOGIC_VECTOR(3 downto 0);
			ALU_Rd_addr 		: out STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Rn1_addr 		: out STD_LOGIC_VECTOR(3 downto 0); 
			ALU_Rn2_addr 		: out STD_LOGIC_VECTOR(3 downto 0);
			JumpCondition 		: out STD_LOGIC_VECTOR(3 downto 0); 
			NextPC 				: out STD_LOGIC_VECTOR(31 downto 0);
			getnextpc 			: out STD_LOGIC;
			DataMove_Rd_addr 	: out STD_LOGIC_VECTOR(3 downto 0); 
			DataMove_AddrMode : out STD_LOGIC_VECTOR(11 downto 0); 
			System_Data 		: out STD_LOGIC_VECTOR(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
	signal op_type 				: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal ALU_Rd_addr 			: STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
	signal ALU_Rn1_addr 			: STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
	signal ALU_Rn2_addr 			: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal JumpCondition 		: STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
	signal NextPC 					: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal getnextpc 				: STD_LOGIC := '0';
	signal DataMove_Rd_addr 	: STD_LOGIC_VECTOR(3 downto 0) := (others => '0'); 
	signal DataMove_AddrMode 	: STD_LOGIC_VECTOR(11 downto 0) := (others => '0'); 
	signal System_Data 			: STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeOpcode PORT MAP (
				instruction 		=>	instruction, 			
				op_type 				=>	op_type, 				
				ALU_Rd_addr 		=>	ALU_Rd_addr, 		
				ALU_Rn1_addr 		=>	ALU_Rn1_addr, 		
				ALU_Rn2_addr 		=>	ALU_Rn2_addr, 		
				JumpCondition 		=>	JumpCondition, 		
				NextPC 				=>	NextPC, 				
				getnextpc 			=>	getnextpc, 			
				DataMove_Rd_addr 	=>	DataMove_Rd_addr, 	
				DataMove_AddrMode =>	DataMove_AddrMode, 
				System_Data 		=>	System_Data
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
     
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
		instruction <= "00001111000001010000000000001010"; 
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
