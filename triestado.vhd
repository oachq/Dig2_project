library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity Triestado is
    generic (
        wl: integer:= 8
    );
  port (
    bus_in:     in std_logic_vector (wl-1 downto 0);
    rw_ce:      in std_logic
    bus_out:    in std_logic_vector (wl-1 downto 0)
  ) ;
end Triestado ; 

architecture arch of Triestado is
    signal cuenta: std_logic_vector (wl-1 downto 0);
begin
    process(bus_in,rw_ce)
    begin
        case( rw_ce ) is
        
            when '0' =>
                cuenta <= bus_in;
        
            when others =>
                cuenta <= cuenta (others => '0');
        end case ;
    end process;
    bus_out <= cuenta;    
end architecture ;