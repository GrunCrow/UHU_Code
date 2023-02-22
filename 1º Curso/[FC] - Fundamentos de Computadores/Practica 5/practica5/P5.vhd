
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P5 is
    Port ( D3 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D0 : in  STD_LOGIC;
           N : out  STD_LOGIC;
           A : out  STD_LOGIC;
           C : out  STD_LOGIC;
           E : out  STD_LOGIC);
end P5;

architecture A_P5 of P5 is
	signal entrada: std_logic_vector (3 downto 0);
	begin
		entrada<=D3&D2&D1&D0;
		N<='1' when entrada = "0000" else
			'1' when entrada ="0001" else
			'1' when entrada ="0010" else
			'1' when entrada ="0011" else
			'1' when entrada ="0100" else
			'1' when entrada ="0101" else
			'1' when entrada ="0110" else
			'1' when entrada ="0111" else
			'1' when entrada ="1000" else
			'1' when entrada ="1001" else
			'0';
	
	process(D3,D2,D1,D0)
		begin
			if entrada = "0000" then C<='1';
			elsif entrada ="0001" then C<='1';
			elsif entrada ="0010" then C<='1';
			elsif entrada ="0011" then C<='1';
			elsif entrada ="0100" then C<='1';
			elsif entrada ="1000" then C<='1';
			elsif entrada ="1001" then C<='1';
			elsif entrada ="1010" then C<='1';
			elsif entrada ="1011" then C<='1';
			elsif entrada ="1100" then C<='1';
			else C<='0';
			end if;
	end process;
	
	process(D3,D2,D1,D0)
		begin
			case entrada is
				when "0011" | "0100" | "0101" | "0110" | "0111" | "1000" | "1001" | "1010" | "1011" | "1100" => E<='1';
				when others => E<= '0';
			end case;
	end process;
	
			with entrada select
			A<='1' when "0000",
				'1' when "0001",
				'1' when "0010",
				'1' when "0011",
				'1' when "0100",
				'1' when "1011",
				'1' when "1100",
				'1' when "1101",
				'1' when "1110",
				'1' when "1111",
			'0' when others;
end A_P5;

