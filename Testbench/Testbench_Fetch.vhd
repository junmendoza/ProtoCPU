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
				clock : in STD_LOGIC; 
				sel_getnextpc : in STD_LOGIC;					-- 0-> pc is the next pc, 1-> Get next pc (pc = pc + 1)
				pc : in STD_LOGIC_VECTOR(31 downto 0);
				instr : out STD_LOGIC_VECTOR(31 downto 0)
		    );
	END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
	signal sel_getnextpc : STD_LOGIC := '0';
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instr : std_logic_vector(31 downto 0);

	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Fetch PORT MAP (
          clock 				=> clock,
			 sel_getnextpc 	=> sel_getnextpc,
          pc 					=> pc,
          instr 				=> instr
        );


	-- Stimulus process
	stim_proc: process
	begin	
		
		---------------------------------------
		-- Test getnextpc - 0
		---------------------------------------
		
		-- fetch cycle start
		pc <= X"00000000"; 
		sel_getnextpc <= '0';
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '0';
		pc <= X"00000001"; 
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '0';
		pc <= X"00000002"; 
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		
		-- fetch cycle start
		sel_getnextpc <= '0';
		pc <= X"00000003"; 
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		---------------------------------------
		-- Test getnextpc - 1
		---------------------------------------
		
		-- fetch cycle start
		pc <= X"00000000"; 
		sel_getnextpc <= '1';
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000001"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000002"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		pc <= X"00000003"; 
		sel_getnextpc <= '1';
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		pc <= X"00000004"; 
		sel_getnextpc <= '1';
		clock <= '1';
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000005"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000006"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000007"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000008"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"00000009"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000A"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000B"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000C"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000D"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000E"; 
		wait for 10 ns;
		
		-- cycle clock 0
		clock <= '0';
		wait for 10 ns;
		
		-- fetch cycle start
		sel_getnextpc <= '1';
		clock <= '1';
		pc <= X"0000000F"; 


		wait;
	
	end process;

END;
