-- DivA: divisor de 50MHz a 1000 Hz
library ieee;
use ieee.std_logic_1164.all;
entity DivA is
    port(fe: in  std_logic;
         fs: out std_logic);
end DivA;
architecture funcional of DivA is
    signal cont  : integer := 0;
    signal pulso : std_logic := '0';
begin
    process(fe)
    begin
        if (fe'event and fe='1') then
            if cont = 25000 then -- Para simulación: 3
                cont  <= 1;
                pulso <= not pulso;
            else
                cont <= cont + 1;
            end if;
        end if;
    end process;
    fs <= pulso;
end funcional;
