--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:19:46 01/26/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeALU.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeALU
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

use work.cpu_types.all;
 
ENTITY Testbench_DecodeALU IS
END Testbench_DecodeALU;
 
ARCHITECTURE behavior OF Testbench_DecodeALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 COMPONENT DecodeALU
		PORT(
				Rd_addr : in STD_LOGIC_VECTOR(3 downto 0); 
				Rn1_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rn2_addr : in STD_LOGIC_VECTOR(3 downto 0);
				Rd : out STD_LOGIC_VECTOR(31 downto 0);
				Rn1 : out STD_LOGIC_VECTOR(31 downto 0);
				Rn2 : out STD_LOGIC_VECTOR(31 downto 0)
			 );
	 END COMPONENT;
   
 	--Outputs
	signal ALU_Rd_addr : STD_LOGIC_VECTOR(3 downto 0); 
	signal ALU_Rn1_addr : STD_LOGIC_VECTOR(3 downto 0);
	signal ALU_Rn2_addr : STD_LOGIC_VECTOR(3 downto 0);
   signal Rd : std_logic_vector(31 downto 0);
   signal Rn1 : std_logic_vector(31 downto 0);
   signal Rn2 : std_logic_vector(31 downto 0);
	

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeALU PORT MAP (
          Rd_addr => ALU_Rd_addr,
          Rn1_addr => ALU_Rn1_addr,
          Rn2_addr => ALU_Rn2_addr,
          Rd => Rd,
          Rn1 => Rn1,
          Rn2 => Rn2
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		
		-- add R5, R5, R6
		-- add
		-- 31-24		23-20		19-16		15-12		11-0 		
		-- opcode	cond		Rd			Rn			Shifter
		--instruction <= "00000000000001010101001000000110"; 
		ALU_Rd_addr <= "0000";
		ALU_Rn1_addr <= "0001";
		ALU_Rn2_addr <= "0001";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0010";
		ALU_Rn1_addr <= "0011";
		ALU_Rn2_addr <= "0011";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0100";
		ALU_Rn1_addr <= "0101";
		ALU_Rn2_addr <= "0101";
		wait for 10 ns;
		
		ALU_Rd_addr <= "0110";
		ALU_Rn1_addr <= "0111";
		ALU_Rn2_addr <= "0111";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1000";
		ALU_Rn1_addr <= "1001";
		ALU_Rn2_addr <= "1001";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1010";
		ALU_Rn1_addr <= "1011";
		ALU_Rn2_addr <= "1011";
		wait for 10 ns;
		
		ALU_Rd_addr <= "1100";
		ALU_Rn1_addr <= "1101";
		ALU_Rn2_addr <= "1101";
		wait for 10 ns;
		
      wait;
   end process;

END;
