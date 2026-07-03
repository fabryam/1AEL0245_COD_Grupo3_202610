-- Contador decenas 0 a 3 - Maquina de Moore
library ieee;
use ieee.std_logic_1164.all;
entity cont_decenas is
    port(clk, R, P : in  std_logic;
         Q         : out std_logic_vector(1 downto 0));
end cont_decenas;
architecture funcional of cont_decenas is
    type estados is (E0, E1, E2, E3);
    signal EA, ES : estados;
begin
    -- Logica de estado siguiente
    process(EA)
    begin
        case EA is
            when E0     => ES <= E1;
            when E1     => ES <= E2;
            when E2     => ES <= E3;
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
            when E0     => Q <= "00";
            when E1     => Q <= "01";
            when E2     => Q <= "10";
            when others => Q <= "11";
        end case;
    end process;
end funcional;
