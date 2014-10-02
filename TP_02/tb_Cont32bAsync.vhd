--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:36:58 10/01/2014
-- Design Name:
-- Module Name:   E:/2014/Academico/OC/2014/tp2/tb_Cont32bAsync.vhd
-- Project Name:  tp2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: Cont32bAsync
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
USE work.txt_util.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_Cont32bAsync IS
END tb_Cont32bAsync;

ARCHITECTURE behavior OF tb_Cont32bAsync IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Cont32bAsync
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
   uut: Cont32bAsync PORT MAP (
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
    -- Agregar estimulos aqui
    wait;
	 end process;

END;
