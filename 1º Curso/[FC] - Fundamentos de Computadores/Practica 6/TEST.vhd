LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
  
ENTITY TEST IS
END TEST;
 
ARCHITECTURE behavior OF TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P6
    PORT(
         S : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Ci : IN  std_logic;
         F : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Ci : std_logic := '0';

 	--Outputs
   signal F : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P6 PORT MAP (
          S => S,
          A => A,
          B => B,
          Ci => Ci,
          F => F
        );

   -- Clock process definitions
  -- <clock>_process :process
 --  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      S<="000";A<="0100";B<="1000";Ci<='1'; wait for 50 ns;	
		S<="000";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;
		S<="001";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;	
		S<="010";A<="0100";B<="1000";Ci<='1'; wait for 50 ns;
		S<="010";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;
		S<="011";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;
		S<="100";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;	
		S<="101";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;
		S<="110";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;	
		S<="111";A<="0100";B<="1000";Ci<='0'; wait for 50 ns;
      wait;
   end process;

END;
