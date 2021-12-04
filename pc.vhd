library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity reg_PC is
    generic(
        wl: integer:= 8
        );
  port (
    clk:        in std_logic;
    pc_arst:    in std_logic;
    pc_ce:      in std_logic;   
    pc_inc:     in std_logic;   
    pc_din:     in std_logic_vector (wl-1 downto 0);
    pc_dout:    out std_logic_vector (wl-1 downto 0)
  ) ;
end reg_PC ; 

architecture arch of reg_PC is
    signal cuenta: std_logic_vector(wl-1 downto 0);
    begin
        process(clk, pc_arst)
            begin 
            if (pc_arst='1') then 
                    --pc_dout <= (others => '0'); // se sustituye por var temporal
                    cuenta <= (others => '0');
                elsif (rising_edge(clk)) then
							if(pc_inc='1') then 
                        cuenta <= cuenta + '1';
							end if;
                if (pc_ce='1') then
                    cuenta <= pc_din;
                end if; 
            end if;
        end process;
        pc_dout <= cuenta;  
end architecture ;


