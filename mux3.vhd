library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity MUX_3 is
  generic(
      wl: integer:= 4
  );
  port (
    mux3_in0:   in std_logic_vector(wl-1 downto 0);   
    mux3_in1:   in std_logic_vector(wl-1 downto 0);   
    mux3_in2:   in std_logic_vector(wl-1 downto 0);   
    mux3_in3:   in std_logic_vector(wl-1 downto 0);   
    mux3_s:    in std_logic_vector(1 downto 0);
    mux3_out:  out std_logic_vector(wl-1 downto 0)
  ) ;
end MUX_3 ; 

architecture arch of MUX_3 is
  signal cuenta: std_logic_vector(wl-1 downto 0);
begin
  process(mux3_s, mux3_in0, mux3_in1, mux3_in2, mux3_in3)
  begin
    case( mux3_s ) is
    
      when '00' => -- ACC
        cuenta <= mux3_in0;
      
      when '01' => -- Dlec
        cuenta <= mux3_in1;
    
      when '10' => -- PCL
        cuenta <= mux3_in2;

      when others => --PCH
        cuenta <= mux3_in3;
    end case ;
  end process;
  mux3_out <= cuenta;  
end architecture ;