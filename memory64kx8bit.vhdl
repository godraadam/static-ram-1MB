library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity memory64kx8bit is
    port
        ( address   : in std_logic_vector(15 downto 0)
        ; cs        : in std_logic
        ; wr        : in std_logic
        ; data      : inout std_logic_vector(7 downto 0)
        );
end entity;

architecture arch of memory64kx8bit is
    type ram_type is array (0 to 2 ** 16 - 1) of std_logic_vector (7 downto 0); --64k * 8bit
    signal ram : ram_type := 
        ( x"DE"
        , x"CA"
        , x"FC"
        , x"0F"
        , x"FE"
        , x"E1"
        , x"5B"
        , x"AD"
        , others => x"AC"
        );
begin

    process (cs, wr, ram, address, data)
    begin
        if (cs = '1') then
            if (wr = '1') then
                ram(conv_integer(address)) <= data;
            else
                data <= ram(conv_integer(address));
            end if;
        else
            data <= (others => 'Z');
        end if;
    end process;
end architecture;