-------------------------------------------------------------------------------------------------------------------                            
              --Tabla de verdad de la ALU
                 --  | S2  S1  S0 | Funciones         |    Banderas     |         
                 -- 0| 0   0   0  |  A <- NOT ACC'    |    CCR <- FLAGS |         
                 -- 1| 0   0   1  |  A <- ACC and MBR |    CCR <- FLAGS |                  
                 -- 2| 0   1   0  |  A <- ACC OR MBR  |    CCR <- FLAGS |                 
                 -- 3| 0   1   1  |  A <- ACC XOR MBR |    CCR <- FLAGS |              
                 -- 4| 1   0   0  |  A <- ACC << 1    |    CCR <- FLAGS |               
                 -- 5| 1   0   1  |  A <- ACC >> 1    |    CCR <- FLAGS |               
                 -- 6| 1   1   0  |  A <- ACC + MBR   |    CCR <- FLAGS |                
                 -- 7| 1   1   1  |  A <- MBR         |    CCR <- FLAGS |         
-------------------------------------------------------------------------------------------------------------------
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    --use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;
 
entity alu is
    generic (
        wl: integer:=4
    );
  port (
    a_in:     in    std_logic_vector(wl-1 downto 0);-- entrada ACC
    b_in:     in    std_logic_vector(wl-1 downto 0);-- entrada MBR o regPipo
    s:        in    std_logic_vector(2 downto 0); -- selectores 
    F:        out   std_logic_vector(wl-1 downto 0);-- salida alu
    c,z:      out   std_logic -- banderas c= carry, z= zeros
    ) ;
end alu ; 

architecture arch of alu is
    signal cuenta :         std_logic_vector(wl-1 downto 0);
    signal corrimiento: std_logic_vector(wl downto 0);
begin
    process(a_in, b_in, s )
    begin

    case( s ) is
    
        when "000" =>   --NOT ACC'
            cuenta <= not a_in;
            c <= '0';

        when "001" => --ACC and MBR  
            cuenta <= a_in and b_in;
            c <= '0';

        when "010" =>  --ACC OR MBR
            cuenta <= a_in or b_in;
            c <= '0';

        when "011" =>  --ACC XOR MBR
            cuenta <= a_in xor b_in;
            c <= '0';

        when "100" =>  --ACC << 1
            corrimiento <= '0' & a_in(wl-1 downto 1); -- 8bits
            --cuenta <= a_in(wl-1 downto 1) srl 1;
            cuenta <= corrimiento(wl downto 1 );
            c <= corrimiento(0); -- << 0 o 1 segun el resul 

        when "101" =>  --ACC >> 1
            corrimiento <= a_in(wl-1 downto 1) & '0' ; --8bits
            --cuenta <= (a_in(wl-1 downto 1) sll 1);
            cuenta <= corrimiento(wl-1 downto 0);
            c <= corrimiento(8); -- 0 o 1 segun el resul >>
           
        when "110" =>  --ACC + MBR
            cuenta <= a_in + b_in;
                if (cuenta < a_in or cuenta < b_in) or (a_in(wl-1)='1' and b_in(wl-1)='1') then
                    c <= '1';
                else
                    c <= '0';
                end if;   

        when others =>
        cuenta <= b_in;
        c <= '0';
    end case ; 
   
    if (cuenta = "00000000") then
        z <= '1';
    else
        z <= '0';    
    end if ;
end process;  
	  F <= cuenta ;
end architecture ;