library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity MUX_3 is
  generic(
      wl: integer:= 8
  )
  port (
    mux3_in01:   in std_logic_vector(wl-1 downto 0); --entradas Dlec, Acc
    mux3_in23:   in std_logic_vector(wl-1 downto 0); --entradas pcH, pcL
    mux3_ce:   in std_logic
    mux3_out:  out std_logic_vector(wl-1 downto 0)
  ) ;
end MUX_3 ; 

architecture arch of MUX_3 is
  signal cuenta: std_logic_vector(wl-1 downto 0);
begin
  process(mux_ce, mux3_in01, mux3_in23)
  begin
    case( mux3_ce ) is
    
      when '0' =>
        cuenta <= mux3_in01;
    
      when others =>
        cuenta <= mux3_in23;
    end case ;
  end process;
  mux3_out <= cuenta;  
end architecture ;