library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity MUX_1_2 is
  generic(
    wl: integer:= 8
  );
  port (
    mux2_in0:   in std_logic_vector(wl-1 downto 0);
    mux2_in1:   in std_logic_vector(wl-1 downto 0);    
    mux2_S0:    in std_logic;
    mux2_out:   out std_logic_vector(wl-1 downto 0)
  ) ;
end MUX_1_2 ; 

architecture arch of MUX_1_2 is
  signal cuenta: std_logic_vector(wl-1 downto 0);
begin
  process(mux2_in0, mux2_in1, mux2_S0)
  begin
    case( mux_s0  ) is
      
      when '0' =>
        cuenta <= mux2_in0;
    
      when others =>
        cuenta <= mux2_in1;
    end case ;
  end process;
  mux2_out <= cuenta;    
end architecture ;