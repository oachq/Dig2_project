library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity reg_mbrAux is
    generic (
        wl: integer:= 2
    );
  port (
  	clk:            in std_logic;
    mbrAux_in:      in std_logic_vector (wl-1 downto 0);
  	mbrAux_ce:      in std_logic; --verificar sobre el eneble 
  	mbrAux_arst:    in std_logic;
  	mbrAux_out:     out std_logic_vector (wl-1 downto 0)
  ) ;
end reg_mbrAux ; 

architecture arch of reg_mbrAux is
    signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(clk, mbrAux_ce, mbrAux_arst)
    begin
        if (mbrAux_ce = '1') then
            if(mbrAux_arst = '1') then 
                if(rising_edge(clk)) then 
                    cuenta <= mbrAux_in;
                end if;
            else
                cuenta <= (others => '0');
            end if;   
        end if ; 
    end process;    
    mbrAux_out <= cuenta;       
end architecture ;