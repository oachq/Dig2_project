library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CCR is
    Port ( CCRCIn : in  STD_LOGIC;
	        CCRZIn : in  STD_LOGIC;
           CE : in  STD_LOGIC; 
           CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC; --Reset Asincrono
			  CCRCOut : out  STD_LOGIC;
           CCRZOut : out  STD_LOGIC); 
end CCR;

architecture Behavioral of CCR is
	SIGNAL TempCCRCOut : STD_LOGIC := '0';
	SIGNAL TempCCRZOut : STD_LOGIC := '0';
begin
	CCRCOut <= TempCCRCOut;
	CCRZOut <= TempCCRZOut;
	
	PROCESS (CLK, CCRCIn,CCRZIn , CE, RESET) 
	BEGIN
		CASE RESET IS
			WHEN '1' =>
				TempCCRCOut <= '0';
				TempCCRZOut <= '0';
				
			WHEN OTHERS =>
				IF RISING_EDGE(CLK) THEN
				IF (CE = '1') THEN
					TempCCRCOut <= CCRCIn;
					TempCCRZOut <= CCRZIn;
				ELSE
					TempCCRCOut <= TempCCRCOut;
					TempCCRZOut <= TempCCRZOut;
				END IF;
			   END IF;
			END CASE;
		END PROCESS;
end Behavioral;

