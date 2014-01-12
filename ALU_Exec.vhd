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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.cpu_types.ALL;

entity ALU is
    Port( 
          alu_sel : in STD_LOGIC_VECTOR(7 downto 0);
          op1 : in STD_LOGIC_VECTOR(31 downto 0);
          op2 : in STD_LOGIC_VECTOR(31 downto 0);
          dest : out STD_LOGIC_VECTOR(31 downto 0));
end ALU;

architecture Behavioral of ALU is
		
begin
	
	select_op : process (alu_sel)
	
	variable tempDest : integer;
	variable iOp1 : integer;
	variable iOp2 : integer;
	
	begin
		
		iOp1 := to_integer(signed(op1));
		iOp2 := to_integer(signed(op2));
		
		case_select_op : case alu_sel is
					
			when alu_add =>  
				tempDest := iOp1 + iOp2;
				dest <= std_logic_vector(to_signed(tempDest, 32));
				
			when alu_sub =>  
				tempDest := iOp1 - iOp2;
				dest <= std_logic_vector(to_signed(tempDest, 32));
				
			when alu_mul => 
			when alu_div => 
				 
			when alu_and => 
				dest <= op1 and op2;
				
			when alu_nand =>
				dest <= op1 nand op2;
				
			when alu_or  => 
				dest <= op1 or op2; 
				
			when alu_nor => 
				dest <= op1 nor op2; 
				
			when alu_xor =>  
				dest <= op1 xor op2;
				
			when alu_xnor => 
				dest <= op1 xnor op2;
				
			when alu_not =>  
				dest <= not op1;
				
			when alu_shl =>  
			when alu_shr =>  
			when others =>
				
		end case case_select_op;
		
	end process select_op;
	
end Behavioral;

