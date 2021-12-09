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
    --signal flags : std_logic_vector(1 downto 0); 
   
begin
    process (clk)
    begin
        if (resing_edge(clk)) then
            if (ccr_arst = '1') then
                if (ccr_ce = '1') then
                ccrC_out <= '0';
                ccrZ_out <= '0';
                end if ;
            else
            ccrC_out <= ccr_in(1);
            ccrZ_out <= ccr_in(0);
            end if ;
        end if ;

    end process;
end architecture ;