-- DecoA: decodificador BCD a 7 segmentos (activo bajo)
-- Segmentos: CA CB CC CD CE CF CG
library ieee;
use ieee.std_logic_1164.all;
entity DecoA is
    port(BCD : in  std_logic_vector(3 downto 0);
         SEG : out std_logic_vector(6 downto 0));
end DecoA;
architecture funcional of DecoA is
begin
    SEG <= "0000001" when BCD = "0000" else  -- 0
           "1001111" when BCD = "0001" else  -- 1
           "0010010" when BCD = "0010" else  -- 2
           "0000110" when BCD = "0011" else  -- 3
           "1001100" when BCD = "0100" else  -- 4
           "0100100" when BCD = "0101" else  -- 5
           "0100000" when BCD = "0110" else  -- 6
           "0001111" when BCD = "0111" else  -- 7
           "0000000" when BCD = "1000" else  -- 8
           "0000100" when BCD = "1001" else  -- 9
           "1111111";                         -- apagado
end funcional;