library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity P6 is
	Port (
			S: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			A: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Ci: IN STD_LOGIC;
			F: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)); -- Se le añade un bit más? -- F: OUT STD_LOGIC_VECTOR (0 TO 4)?
			--Co: OUT STD_LOGIC);
end P6;

architecture a_p6 of P6 is

begin

	process (S,A,B,Ci)
		begin
		case S is
			when "000" => F <= ('0'&A)+('0'&B)+("0000"&Ci);
			when "001" => F <= ('0'&A)-('0'&B);
			when "010" => F <= (('0'&A)+"00001")+("0000"&Ci);
			when "011" => F <= (('0'&A)-"00001");
			when "100" => F <= ('0'&A) nand ('0'&B);
			when "101" => F <= ('0'&A) and ('0'&B);
			when "110" => F <= ('0'&A) xor "00001";
			when "111" => F <= not ('0'&A);

			when others => F <= "00000";
		end case;
	end process;

end a_p6;

