--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:52:48 02/04/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_MemRegion_Registers.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemRegion_Registers
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
 
ENTITY Testbench_MemRegion_Registers IS
END Testbench_MemRegion_Registers;
 
ARCHITECTURE behavior OF Testbench_MemRegion_Registers IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemRegion_Registers
    PORT(
         reg_addr : IN  std_logic_vector(7 downto 0);
         reg_word : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal reg_word : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemRegion_Registers PORT MAP (
          reg_addr => reg_addr,
          reg_word => reg_word
        );
 
   -- Stimulus process
   stim_proc: process
   begin		

		reg_addr <= X"00";
		wait for 10 ns;
		
		reg_addr <= X"01";
		wait for 10 ns;
		
		reg_addr <= X"02";
		wait for 10 ns;
		
		reg_addr <= X"03";
		wait for 10 ns;
		
		reg_addr <= X"04";
		wait for 10 ns;
		
		reg_addr <= X"05";
		wait for 10 ns;
		
		reg_addr <= X"06";
		wait for 10 ns;
		
		reg_addr <= X"07";
		wait for 10 ns;
		
		reg_addr <= X"08";
		wait for 10 ns;
		
		reg_addr <= X"09";
		wait for 10 ns;
		
		reg_addr <= X"0A";
		wait for 10 ns;
		
		reg_addr <= X"0B";
		wait for 10 ns;
		
		reg_addr <= X"0C";
		wait for 10 ns;
		
		reg_addr <= X"0D";
		wait for 10 ns;
		
		reg_addr <= X"0E";
		wait for 10 ns;

      wait;
   end process;

END;
