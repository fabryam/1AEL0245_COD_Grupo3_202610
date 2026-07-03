-- Etapa 1: cont_uni + cont_decenas
library ieee;
use ieee.std_logic_1164.all;
entity etapa1 is
    port(clk, R, P : in  std_logic;
         Q_uni     : out std_logic_vector(3 downto 0);
         Q_dec     : out std_logic_vector(1 downto 0));
end etapa1;
architecture estructural of etapa1 is

    signal Q_uni_int : std_logic_vector(3 downto 0);

    component cont_unidades
        port(clk, R, P : in  std_logic;
             Q         : out std_logic_vector(3 downto 0));
    end component;

    component cont_decenas
        port(clk, R, P : in  std_logic;
             Q         : out std_logic_vector(1 downto 0));
    end component;

begin
    -- Instancia del contador de unidades
    U_uni: cont_unidades
        port map(clk => clk,
                 R   => R,
                 P   => P,
                 Q   => Q_uni_int);

    -- Instancia del contador de decenas
    U_dec: cont_decenas
        port map(clk => Q_uni_int(3),
                 R   => R,
                 P   => P,
                 Q   => Q_dec);

    Q_uni <= Q_uni_int;

end estructural;