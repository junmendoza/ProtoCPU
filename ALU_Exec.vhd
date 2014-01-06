----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:28 01/04/2014 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use cpu_types.ALL;

entity ALU_Exec is
    Port ( clock : in STD_LOGIC;
           alu_sel : in STD_LOGIC_VECTOR(15 downto 0);
           op1 : in STD_LOGIC_VECTOR(31 downto 0);
           op2 : in STD_LOGIC_VECTOR(31 downto 0);
           result : out STD_LOGIC_VECTOR(31 downto 0));
end ALU_Exec;

architecture Behavioral of ALU_Exec is

--component adder32 is
--    Port( clock : in STD_LOGIC;
--			 vA : in STD_LOGIC_VECTOR (31 downto 0);
--			 vB : in STD_LOGIC_VECTOR (31 downto 0);
--          vS : out STD_LOGIC_VECTOR (31 downto 0)
--			);
--			  
--end component adder32;

begin


	
end Behavioral;

