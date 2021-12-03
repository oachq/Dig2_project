library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;
    
entity reg_MAR is
    generic (
        wl: integer:=8
    );
  port (
    clk:        in std_logic_vector(wl-1 downto 0);
    mar_in:     in std_logic;
    mar_ce:     in std_logic;
    mar_arst:   in std_logic;
    mar_out:    out std_logic_vector(wl-1 downto 0)
  ) ;
end reg_MAR ; 

architecture arch of reg_MAR is
    signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(clk, mar_in, mar_ce, mar_arst)
    begin
        case (mar_arst) is 

            when '1' => 
                cuenta <= (others => '0');

            when others => 
                if (rising_edge(clk)) then
                    if (mar_ce = '1') then
                        cuenta <= mar_in
                    else
                        cuenta <= cuenta (others => '0');
                    end if ;
                end if ;
        end case;
    end process
    mar_out <= cuenta;
end architecture ;