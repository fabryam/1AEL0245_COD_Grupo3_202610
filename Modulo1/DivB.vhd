-- DivB: divisor de F2 a F1=1Hz
library ieee;
use ieee.std_logic_1164.all;
entity DivB is
    port(fe: in std_logic;
         fs: out std_logic);
end DivB;
architecture funcional of DivB is
    signal cont: integer :=0;
    signal pulso: std_logic :='0';
begin
    process(fe, cont, pulso)
    begin
        if (fe'event and fe='1') then
            if cont = 500 then -- Para simulación: 5
                cont  <= 1;
                pulso <= not pulso;
            else
                cont <= cont + 1;
            end if;
        end if;
    end process;
    fs <= pulso;
end funcional;
