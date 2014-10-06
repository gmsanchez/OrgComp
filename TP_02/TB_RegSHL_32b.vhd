-- Ejercicio 1(b)
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.txt_util.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY TB_RegSHL_32b IS
END TB_RegSHL_32b;

ARCHITECTURE behavior OF TB_RegSHL_32b IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT RegSHL_32b
    PORT(
         D : IN  std_logic_vector(31 downto 0);
         LOAD : in  STD_LOGIC;
         SHL : in STD_LOGIC;
         SLI : in  STD_LOGIC;
			CLK : in  STD_LOGIC;
         RST : in  STD_LOGIC;
         O : BUFFER  std_logic_vector(31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal D : std_logic_vector(31 downto 0) := (others => '0');
	signal LOAD : std_logic := '0';
	signal SHL : std_logic := '0';
   signal SLI : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal O : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: RegSHL_32b PORT MAP (
          D => D,
          LOAD => LOAD,
			 SHL => SHL,
          SLI => SLI,
          CLK => CLK,
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
		SLI <= '0';
		RST <= '1';
		LOAD <= '0';
		SHL <= '0';
		D <= x"FAFAFAFA";
		wait for 5 ns;
		RST <= '0';
		wait for 15 ns;
		LOAD <= '1';
		SHL <= '1';
      wait for 20 ns;
		D <= x"00000040"; -- Cargo un 64
		wait for 15 ns;
		LOAD <= '0';
		SHL <= '0';
		wait for 10 ns;
		-- Hasta acá es igual al el otro registro. Empecemos los shift.
		LOAD <= '0';
		SHL <= '1';
		wait for 60 ns;
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
			assert (O=x"00000040")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=70000 ps then
			assert (O=x"00000040")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=100000 ps then
			assert (O=x"00000200")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

		if theTime=120000 ps then
			assert (O=x"00000800")
				report "Resultado erroneo a los " & time'image(theTime) & " O=" & str(O)
				severity ERROR;
		end if;

	end process;

END;
