--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:54 01/29/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeAddrMode.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeAddrMode
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
 
ENTITY Testbench_DecodeAddrMode IS
END Testbench_DecodeAddrMode;
 
ARCHITECTURE behavior OF Testbench_DecodeAddrMode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeAddrMode
    PORT(
			AddrMode : in STD_LOGIC_VECTOR(11 downto 0); 
			addrmode_mode : out STD_LOGIC_VECTOR(3 downto 0);
			immd_word : out STD_LOGIC_VECTOR(31 downto 0);
			memaddr_offset : out STD_LOGIC_VECTOR(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal AddrMode : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal addrmode_mode : std_logic_vector(3 downto 0);
   signal addrmode_immd_word : std_logic_vector(31 downto 0);
   signal addrmode_memaddr_offset : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeAddrMode PORT MAP (
          AddrMode => AddrMode,
          addrmode_mode => addrmode_mode,
          immd_word => addrmode_immd_word,
          memaddr_offset => addrmode_memaddr_offset
        );

   -- Stimulus process
   stim_proc: process 
   begin		
	
	
		-------------------------
		-- | 11-8	|	7-0		|
		-- | mode	|	address	|
		-------------------------

		-- [0] ldr R5, %10	
		-- [1] str R5, 0x0000000B
		-- [2] ldr R5, 0x0000000B
		-- [3] ldr R6, %2	
		-- [5] str R5, 0x0000000F
		
		
		-- [0] ldr R5, %10		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001010000000000001010"; 
		AddrMode <= "000000001010";
		wait for 10 ns;
		

		-- [1] str R5, 0x0000000B
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001011"; 
		AddrMode <= "000100001011";
		wait for 10 ns;
		
		
		-- [2] ldr R5, 0x0000000B
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001010000000100001011"; 
		AddrMode <= "000100001011";
		wait for 10 ns;
		
		
		-- [3] ldr R6, %2		
		-- ldr
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001110000001100000000000000010"; 
		AddrMode <= "000000000010";
		wait for 10 ns;
		
		
		-- [5] str R5, 0x0000000F
		-- str
		-- 31-24		23-20		19-16		15-12			11-0
		-- opcode	cond		Rd			Reserved 	address mode
		--instruction <= "00001111000001010000000100001111"; 
		AddrMode <= "000100001111";
		wait for 10 ns;

      wait;
   end process;

END;
