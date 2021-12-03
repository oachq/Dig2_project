library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity reg_ACC is
    generic(
        wl: integer:= 8
    );
  port (
    clk:        in std_logic;
    acc_in:     in std_logic_vector (wl-1 downto 0);
    acc_arst:   in std_logic;
    acc_ce:     in std_logic;
    acc_out:    in std_logic_vector (wl-1 downto 0)
  ) ;
end reg_ACC ; 

architecture arch of reg_ACC is
    signal cuenta: std_logic_vector(wl-1 downto 0);
begin
   process (clk, acc_arst)
        if (acc_arst = '1') then
         cuenta  <= (others => '0');
          elsif (rising_edge(clk)) then
              if (acc_ce = '1') then
                  cuenta <= acc_in;
              end if ;
        end if ;          
   end process;
   acc_out <= cuenta;
end architecture ;