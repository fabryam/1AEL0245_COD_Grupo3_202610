-- Contador MODB modulo 4 - Maquina de Moore
library ieee;
use ieee.std_logic_1164.all;
entity MODB is
    port(clk, R: in  std_logic;
         Q     : out std_logic_vector(1 downto 0));
end MODB;
architecture estructural of MODB is
    type estados is (E0, E1, E2, E3);
    signal EA, ES: estados;
begin
    -- Logica de estado siguiente
    process(EA, R)
    begin
        if R='1' then
            ES <= E0;
        else
            case EA is
                when E0     => ES <= E1;
                when E1     => ES <= E2;
                when E2     => ES <= E3;
                when others => ES <= E0;
            end case;
        end if;
    end process;
    -- Memoria de estado
    process(clk)
    begin
        if (clk'event and clk='0') then
            EA <= ES;
        end if;
    end process;
    -- Logica de salida
    process(EA)
    begin
        case EA is
            when E0     => Q <= "00";
            when E1     => Q <= "01";
            when E2     => Q <= "10";
            when others => Q <= "11";
        end case;
    end process;
end estructural;
