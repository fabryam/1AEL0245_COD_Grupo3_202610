-- Contador 0 a 12 - Maquina de Moore
library ieee;
use ieee.std_logic_1164.all;
entity cont_0a12 is
    port(clk, R, P : in  std_logic;
         Q_uni     : out std_logic_vector(3 downto 0);
         Q_dec     : out std_logic_vector(3 downto 0));
end cont_0a12;
architecture funcional of cont_0a12 is
    type estados is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,E10,E11,E12);
    signal EA, ES : estados;
begin
    -- Logica de estado siguiente
    process(EA)
    begin
        case EA is
            when E0     => ES <= E1;
            when E1     => ES <= E2;
            when E2     => ES <= E3;
            when E3     => ES <= E4;
            when E4     => ES <= E5;
            when E5     => ES <= E6;
            when E6     => ES <= E7;
            when E7     => ES <= E8;
            when E8     => ES <= E9;
            when E9     => ES <= E10;
            when E10    => ES <= E11;
            when E11    => ES <= E12;
            when others => ES <= E0;
        end case;
    end process;
    -- Memoria de estado
    process(clk, R)
    begin
        if R = '1' then
            EA <= E0;
        elsif (clk'event and clk = '0') then
            if P = '1' then
                EA <= ES;
            end if;
        end if;
    end process;
    -- Logica de salida
    process(EA)
    begin
        case EA is
            when E0     => Q_dec <= "0000"; Q_uni <= "0000";
            when E1     => Q_dec <= "0000"; Q_uni <= "0001";
            when E2     => Q_dec <= "0000"; Q_uni <= "0010";
            when E3     => Q_dec <= "0000"; Q_uni <= "0011";
            when E4     => Q_dec <= "0000"; Q_uni <= "0100";
            when E5     => Q_dec <= "0000"; Q_uni <= "0101";
            when E6     => Q_dec <= "0000"; Q_uni <= "0110";
            when E7     => Q_dec <= "0000"; Q_uni <= "0111";
            when E8     => Q_dec <= "0000"; Q_uni <= "1000";
            when E9     => Q_dec <= "0000"; Q_uni <= "1001";
            when E10    => Q_dec <= "0001"; Q_uni <= "0000";
            when E11    => Q_dec <= "0001"; Q_uni <= "0001";
            when others => Q_dec <= "0001"; Q_uni <= "0010";
        end case;
    end process;
end funcional;
