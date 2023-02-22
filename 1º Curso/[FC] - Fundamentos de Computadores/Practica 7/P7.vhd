library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity P7 is
    Port ( 
			  CLK_SR : in STD_LOGIC;
			  RESET : in STD_LOGIC;
           E : in  STD_LOGIC;
           S : out  STD_LOGIC;
			  Q2 : out STD_LOGIC;
			  Q1 : out STD_LOGIC;
			  Q0 : out STD_LOGIC);	  
end P7;

architecture A_P7 of P7 is

subtype mis_estados is std_logic_vector(2 downto 0);
--constant inicio	: mis_estados :="000";
--constant A	: mis_estados :="001";
--constant B	: mis_estados :="010";
--constant C	: mis_estados :="011";
--constant D	: mis_estados :="100";
--constant E_e	: mis_estados :="101";
--constant F	: mis_estados :="110";
signal estado : mis_estados;

begin

		Q2 <= estado(2);
		Q1 <= estado(1);
		Q0 <= estado(0);
		
	process(RESET, CLK_SR,estado)
		begin 
			if ( RESET = '1') then estado <= "000";
			elsif CLK_SR 'event and CLK_SR = '1' then 
				case estado is 
					when "000" => if (E = '0') then estado <= "001";
								  else estado <= "100";
								  end if;
					when "001" => if (E = '1') then estado <= "010";
						        end if;
				   when "010" => if (E = '0') then estado <= "011";
					           else estado <= "100";
								  end if;
					when "100" => if (E = '0') then estado <= "101";
								  end if;
				   when "101" => if (E = '1') then estado <= "110";
					           else estado <= "001";
								  end if;
					when "011" => if (E = '1') then estado <= "000";
                          end if;
					when "110" => if (E = '0') then estado <= "000";
                          end if;
               when others =>								  
								  
				end case;
			end if;
			
		

						

	end process;
	
	process(estado)
		begin
			S <= '0';
			case estado is
		
			when "011" => S <= '1';
			when "110" => S <= '1';
			when others =>
			end case;

	end process;

end A_P7;

