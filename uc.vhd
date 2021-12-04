library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;

entity UC is
    generic (
        wl_Q:   integer:= 4
        wl_T:   integer:= 4
        wl_Xs:  integer:= 20
    );
  port (
    q_in:   in  std_logic_vector(wl_Q-1 downto 0);
    t_in:   in  std_logic_vector(wl_T-1 downto 0);
    c_in:   in  std_logic;
    z_in:   in  std_logic;
    Xs_out: out std_logic_vector(wl_Xs-1 downto 0)
  ) ;
end UC ; 
--:= (others => '0' )
architecture arch of UC is

    signal control : std_logic_vector(7 downto 0)  -- control de entradas
    signal xs: std_logic_vector(wl_Xs downto 0); -- array salida xs
    signal flags: std_logic_vector(1 downto 0);-- entradas banderas
begin
    
    control <= q_in & t_in; -- concatenando entradas q y t

    process (control, flags )
    begin
        
        case( control ) is
        -- inicio mov A, N
            when ("00000000") => -- 0
                xs(8) <= '1';
                xs <= (others => '0');  -- checar logica de una sola linea para el array xs
               
            when ("00000001") => -- 1
                xs(2) <= '1';
                xs(6) <= '1';
                xs <= (others => '0');

            when ("00000010") => -- 2
                xs(0) <= '1', (others => '0'); 
            
            when ("00000011") => --3
                xs(8) <= '1', (others => '0'); 
            
            when ("00000100") => --4
                xs(2) <= '1';
                xs(6) <= '1';
                xs <= (others => '0'); 
            
            when ("00000100") => --5
                xs(15) <= '1';
                xs(16) <= '1';
                xs(17) <= '1';
                xs(19) <= '1';
                xs <= (others => '0');    
                
            when ("00000100") => --6
                xs(14) <= '1';
                xs <= (others => '0');

            when others =>
        control <= others => 'z';
        end case ;
        -- Fin mov A, N
end architecture ;


