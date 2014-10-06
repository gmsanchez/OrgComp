-- Ejercicio 3(a), contador síncrono
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.txt_util.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY TB_Cont32bSinc IS
END TB_Cont32bSinc;

ARCHITECTURE behavior OF TB_Cont32bSinc IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Cont32bSinc
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         LOAD : IN  std_logic;
         CE : IN  std_logic;
         UND : IN  std_logic;
         DIN : IN  std_logic_vector(31 downto 0);
         Q : BUFFER  std_logic_vector(31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal CE : std_logic := '0';
   signal UND : std_logic := '0';
   signal DIN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Cont32bSinc PORT MAP (
          CLK => CLK,
          RST => RST,
          LOAD => LOAD,
          CE => CE,
          UND => UND,
          DIN => DIN,
          Q => Q
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
		-- check initial states
		wait for 12 ns;
		DIN<=x"00000000";
		RST<='1';
		LOAD<='0';
		UND<='0';
		CE <= '0';
		wait for 10 ns;
		RST <= '0';
		wait for 40 ns; -- debe mantenerse sin contar
		DIN <= x"0000005A";
		CE<='1';
		wait for 20 ns;
		LOAD <= '1';
		wait for 10 ns;
		LOAD <= '0';
		wait for 100 ns;
		UND <= '1';
      wait;
   end process;

	corr_proc: process(CLK)
		variable theTime : time;
   begin
		theTime := now;

		if theTime=20000 ps then
			assert (Q=x"00000000")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

		if theTime=70000 ps then
			assert (Q=x"fffffffc")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

		if theTime=80000 ps then
			assert (Q=x"fffffff8")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

		if theTime=90000 ps then
			assert (Q=x"0000005a")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

		if theTime=120000 ps then
			assert (Q=x"0000004e")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

		if theTime=210000 ps then
			assert (Q=x"0000003a")
				report "Resultado erroneo a los " & time'image(theTime) & " Q=" & str(Q)
				severity ERROR;
		end if;

	end process;

END;
