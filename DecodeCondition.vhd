----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:33:23 02/23/2014 
-- Design Name: 
-- Module Name:    DecodeCondition - Behavioral 
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

use work.cpu_types.all;

entity DecodeCondition is
	Port( 
			cond : in STD_LOGIC_VECTOR(3 downto 0);
         cond_eval : out STD_LOGIC
		 );
end DecodeCondition;

architecture Behavioral of DecodeCondition is

	component MemRegion_Registers is
		Port( 
				rw_sel : in STD_LOGIC;
				offset : in STD_LOGIC_VECTOR(3 downto 0);
				write_word : in STD_LOGIC_VECTOR(31 downto 0);	-- Write this word to register offset
				read_word : out STD_LOGIC_VECTOR(31 downto 0)	-- Read this word from register offset
			  );
	end component MemRegion_Registers;
	
	signal reg_offset : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal write_word : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal psr_reg_data : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 

begin

	memreg_registers : MemRegion_Registers port map
	(
		rw_sel => reg_read,
		offset => reg_offset,
		write_word => write_word,
		read_word => psr_reg_data
	);

	ProcEvaluateCondition : process(cond)
	
	begin 
	
		-- Trigger signal to retrieve PSR from register file
		reg_offset <= R4_addr;
		
		--	31 30 29 28			27-24					23-0
		--	Flags					Flags					Reserved
		--	Z	N	C	V 			Unused				Unused	
		
		if_evaluate_cond : if cond = cond_true then
		
			-- No condition supplied is always true
			cond_eval <= '1';
			
		elsif cond = cond_eq then
			--	equal 
			--		eq = 0
			--		if Z == 1
			--			eq = 1
			--		endif 
			if psr_reg_data(Z_Flag_BitPos) = '1' then
				cond_eval <= '1';
			end if;
		
		elsif cond = cond_nq then
			--	not equal
			--	nq = 0
			--		if Z != 1
			--			nq = 1
			--		endif 	
			if psr_reg_data(Z_Flag_BitPos) = '0' then
				cond_eval <= '1';
			end if;	
			
		elsif cond = cond_gt then
			--	gt = 0
			--		if N == 0
			--			gt = 1
			--		endif 
			if psr_reg_data(N_Flag_BitPos) = '0' then
				cond_eval <= '1';
			end if;	
	
		elsif cond = cond_ge then
			--	greater than or equal
			--	ge = 0
			--		if N == 0 or Z == 0
			--			ge = 1
			--		endif 
			--
			if psr_reg_data(N_Flag_BitPos) = '0' or psr_reg_data(Z_Flag_BitPos) = '0' then
				cond_eval <= '1';
			end if;	

		elsif cond = cond_lt then
			--	less than
			--	lt = 0
			--		if !(N == 0)
			--			lt = 1
			--		endif 
			--
			if psr_reg_data(N_Flag_BitPos) = '1' then
				cond_eval <= '1';
			end if;	
			
		elsif cond = cond_le then
			--	less than or equal
			--	le = 0
			--		if !(N == 0) or Z == 0
			--			le = 1
			--		endif 	
			if psr_reg_data(N_Flag_BitPos) = '1' or psr_reg_data(Z_Flag_BitPos) = '0' then
				cond_eval <= '1';
			end if;	
			
		end if if_evaluate_cond;
		
	end process ProcEvaluateCondition;

end Behavioral;

