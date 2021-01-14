library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decoder is
    port 
        ( a             : in std_logic_vector(2 downto 0)
        ; e1, e2, e3    : in std_logic
        ; o             : out std_logic_vector(7 downto 0)
        );
end decoder;

architecture arch of decoder is

begin

    process (a, e1, e2, e3)
    begin
        if (e1 = '0' and e2 = '0' and e3 = '1') then
            o <= (conv_integer(a) => '1', --set active output to 0
                others => '0'); --other outputs set to 1
        else
            o <= (others => '0'); --select neiher
        end if;
    end process;
end architecture;