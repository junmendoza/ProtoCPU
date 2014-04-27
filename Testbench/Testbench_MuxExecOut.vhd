--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:45 04/27/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_MuxExecOut.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_ExecOut
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
 
ENTITY Testbench_MuxExecOut IS
END Testbench_MuxExecOut;
 
ARCHITECTURE behavior OF Testbench_MuxExecOut IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_ExecOut
    PORT(
         alu_sel : IN  std_logic_vector(7 downto 0);
         ALU_out : IN  std_logic_vector(31 downto 0);
         PSR : IN  std_logic_vector(31 downto 0);
         Exec_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_sel : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal PSR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Exec_Out : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_ExecOut PORT MAP (
          alu_sel => alu_sel,
          ALU_out => ALU_out,
          PSR => PSR,
          Exec_Out => Exec_Out
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		alu_sel <= alu_add;
		ALU_out <= X"00000001";
		PSR <= X"00000002";
		wait for 10 ns;
		
		alu_sel <= alu_cmp;
		ALU_out <= X"00000003";
		PSR <= X"00000004";
		wait for 10 ns;
		
		alu_sel <= alu_sub;
		ALU_out <= X"00000005";
		PSR <= X"00000006";
		wait for 10 ns;
		
		alu_sel <= alu_mul;
		ALU_out <= X"00000007";
		PSR <= X"00000008";
		wait for 10 ns;
		
      wait;
   end process;

END;
