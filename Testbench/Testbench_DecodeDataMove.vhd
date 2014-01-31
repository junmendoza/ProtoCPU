--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:11 01/31/2014
-- Design Name:   
-- Module Name:   C:/jun/sourcecode/Research/ProtoCPU/Testbench/Testbench_DecodeDataMove.vhd
-- Project Name:  ProtoCPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DecodeDataMove
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
 
ENTITY Testbench_DecodeDataMove IS
END Testbench_DecodeDataMove;
 
ARCHITECTURE behavior OF Testbench_DecodeDataMove IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DecodeDataMove
    PORT(
         mem_regs : IN t_MemRegister_15_32;
         Rd_addr : IN std_logic_vector(3 downto 0);
         Rd : OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataMove_Rd_addr : std_logic_vector(3 downto 0) := (others => '0');
	
	signal memregion_register : t_MemRegister_15_32 := 
	(
		X"00000001", 
		X"00000002", 
		X"00000003",
		X"00000004", 
		X"00000005", 
		X"00000006", 
		X"00000007",
		X"00000008", 
		X"00000009", 
		X"0000000A", 
		X"0000000B",
		X"0000000C", 
		X"0000000D", 
		X"0000000E",
		X"0000000F"
	);

 	--Outputs
   signal Rd : std_logic_vector(31 downto 0);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DecodeDataMove PORT MAP (
          mem_regs => memregion_register,
          Rd_addr => DataMove_Rd_addr,
          Rd => Rd
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		DataMove_Rd_addr <= "0000";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0001";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0010";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0011";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0100";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0101";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0110";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "0111";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1000";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1001";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1010";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1011";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1100";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1101";
		wait for 10 ns;
		
		DataMove_Rd_addr <= "1110";
		wait for 10 ns;
		
      wait;
   end process;

END;
