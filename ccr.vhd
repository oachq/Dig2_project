library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ccr is
port(

sal_alu: in std_logic_vector (1 downto 0);--- recibe de la alu 2 bits
ce: 	 in std_logic;--- linea de activacion
flags: OUT std_logic_vector (1 downto 0);--- manda las flags ala UC
cout:	 OUT std_logic; ---- Carry de salida
clk: 	in std_logic;
arst:	in std_logic---- pos el reset

);
end ccr;


architecture behavioral of ccr is
begin
	process(clk,arst,ce)
	begin
	if ce='1' then
			if arst='1' then
				if rising_edge(clk) then
					flags<=sal_alu;
					cout<=sal_alu(1);

				end if;
				else
				flags<="00";
				cout<='0';

			end if;
			end if;


	end process;
	end behavioral;
