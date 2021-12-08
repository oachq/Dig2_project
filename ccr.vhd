library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;
    
entity reg_CCR is
  port (
    clk:        in std_logic;
    ccr_in:    in std_logic_vector(1 downto 0); -- salida alu / entrada ccr
    ccr_ce:     in std_logic; 
    ccr_arst:   in std_logic;
    ccrC_out:   out std_logic;
    ccrZ_out:   out std_logic
  ) ;
end reg_CCR ; 

architecture arch of reg_CCR is
    signal flags : std_logic_vector(1 downto 0); 
    --signal ccrZ_temp : std_logic;
begin
    process (clk, ccr_ce, ccr_arst)
    begin
        if (crr_ce='1') then
            if (ccr_arst = '1') then
                if rising_edge(clk) then
                    flags <= ccr_in;
                    ccrC_out <= ccr_in(1);
                end if ;
            else
                flgas <= "00";
            end if ;
        end if ;
    end process;
    ccrC_out <= flags(1);
    ccrZ_out <= flags(0); 
end architecture ;