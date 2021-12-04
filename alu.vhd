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
        wl: integer:=8
    );
  port (
    a_in:     in    std_logic_vector(wl-1 downto 0);-- entrada ACC
    b_in:     in    std_logic_vector(wl-1 downto 0);-- entrada MBR o regPipo
    s:        in    std_logic_vector(2 downto 0); -- selectores 
    --Cin:      in    std_logic; -- carry de entrada
    F:        out   std_logic_vector(wl-1 downto 0);-- salida alu
    c,z:      out   std_logic -- banderas c= carry, z= zeros
    ) ;
end alu ; 

architecture arch of alu is
    signal cuenta :         std_logic_vector(wl-1 downto 0);
    signal c_Temp, z_temp:  std_logic; 
begin
    process(a_in, b_in, s, )
    begin

    case( s ) is
    
        when "000" =>   --NOT ACC'
            cuenta <= not a_in;
            C_temp <= '0';
                if (cuenta = (a_in and not(a_in))) then -- cehcar error del if 
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "001" => --ACC and MBR  
            cuenta <= a_in and b_in;
            if (b_in > not(a_in)) then
                c_Temp <= '1';
            else
                c_Temp <= '0'; 
            end if ; 
            
                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "010" =>  --ACC OR MBR
            cuenta <= a_in or b_in;
            if (b_in > not(a_in)) then
                c_Temp <= '1';
            else
                c_Temp <= '0'; 
            end if ; 

                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "011" =>  --ACC XOR MBR
            cuenta <= a_in xor b_in;
            if (b_in > not(a_in)) then
                c_Temp <= '1';
            else
                c_Temp <= '0'; 
            end if ; 

                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "100" =>  --ACC << 1
            cuenta <= '0' & a_in(wl-1 downto 1);
            --cuenta <= a_in(wl-1 downto 1) srl 1;
            if (b_in > not(a_in)) then
                c_Temp <= '1';
            else
                c_Temp <= '0'; 
            end if ; 

                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "101" =>  --ACC >> 1
            cuenta <= a_in(wl-1 downto 1) & '0' ;
            --cuenta <= (a_in(wl-1 downto 1) sll 1);
           if (b_in > not(a_in)) then
                    c_Temp <= '1';
                else
                    c_Temp <= '0'; 
                end if ; 
                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "110" =>  --ACC + MBR
            cuenta <= a_in + b_in;
               
                if (b_in > not(a_in)) then
                    c_Temp <= '1';
                else
                    c_Temp <= '0'; 
                end if ;    
                
                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;

        when "111" =>  --ACC + MBR
            cuenta <= b_in;
                    
                if (b_in > not(a_in)) then
                    c_Temp <= '1';
                else
                    c_Temp <= '0'; 
                end if ;    
                
                if (cuenta = (a_in and not(a_in))) then
                    z_temp <= '1';
                else
                    z_temp <= '0';
                end if ;
        
        when others =>
        cuenta <= (others => '0');
    end case ; 
    end process;
	  F <= cuenta ;
     c <= c_Temp ;
     z <= z_temp ;
end architecture ;