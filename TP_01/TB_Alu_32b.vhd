--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:01:24 09/11/2014
-- Design Name:   
-- Module Name:   /home/gsanchez/Apps/TP_01/TB_Alu_32b.vhd
-- Project Name:  TP_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_32b
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
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

ENTITY TB_Alu_32b IS
END TB_Alu_32b;
 
ARCHITECTURE behavior OF TB_Alu_32b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_32b
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(3 downto 0);
         AluOut : BUFFER  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         OFL : OUT  std_logic;
         COut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal AluOut : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal OFL : std_logic;
   signal COut : std_logic;
	
	TYPE num_array IS ARRAY (1 TO 4) OF std_logic_vector(31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_32b PORT MAP (
          A => A,
          B => B,
          AluOp => AluOp,
          AluOut => AluOut,
          Zero => Zero,
          OFL => OFL,
          COut => COut
        );

   -- Stimulus process
   stim_proc: process
		
		variable na : num_array;
		variable sum : std_logic_vector(32 downto 0);
   begin
		na(1) := x"00000000";
		na(2) := x"ffffffff";
		na(3) := x"5a5a5a5a";
		na(4) := x"a5a5a5a5";
		for nidx_i in 1 to 4 loop
		for nidx_j in 1 to 4 loop
		for AluOpInt in 0 to 15 loop
			A<= na(nidx_i);
			B<= na(nidx_j);
			AluOp <= std_logic_vector(to_unsigned(AluOpInt,4));
			wait for 10 ns;
			
			case AluOp is
				when "0000" => assert (AluOut = (A and B))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
				when "0001" => assert (AluOut = (A or B))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
				when "0010" => sum := (A(A'high) & A) + (B(B'high) & B);
				
									assert (AluOut = (sum(31 downto 0)))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
									assert (COut = sum(32))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
									assert (OFL = (sum(32) xor sum(31)))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
				when "0110" => sum := (A(A'high) & A) - (B(B'high) & B);
				
									assert (AluOut = (sum(31 downto 0)))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
									assert (COut = sum(32))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
									assert (OFL = (sum(32) xor sum(31)))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
									
				when "0111" => if (A<B) then
										Assert (AluOut = x"00000001")
										report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
										severity ERROR;
									else
										Assert (AluOut = x"00000000")
										report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
										severity ERROR;
									end if;
				when "1100" => assert (AluOut = (not(A or B)))
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
				when others => assert (AluOut = x"00000000")
									report "Resultado erroneo. AluOp = " & integer'image(AluOpInt)
									severity ERROR;
			end case;
		
			
		end loop;
		end loop;
		end loop;
	
--		AluOp <= "0010";
--		A <= x"40000000";--x"11111111";
--		B <= x"0000000F";--x"FFFFFFFF";
--		wait for 10 ns;
--		AluOp <= "0110";
--		A <= x"7FFFFFFF";
--		B <= x"FFFFFFFF";
--		wait for 10 ns;
--		A <= x"01010101";
--		B <= x"F0F0F0F0";
--		for AluOpInt in 0 to 15 loop
--			AluOp <= std_logic_vector(to_unsigned(AluOpInt,4));
--			wait for 10 ns;
--		end loop;
--			
--      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
