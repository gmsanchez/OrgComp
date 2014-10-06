--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   15:10:32 10/01/2014
-- Design Name:
-- Module Name:   E:/2014/Academico/OC/2014/tp2/TB_SN54AS169A.vhd
-- Project Name:  tp2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: SN54AS169A
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
--USE ieee.numeric_std.ALL;

ENTITY TB_SN54AS169A IS
END TB_SN54AS169A;

ARCHITECTURE Behavioral OF TB_SN54AS169A IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT SN54AS169A
    PORT(
         CLK : IN  std_logic;
         UND : IN  std_logic;
         NLOAD : IN  std_logic;
         NENT : IN  std_logic;
         NENP : IN  std_logic;
         DIN : IN  std_logic_vector(3 downto 0);
         NRCO : OUT  std_logic;
         DOUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal UND : std_logic := '0';
   signal NLOAD : std_logic := '0';
   signal NENT : std_logic := '0';
   signal NENP : std_logic := '0';
   signal DIN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NRCO : std_logic;
   signal DOUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
--	variable whatsTheTime : time;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: SN54AS169A PORT MAP (
          CLK => CLK,
          UND => UND,
          NLOAD => NLOAD,
          NENT => NENT,
          NENP => NENP,
          DIN => DIN,
          NRCO => NRCO,
          DOUT => DOUT
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
      -- hold reset state for 100 ns.
      wait for 20 ns;
		-- insert stimulus here
		DIN<="1101";
		NLOAD<='1';
		UND<='0';
		NENT<='1';
		NENP<='1';
		wait for 5 ns;
		NLOAD<='0';
		UND<='1';
		NENT<='0';
		NENP<='0';
      wait for 5 ns;
		NLOAD<='1';
		wait for 40 ns;
		NENP<='1';
		NENT<='1';
		wait for 5 ns;
		UND<='0';
		wait for 25 ns;
		NENP<='0';
		NENT<='0';
		wait;
   end process;

	corr_proc: process(CLK)
	variable theTime : time;
	begin
		theTime := now;
		if theTime=30000 ps then
			report time'image(theTime);
			assert (dout="1101" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=40000 ps then
			report time'image(theTime);
			assert (dout="1110" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=50000 ps then
			report time'image(theTime);
			assert (dout="1111" and nrco='0')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=60000 ps then
			report time'image(theTime);
			assert (dout="0000" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=70000 ps then
			report time'image(theTime);
			assert (dout="0001" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=110000 ps then
			report time'image(theTime);
			assert (dout="0000" and nrco='0')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=120000 ps then
			report time'image(theTime);
			assert (dout="1111" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=130000 ps then
			report time'image(theTime);
			assert (dout="1110" and nrco='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

	end process;

END;
