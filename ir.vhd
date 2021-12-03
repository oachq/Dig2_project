library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity reg_IR is
    generic (
        wl: integer:= 4
    );
  port (
  	clk:        in std_logic;
    ir_in:      in std_logic_vector (wl-1 downto 0);
  	ir_ce:      in std_logic; --verificar sobre el eneble 
  	ir_arst:    in std_logic;
  	ir_out:     out std_logic_vector (wl-1 downto 0)
  ) ;
end reg_IR ; 

architecture arch of reg_IR is
    signal cuenta: std_logic_vector(wl-1 downto 0);
begin
    process(ir_ce, clk, ir_arst)
    begin
        if (ir_ce = '1') then
            if(ir_arst = '1') then 
                if(rising_edge(clk)) then 
                    cuenta <= ir_in;
                end if;
            else
                cuenta <= (others => '0');
            end if;   
        end if ; 
    end process;    
    ir_out <= cuenta;       
end architecture ;