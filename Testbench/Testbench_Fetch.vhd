--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:55:20 01/12/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_Fetch.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Fetch
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
 
ENTITY Testbench_Fetch IS
END Testbench_Fetch;
 
ARCHITECTURE behavior OF Testbench_Fetch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Fetch
    PORT(
          clock : IN  std_logic;
          pc : IN  std_logic_vector(31 downto 0);
          programdata : IN  t_MemProgramData_32_32;
          instr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal pc : std_logic_vector(31 downto 0) := X"00000000";

 	--Outputs
   signal instr : std_logic_vector(31 downto 0);

	-- Simulate the program memory
	signal memregion_program : t_MemProgramData_32_32 := 
	(
		X"10000000", 
		X"10000001",
		X"10000002",
		X"10000003",
		X"10000004",
		X"10000005",
		X"10000006",
		X"10000007",
		X"10000008",
		X"10000009",
		X"1000000A",
		X"1000000B",
		X"1000000C",
		X"1000000D",
		X"1000000E",
		X"1000000F",
		X"10000000", 
		X"10000001",
		X"10000002",
		X"10000003",
		X"10000004",
		X"10000005",
		X"10000006",
		X"10000007",
		X"10000008",
		X"10000009",
		X"1000000A",
		X"1000000B",
		X"1000000C",
		X"1000000D",
		X"1000000E",
		X"1000000F"
	);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Fetch PORT MAP (
          clock => clock,
          pc => pc,
          programdata => memregion_program,
          instr => instr
        );


	-- Stimulus process
	stim_proc: process
	begin	
		
		-- fetch cycle start
		pc <= X"00000000"; 
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000001"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000002"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000003"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000004"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000005"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000006"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000007"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000008"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"00000009"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000A"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000B"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000C"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000D"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000E"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		clock <= '1';
		pc <= X"0000000F"; 
		wait;
		

	end process;

END;
