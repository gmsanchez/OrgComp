-- Ejercicio 1(a)
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.txt_util.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY TB_Reg_32b IS
END TB_Reg_32b;

ARCHITECTURE behavior OF TB_Reg_32b IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Reg_32b
    PORT(
         D : IN  std_logic_vector(31 downto 0);
         CLK : IN  std_logic;
         LOAD : IN  std_logic;
         RST : IN  std_logic;
         O : BUFFER  std_logic_vector(31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal D : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal O : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_32b PORT MAP (
          D => D,
          CLK => CLK,
          LOAD => LOAD,
          RST => RST,
          O => O
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
		-- check initial status
		wait for 6 ns;
		-- hold reset state for 5 ns.
		RST <= '1';
		LOAD <= '0';
		D <= x"FAFAFAFA";
		wait for 5 ns;
		RST <= '0';
		wait for 15 ns;
		LOAD <= '1';
      wait for 20 ns;
		D <= x"51617181";
		wait for 15 ns;
		LOAD <= '0';
		wait;
   end process;

	corr_proc: process(CLK)
		variable theTime : time;
	begin
		theTime := now;
		-- report time'image(theTime);
		if theTime=10000 ps then
			assert (O=x"00000000")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=40000 ps then
			assert (O=x"FAFAFAFA")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=60000 ps then
			assert (O=x"51617181")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=75000 ps then
			assert (O=x"51617181")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

	end process;

END;
