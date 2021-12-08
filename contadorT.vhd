library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity reg_contadorT is
    generic (wl: integer:= 4);
  port (
    clk:          in std_logic;
    regC_arst:    in std_logic;
    regC_srst:    in std_logic;
    regC_dout:    out std_logic_vector(wl-1 downto 0)
    ) ;
end reg_contadorT ; 

architecture arch of reg_contadorT is
signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(clk, regC_arst, regC_srst)
        begin
            if (regC_arst='1') then
                cuenta <= (others => '0');
            elsif rising_edge(clk) then 
                cuenta <= cuenta + 1;
                if (regC_srst = '1') then
                    cuenta <= (others => '0');
                end if ;
            end if ;
    end process;
    regC_dout <= cuenta;
end architecture ;