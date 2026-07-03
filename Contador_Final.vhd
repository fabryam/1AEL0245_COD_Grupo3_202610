-- Top Level: interconexion del circuito completo
library ieee;
use ieee.std_logic_1164.all;
entity Contador_Final is
    port(clk50 : in  std_logic;
         R     : in  std_logic;
         P     : in  std_logic;
         SEG   : out std_logic_vector(6 downto 0);
         AN    : out std_logic_vector(3 downto 0));
end Contador_Final;
architecture estructural of Contador_Final is

    -- Senales internas
    signal F1           : std_logic;
    signal F2           : std_logic;
    signal Q_uni1       : std_logic_vector(3 downto 0);
    signal Q_dec1_2bits : std_logic_vector(1 downto 0);
    signal Q_dec1       : std_logic_vector(3 downto 0);
    signal Q_uni2       : std_logic_vector(3 downto 0);
    signal Q_dec2       : std_logic_vector(3 downto 0);
    signal SEL_mux      : std_logic_vector(1 downto 0);
    signal MUX_out      : std_logic_vector(3 downto 0);

    -- Declaracion de componentes
    component DivA
        port(fe : in  std_logic;
             fs : out std_logic);
    end component;

    component DivB
        port(fe : in  std_logic;
             fs : out std_logic);
    end component;

    component etapa1
        port(clk, R, P : in  std_logic;
             Q_uni     : out std_logic_vector(3 downto 0);
             Q_dec     : out std_logic_vector(1 downto 0));
    end component;

    component cont_0a12
        port(clk, R, P : in  std_logic;
             Q_uni     : out std_logic_vector(3 downto 0);
             Q_dec     : out std_logic_vector(3 downto 0));
    end component;

    component MODB
        port(clk, R : in  std_logic;
             Q      : out std_logic_vector(1 downto 0));
    end component;

    component mux4a1
        port(X0, X1, X2, X3 : in  std_logic_vector(3 downto 0);
             SEL             : in  std_logic_vector(1 downto 0);
             Y               : out std_logic_vector(3 downto 0));
    end component;

    component DecoA
        port(BCD : in  std_logic_vector(3 downto 0);
             SEG : out std_logic_vector(6 downto 0));
    end component;

    component DecoB
        port(SEL : in  std_logic_vector(1 downto 0);
             AN  : out std_logic_vector(3 downto 0));
    end component;

begin
    -- Extension de bits: Q_dec1 de 2 a 4 bits
    Q_dec1 <= "00" & Q_dec1_2bits;

    -- Instancias
    U_DivA: DivA
        port map(fe => clk50,
                 fs => F2);

    U_DivB: DivB
        port map(fe => F2,
                 fs => F1);

    U_E1: etapa1
        port map(clk   => F1,
                 R     => R,
                 P     => P,
                 Q_uni => Q_uni1,
                 Q_dec => Q_dec1_2bits);

    U_E2: cont_0a12
        port map(clk   => F1,
                 R     => R,
                 P     => P,
                 Q_uni => Q_uni2,
                 Q_dec => Q_dec2);

    U_MODB: MODB
        port map(clk => F2,
                 R   => R,
                 Q   => SEL_mux);

    U_MUX: mux4a1
        port map(X0  => Q_uni1,
                 X1  => Q_dec1,
                 X2  => Q_uni2,
                 X3  => Q_dec2,
                 SEL => SEL_mux,
                 Y   => MUX_out);

    U_DecoA: DecoA
        port map(BCD => MUX_out,
                 SEG => SEG);

    U_DecoB: DecoB
        port map(SEL => SEL_mux,
                 AN  => AN);
end estructural;