-- DecoB: decodificador de anodos (1 de 4, activo bajo)
library ieee;
use ieee.std_logic_1164.all;
entity DecoB is
    port(SEL : in  std_logic_vector(1 downto 0);
         AN  : out std_logic_vector(3 downto 0));
end DecoB;
architecture funcional of DecoB is
begin
    AN <= "1110" when SEL = "00" else
          "1101" when SEL = "01" else
          "1011" when SEL = "10" else
          "0111" when SEL = "11" else
          "1111";
end funcional;