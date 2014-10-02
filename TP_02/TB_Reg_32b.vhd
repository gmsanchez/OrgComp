--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   11:22:46 10/02/2014
-- Design Name:
-- Module Name:   /home/gsanchez/Apps/TP_02/TB_Reg_32b.vhd
-- Project Name:  TP_02
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: Reg_32b
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
      -- Agregar estimulos aqui
      wait;
   end process;

END;
