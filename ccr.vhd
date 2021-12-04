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
    signal ccrC_temp, ccrZ_temp : std_logic;
begin
    process (clk, ccrC_in, ccrZ_in, ccr_ce, ccr_arst)
    begin
        case( ccr_arst ) is
            
            when '1' =>
                ccrC_temp <= '0';
                ccrZ_temp <= '0';
        
            when others =>
                if (rising_edge(clk)) then
                    if (ccr_ce = '1') then
                        ccrC_temp <= ccrC_in;
                        ccrZ_temp <= ccrZ_in;
                    else
                        ccrC_temp <= '0';
                        ccrZ_temp <= '0';
                    end if ;
                end if ;
        end case ;
    end process;
     ccrC_out <= ccrC_temp;
     ccrZ_out <= ccrZ_temp;             
end architecture ;