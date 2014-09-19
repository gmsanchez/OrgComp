--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:19 09/10/2014
-- Design Name:   
-- Module Name:   /home/gsanchez/Apps/TP_01/TB_GenParidad.vhd
-- Project Name:  TP_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GenParidad
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
 use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_GenParidad IS
END TB_GenParidad;
 
ARCHITECTURE behavior OF TB_GenParidad IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT GenParidad
    PORT(
         E : IN  std_logic_vector(3 downto 0);
         P : IN  std_logic;
         S : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal E : std_logic_vector(3 downto 0) := (others => '0');
   signal P : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GenParidad PORT MAP (
          E => E,
          P => P,
          S => S
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
   begin		
      -- hold reset state for 100 ns.
		for Paridad in 0 to 1 loop
			P <= std_logic(to_unsigned(Paridad,1)(0));
			for Ent in 0 to 15 loop
				E <= std_logic_vector(to_unsigned(Ent,4));
				wait for 10 ns;
			end loop;
		end loop;
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
