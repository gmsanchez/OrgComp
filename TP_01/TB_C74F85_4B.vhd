--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:59 09/17/2014
-- Design Name:   
-- Module Name:   /home/gsanchez/Apps/TP_01/TB_C74F85_4B.vhd
-- Project Name:  TP_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: C74F85_4B
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
 
ENTITY TB_C74F85_4B IS
END TB_C74F85_4B;
 
ARCHITECTURE behavior OF TB_C74F85_4B IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT C74F85_4B
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         IL : IN  std_logic;
         IE : IN  std_logic;
         IH : IN  std_logic;
         OL : OUT  std_logic;
         OE : OUT  std_logic;
         OH : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal IL : std_logic := '0';
   signal IE : std_logic := '0';
   signal IH : std_logic := '0';

 	--Outputs
   signal OL : std_logic;
   signal OE : std_logic;
   signal OH : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: C74F85_4B PORT MAP (
          A => A,
          B => B,
          IL => IL,
          IE => IE,
          IH => IH,
          OL => OL,
          OE => OE,
          OH => OH
        );

   -- Stimulus process
   stim_proc: process
   begin
      -- A<B
		IH<= '0'; IL<='0'; IE <='1';
		A<="1010";
		B<="1101";
		wait for 5 ns;
		ASSERT (OH='0' and OL='1' and OE='0')
			report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
			severity ERROR;
		-- A>B
		A<="1110";
		B<="1101";
		wait for 5 ns;
		ASSERT (OH='1' and OL='0' and OE='0')
			report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
			severity ERROR;
		-- A=B, tenemos que mirar IH, IL, IE
		A<="1101";
		B<="1101";
		for ihle in 0 to 7 loop
				IH <= std_logic(to_unsigned(ihle,3)(2));
				IL <= std_logic(to_unsigned(ihle,3)(1));
				IE <= std_logic(to_unsigned(ihle,3)(0));
				wait for 5 ns;
				case ihle is
					when 0 => assert (OH='1' and OL='1' and OE='0')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 1 => assert (OH='0' and OL='0' and OE='1')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 2 => assert (OH='0' and OL='1' and OE='0')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 3 => assert (OH='0' and OL='0' and OE='1')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 4 => assert (OH='1' and OL='0' and OE='0')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 5 => assert (OH='0' and OL='0' and OE='1')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 6 => assert (OH='0' and OL='0' and OE='0')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
					when 7 => assert (OH='0' and OL='0' and OE='1')
									report "Resultado erroneo. A = " & integer'image(to_integer(unsigned(A))) & " B = " & integer'image(to_integer(unsigned(B)))
									severity ERROR;
				end case;
		end loop;
		
--		for an in 0 to 15 loop
--		for bn in 0 to 15 loop
--		for ihle in 0 to 7 loop
--				IH <= std_logic(to_unsigned(ihle,3)(2));
--				IL <= std_logic(to_unsigned(ihle,3)(1));
--				IE <= std_logic(to_unsigned(ihle,3)(0));
--				A <= std_logic_vector(to_unsigned(an,4));
--				B <= std_logic_vector(to_unsigned(bn,4));
--				wait for 5 ns;
--		end loop;
--		end loop;
--		end loop;

      wait;
   end process;

END;
