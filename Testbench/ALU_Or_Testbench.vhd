--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:47:44 01/12/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/ALU_Or_Testbench.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_Or_Testbench IS
END ALU_Or_Testbench;
 
ARCHITECTURE behavior OF ALU_Or_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         alu_sel : IN  std_logic_vector(7 downto 0);
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         dest : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal alu_sel : std_logic_vector(7 downto 0) := cmd_none;
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal dest : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          alu_sel => alu_sel,
          op1 => op1,
          op2 => op2,
          dest => dest
        );

   stim_proc: process
   begin		
		wait for 20 ns;
		op1 <= "00000000000000000000000000000011";
		wait for 30 ns;
		op2 <= "00000000000000000000000000000001";
		wait for 40 ns;
		alu_sel <= alu_or;
   end process;

END;
