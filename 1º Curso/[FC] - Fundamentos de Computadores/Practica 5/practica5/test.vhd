LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT P5
    PORT(
         D3 : IN  std_logic;
         D2 : IN  std_logic;
         D1 : IN  std_logic;
         D0 : IN  std_logic;
         N : OUT  std_logic;
         A : OUT  std_logic;
         C : OUT  std_logic;
         E : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D3 : std_logic := '0';
   signal D2 : std_logic := '0';
   signal D1 : std_logic := '0';
   signal D0 : std_logic := '0';

 	--Outputs
   signal N : std_logic;
   signal A : std_logic;
   signal C : std_logic;
   signal E : std_logic;

BEGIN
 
   uut: P5 PORT MAP (
          D3 => D3,
          D2 => D2,
          D1 => D1,
          D0 => D0,
          N => N,
          A => A,
          C => C,
          E => E
        );

   -- Stimulus process
   stim_proc: process
   begin		
		D3<='0';D2<='0';D1<='0';D0<='0'; wait for 50 ns;	
		D3<='0';D2<='0';D1<='0';D0<='1'; wait for 50 ns;	
		D3<='0';D2<='0';D1<='1';D0<='0'; wait for 50 ns;	
		D3<='0';D2<='0';D1<='1';D0<='1'; wait for 50 ns;	
		D3<='0';D2<='1';D1<='0';D0<='0'; wait for 50 ns;
		D3<='0';D2<='1';D1<='0';D0<='1'; wait for 50 ns;	
		D3<='0';D2<='1';D1<='1';D0<='0'; wait for 50 ns;	
		D3<='0';D2<='1';D1<='1';D0<='1'; wait for 50 ns;	
		D3<='1';D2<='0';D1<='0';D0<='0'; wait for 50 ns;
		D3<='1';D2<='0';D1<='0';D0<='1'; wait for 50 ns;
		D3<='1';D2<='0';D1<='1';D0<='0'; wait for 50 ns;
		D3<='1';D2<='0';D1<='1';D0<='1'; wait for 50 ns;	
		D3<='1';D2<='1';D1<='0';D0<='0'; wait for 50 ns;
		D3<='1';D2<='1';D1<='0';D0<='1'; wait for 50 ns;
		D3<='1';D2<='1';D1<='1';D0<='0'; wait for 50 ns;
		D3<='1';D2<='1';D1<='1';D0<='1';	wait for 50 ns;	
      wait;
   end process;

END;
