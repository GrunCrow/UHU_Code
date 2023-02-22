--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:11:29 01/22/2020
-- Design Name:   
-- Module Name:   C:/Users/afmhu/P7/P7TEST.vhd
-- Project Name:  P7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P7_COMPLETA
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
 
ENTITY P7TEST IS
END P7TEST;
 
ARCHITECTURE behavior OF P7TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P7_COMPLETA
    PORT(
         RESET : IN  std_logic;
         CLK_50MHZ : IN  std_logic;
         CLK_CR : IN  std_logic;
         E : IN  std_logic;
         Q2 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q0 : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK_50MHZ : std_logic := '0';
   signal CLK_CR : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q2 : std_logic;
   signal Q1 : std_logic;
   signal Q0 : std_logic;
   signal S : std_logic;

   -- Clock period definitions
   constant CLK_50MHZ_period : time := 20 ns;
   constant CLK_CR_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P7_COMPLETA PORT MAP (
          RESET => RESET,
          CLK_50MHZ => CLK_50MHZ,
          CLK_CR => CLK_CR,
          E => E,
          Q2 => Q2,
          Q1 => Q1,
          Q0 => Q0,
          S => S
        );

   -- RESET process definitions
   RESET_process :process
   begin
		RESET <= '1';
		wait for CLK_50MHZ_period*1;
		RESET <= '0';
		wait;
   end process;

   -- Clock process definitions
   CLK_50MHZ_process :process
   begin
		CLK_50MHZ <= '0';
		wait for CLK_50MHZ_period/2;
		CLK_50MHZ <= '1';
		wait for CLK_50MHZ_period/2;
   end process;
 
   CLK_CR_process :process
   begin
		CLK_CR <= '0';
		wait for CLK_CR_period/2;
		CLK_CR <= '1';
		wait for CLK_CR_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
		E<='0'; wait for CLK_50MHZ_period*3;
		E<='1'; wait for CLK_50MHZ_period*1;
		E<='0'; wait for CLK_50MHZ_period*2;
		E<='1'; wait for CLK_50MHZ_period*3;
		E<='0'; wait for CLK_50MHZ_period*1;
		E<='1'; wait for CLK_50MHZ_period*2;
		E<='0'; wait for CLK_50MHZ_period*2;
		E<='1'; wait for CLK_50MHZ_period*2;
		E<='0'; wait for CLK_50MHZ_period*2;
      wait;
   end process;

END;