--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:13:28 09/10/2014
-- Design Name:   
-- Module Name:   /home/gsanchez/Apps/TP_01/TB_deco_32b.vhd
-- Project Name:  TP_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: deco_32b
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
USE ieee.numeric_std.ALL; 
use std.textio.all;
use work.txt_util.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_deco_32b IS
END TB_deco_32b;
 
ARCHITECTURE behavior OF TB_deco_32b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT deco_32b
    PORT(
         E : IN  std_logic;
         A : IN  std_logic_vector(4 downto 0);
         D : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal E : std_logic := '0';
   signal A : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
	

	


	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: deco_32b PORT MAP (
          E => E,
          A => A,
          D => D
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
		-- variable sD : string (32 downto 1);
		-- variable sDtest : string(32 downto 1);
		variable Dtest : std_logic_vector(31 downto 0);
   begin		
		-- Initialize input signals
		E <= '0';
		A <= "00000";
		wait for 20 ns;
		--
		for En in 0 to 1 loop
			E <= std_logic(to_unsigned(En,1)(0));
			for Anum in 0 to 31 loop
				A <= std_logic_vector(to_unsigned(Anum,5));
				-- Esperamos 5 ns para que se propague la señal A nueva
				wait for 5 ns;
				report "Entradas E = " & integer'image(En) & ", A = " & integer'image(Anum);
				-- Inicializo Stest en x'00000000'
				-- luego hago el bit en la posicion Anum = 1
				-- Para ver si el deco funciona bien
				Dtest := (others => '0');
				Dtest(Anum) := '1';
				
--				for i in 0 to 31 loop
--					if D(i) = '0' then
--						sD(i+1) := '0';
--					else
--						sD(i+1) := '1';
--					end if;
--					if Dtest(i) = '0' then
--						sDtest(i+1) := '0';
--					else
--						sDtest(i+1) := '1';
--					end if;
--				end loop;
				if (En = 0) then
					assert (x"00000000" = D)					
						report "Resultado erroneo. D = " & str(D) & ". Deberia ser 00000000000000000000000000000000."
						severity ERROR;
				else
					assert (Dtest = D)					
						report "Resultado erroneo. D = " & str(D) & ". Deberia ser " & str(Dtest) & "."
						severity ERROR;
				end if;
				wait for 10 ns;
			end loop;
		end loop;
		
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
