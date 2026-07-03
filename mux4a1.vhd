-- Multiplexor 4 a 1 de 4 bits - with-select-when
library ieee;
use ieee.std_logic_1164.all;
entity mux4a1 is
    port(X0, X1, X2, X3 : in  std_logic_vector(3 downto 0);
         SEL             : in  std_logic_vector(1 downto 0);
         Y               : out std_logic_vector(3 downto 0));
end mux4a1;
architecture funcional of mux4a1 is
begin
    with SEL select
        Y <= X0      when "00",
             X1      when "01",
             X2      when "10",
             X3      when "11",
             "0000"  when others;
end funcional;