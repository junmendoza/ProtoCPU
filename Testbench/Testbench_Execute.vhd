--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:56:53 04/27/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_Execute.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Execute
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
 
ENTITY Testbench_Execute IS
END Testbench_Execute;
 
ARCHITECTURE behavior OF Testbench_Execute IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Execute
    PORT(
         op_alu : IN  std_logic_vector(7 downto 0);
         ALU_op1 : IN  std_logic_vector(31 downto 0);
         ALU_op2 : IN  std_logic_vector(31 downto 0);
         memaddr_offset : IN  std_logic_vector(31 downto 0);
         Exec_out : OUT  std_logic_vector(31 downto 0);
         effective_addr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op_alu : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal memaddr_offset : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Exec_out : std_logic_vector(31 downto 0);
   signal effective_addr : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Execute PORT MAP (
          op_alu => op_alu,
          ALU_op1 => ALU_op1,
          ALU_op2 => ALU_op2,
          memaddr_offset => memaddr_offset,
          Exec_out => Exec_out,
          effective_addr => effective_addr
        );


   -- Stimulus process
   stim_proc: process
   begin		

		ALU_op1 <= X"0000000A";
      ALU_op2 <= X"00000002";
		op_alu <= alu_add;
		wait for 10 ns;
		
		ALU_op1 <= X"0000000A";
      ALU_op2 <= X"00000002";
		op_alu <= alu_sub;
		wait for 10 ns;
		
		ALU_op1 <= X"0000000A";
      ALU_op2 <= X"00000002";
		op_alu <= alu_mul;
		wait for 10 ns;
		
      wait;
   end process;

END;

