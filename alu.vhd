--Tabla de verdad de la ALU
-- X14 X13 X12 X11  Operaci�n
--  0   0   0   0    A <- MBR, 				CCR<-FLAGS	
--  0   0   0   1    A = ACC + MBR,			CCR<-FLAGS
--  0   0   1   0    A = ACC + MBR +Cin	CCR<-FLAGS
--  0   0   1   1    A = ACC=MBR?			CCR<-FLAGS
--  0   1   0   0    A = ACC AND MBR		CCR<-FLAGS
--  0   1   0   1    A = ACC OR MBR			CCR<-FLAGS
--  0   1   1   0    A = NOT ACC				CCR<-FLAGS
--  0   1   1   1    A = A>>					CCR<-FLAGS
--  1   0   0   0    A = A<<					CCR<-FLAGS
--  1   0   0   1    A = A-1					CCR<-FLAGS

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity alu is
    generic (
        wl: integer:=4
    );
  port (
    a_in:     in    std_logic_vector(wl-1 downto 0);-- entrada ACC
    b_in:     in    std_logic_vector(wl-1 downto 0);-- entrada MBR o regPipo
    s:        in    std_logic_vector(3 downto 0); -- selectores 
    Cin:      in    std_logic; -- carry de entrada
    F:        out   std_logic_vector(wl-1 downto 0);-- salida alu
    c,z:      out   std_logic -- banderas c= carry, z= zeros
    ) ;
end alu ; 

architecture arch of alu is

begin

end architecture ;