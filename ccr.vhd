library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;
    
entity reg_CCR is
  port (
    clk:        in std_logic;
    ccrC_in:    in std_logic;
    ccrZ_in:    in std_logic;
    ccr_ce:     in std_logic; 
    ccr_arst:   in std_logic;
    ccrC_out:   out std_logic;
    ccrZ_out:   out std_logic
  ) ;
end reg_CCR ; 

architecture arch of reg_CCR is
    signal ccrC_temp : std_logic; 
    signal ccrZ_temp : std_logic;
begin
    process (clk, ccr_ce, ccr_arst)
    begin
        case( ccr_ce ) is
            when '1' =>
            if (ccr_arst='1') then
                if (rising_edge(clk)) then
                        ccrC_temp <= ccrC_in;
                        ccrZ_temp <= ccrZ_in;
                end if ;
            end if ;
            when others =>
            ccrC_temp <= '0';
            ccrZ_temp <= '0';
        end case ;
    end process;
     ccrC_out <= ccrC_temp;
     ccrZ_out <= ccrZ_temp;             
end architecture ;