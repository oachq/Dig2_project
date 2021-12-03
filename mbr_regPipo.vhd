-- mbr 
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity reg_pipo is
    generic(
        wl: integer:= 8
        );
  port (
    clk:        in std_logic;
    reg_arst:   in std_logic;
    reg_ce:     in std_logic;
    reg_in:    in std_logic_vector(wl-1 downto 0);
    reg_out    out std_logic_vector(wl-1 downto 0)
  );
end reg_pipo ; 

architecture arch of reg_pipo is
    signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(clk, reg_arst)
    begin 
        if (reg_arst='1') then
           cuenta <= (others => '0');
           elsif rising_edge(clk) then 
                if (reg_ce = '1') then
                    cuenta <= reg_in;
                end if ;
        end if ;
    end process; 
    reg_out <= cuenta;   
end architecture ;