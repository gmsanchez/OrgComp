--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:06:18 10/01/2014
-- Design Name:
-- Module Name:   E:/2014/Academico/OC/2014/tp2/TB_SN54LV165A.vhd
-- Project Name:  tp2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: SN54LV165A
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

ENTITY TB_SN54LV165A IS
END TB_SN54LV165A;

ARCHITECTURE behavior OF TB_SN54LV165A IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT SN54LV165A
    PORT(
         CLK : IN  std_logic;
         CLKIN : IN  std_logic;
         NLOAD : IN  std_logic;
         SER : IN  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         Q : OUT  std_logic;
         NQ : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal CLK : std_logic := '0';
   signal CLKIN : std_logic := '0';
   signal NLOAD : std_logic := '0';
   signal SER : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic;
   signal NQ : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: SN54LV165A PORT MAP (
          CLK => CLK,
          CLKIN => CLKIN,
          NLOAD => NLOAD,
          SER => SER,
          DIN => DIN,
          Q => Q,
          NQ => NQ
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
		nload<='1';
      -- hold reset state for 20 ns.
      wait for 20 ns;
      -- insert stimulus here
		CLKIN<='1';
		SER<='0';
		NLOAD<='1';
		DIN<="00000000";
		wait for 20 ns;
		NLOAD<='0';
		DIN<="11010101";
		wait for 5 ns;
		NLOAD<='1';
		wait for 20 ns;
		CLKIN<='0';
      wait;
   end process;

	corr_proc: process(CLK)
	variable theTime : time;
	begin
		theTime := now;
		if theTime=30000 ps then
			report time'image(theTime);
			assert (q='0' and nq='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=45000 ps then
			report time'image(theTime);
			assert (q='1' and nq='0')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=90000 ps then
			report time'image(theTime);
			assert (q='0' and nq='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=100000 ps then
			report time'image(theTime);
			assert (q='1' and nq='0')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=110000 ps then
			report time'image(theTime);
			assert (q='0' and nq='1')
				report("Salidas erroneas.")
				severity ERROR;
		end if;

		if theTime=120000 ps then
			report time'image(theTime);
			assert (q='1' and nq='0')
				report("Salidas erroneas.")
				severity ERROR;
		end if;


	end process;

END;
