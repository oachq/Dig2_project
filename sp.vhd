library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;


entity reg_SP is
    generic(
        generic wl:integer:=8
    );
  port (
    clk:        in std_logic;
    sp_arst:    in std_logic;
    sp_ce:      in std_logic;
    sp_inc:     in std_logic;
    sp_dec:     in std_logic;
    sp_din:     in std_logic_vector (wl-1 downto 0);
    sp_dout:    out std_logic_vector((wl-1 downto 0);
  ) ;
end reg_SP ; 

architecture arch of reg_SP is
signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(clk, sp_arst);
        if (sp_arst='1') then
            cuenta <= (others => '0');
            elsif rising_edge(clk) then
                if (sp_inc='1') then
                    cuenta <= cuenta + '1';
                end if ;
                if (sp_dec='1') then
                    cuenta <= - '1';
                end if ;
                if (sp_ce = '1') then
                    cuenta <= sp_din;
                end if ;
        end if ;
    end process;
    sp_dout <= cuenta;                 
end architecture ;