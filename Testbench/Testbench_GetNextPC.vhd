--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:42:49 03/26/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_GetNextPC.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GetNextPC
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
 
ENTITY Testbench_GetNextPC IS
END Testbench_GetNextPC;
 
ARCHITECTURE behavior OF Testbench_GetNextPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GetNextPC
    PORT(
         clock : IN  std_logic;
         sel_getnextpc : IN  std_logic;
         pc : IN  std_logic_vector(31 downto 0);
         nextpc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal sel_getnextpc : std_logic := '0';
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal nextpc : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GetNextPC PORT MAP (
          clock => clock,
          sel_getnextpc => sel_getnextpc,
          pc => pc,
          nextpc => nextpc
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		--------------------------------
		-- Test sel_getnextpc = 0
		--------------------------------
		
		pc <= X"00000000";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000001";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000002";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000003";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		
		--------------------------------
		-- Test sel_getnextpc = 0
		--------------------------------
		
		pc <= X"00000000";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000001";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000002";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"00000003";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		--------------------------------
		-- Test sel_getnextpc = 0
		--------------------------------
		
		pc <= X"0000000A";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"0000000B";
		clock <= '1';
		sel_getnextpc <= '0';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		--------------------------------
		-- Test sel_getnextpc = 1
		--------------------------------
		
		pc <= X"0000000C";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
		clock <= '0';
		wait for 10 ns;
		
		pc <= X"0000000D";
		clock <= '1';
		sel_getnextpc <= '1';
		wait for 10 ns;
		
      wait;
   end process;

END;
