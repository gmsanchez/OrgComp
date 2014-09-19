--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:15:13 09/17/2014
-- Design Name:   
-- Module Name:   /home/gsanchez/Apps/TP_01/TB_C74F85_12B.vhd
-- Project Name:  TP_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: C74F85_12B
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
 
ENTITY TB_C74F85_12B IS
END TB_C74F85_12B;
 
ARCHITECTURE behavior OF TB_C74F85_12B IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT C74F85_12B
    PORT(
         A : IN  std_logic_vector(11 downto 0);
         B : IN  std_logic_vector(11 downto 0);
         OH : OUT  std_logic;
         OL : OUT  std_logic;
         OE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(11 downto 0) := (others => '0');
   signal B : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal OH : std_logic;
   signal OL : std_logic;
   signal OE : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: C74F85_12B PORT MAP (
          A => A,
          B => B,
          OH => OH,
          OL => OL,
          OE => OE
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		for an in 0 to 15 loop -- max es 4095
		for bn in 0 to 15 loop
				A <= std_logic_vector(to_unsigned(an,12));
				B <= std_logic_vector(to_unsigned(bn,12));
				wait for 5 ns;
				if an<bn then
					ASSERT (OH='0' and OL='1' and OE='0')
					report "Resultado erroneo. A = " & integer'image(an) & " B = " & integer'image(bn)
					severity ERROR;
				elsif an=bn then
					ASSERT (OH='0' and OL='0' and OE='1')
					report "Resultado erroneo. A = " & integer'image(an) & " B = " & integer'image(bn)
					severity ERROR;
				else
					ASSERT (OH='1' and OL='0' and OE='0')
					report "Resultado erroneo. A = " & integer'image(an) & " B = " & integer'image(bn)
					severity ERROR;
				end if;
	
				
		end loop;
		end loop;
		wait;
   end process;
	
END;
