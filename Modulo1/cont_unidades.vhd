-- Contador unidades 0 a 9 - Maquina de Moore
library ieee;
use ieee.std_logic_1164.all;

entity cont_unidades is
    port(clk, R, P : in  std_logic;
         Q         : out std_logic_vector(3 downto 0);
         carry     : out std_logic);
end cont_unidades;

architecture funcional of cont_unidades is
    type estados is (E0,E1,E2,E3,E4,E5,E6,E7,E8,E9);
    signal EA, ES : estados;
begin
    -- Logica de estado siguiente
    process(EA)
    begin
		case EA is
			when E0 => ES <= E1;
         when E1 => ES <= E2;
         when E2 => ES <= E3;
         when E3 => ES <= E4;
         when E4 => ES <= E5;
         when E5 => ES <= E6;
         when E6 => ES <= E7;
         when E7 => ES <= E8;
         when E8 => ES <= E9;
         when others => ES <= E0;
		end case;
    end process;

    -- Memoria de estado
    process(clk, R)
    begin
	     if R='1' then
				EA <= E0;
        elsif (clk'event and clk='0') then
				if P='1' then
					EA <= ES;
				end if;
        end if;
    end process;

    -- Logica de salida
    process(EA)
    begin
        case EA is
            when E0 => Q <= "0000"; carry <= '0';
            when E1 => Q <= "0001"; carry <= '0';
            when E2 => Q <= "0010"; carry <= '0';
            when E3 => Q <= "0011"; carry <= '0';
            when E4 => Q <= "0100"; carry <= '0';
            when E5 => Q <= "0101"; carry <= '0';
            when E6 => Q <= "0110"; carry <= '0';
            when E7 => Q <= "0111"; carry <= '0';
            when E8 => Q <= "1000"; carry <= '0';
            when others => Q <= "1001"; carry <= '1';
        end case;
    end process;
end funcional;
