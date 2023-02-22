library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity P7_COMPLETA is
    Port ( RESET : in  STD_LOGIC;
           CLK_50MHZ : in  STD_LOGIC;
           CLK_CR : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           S : out  STD_LOGIC);
end P7_COMPLETA;

architecture Behavioral of P7_COMPLETA is
COMPONENT ANTIRREBOTES IS
	PORT (CLK_50MHZ, E: IN STD_LOGIC; S: OUT STD_LOGIC);
END COMPONENT;

COMPONENT P7 is
    Port ( 
			  CLK_SR : in STD_LOGIC;
			  RESET : in STD_LOGIC;
           E : in  STD_LOGIC;
           S : out  STD_LOGIC;
			  Q2 : out STD_LOGIC;
			  Q1 : out STD_LOGIC;
			  Q0 : out STD_LOGIC);	  
end COMPONENT;
SIGNAL CLK_SR: STD_LOGIC;

begin
C1: ANTIRREBOTES PORT MAP(CLK_50MHZ,CLK_CR,CLK_SR);
C2: P7 PORT MAP (CLK_SR,RESET,E,S,Q2,Q1,Q0);
end Behavioral;

