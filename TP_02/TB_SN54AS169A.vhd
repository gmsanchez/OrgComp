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
		-- insert stimulus here
		wait;
   end process;
	
END;
