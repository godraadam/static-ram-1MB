library ieee;
use ieee.std_logic_1164.all;

entity sram is
    port 
        ( address   : in std_logic_vector(23 downto 0)
        ; data      : inout std_logic_vector(15 downto 0)
        ; wr        : in std_logic
        ; rd        : in std_logic
        ; bhe       : in std_logic
        ; selmodule : out std_logic
        );
end entity;

architecture arch of sram is
    signal sel          : std_logic_vector(7 downto 0);
    signal e1, e2, e3   : std_logic;
begin

    s0 : entity work.submodule port map(address(16 downto 0), data, wr, sel(0), bhe);
    s1 : entity work.submodule port map(address(16 downto 0), data, wr, sel(1), bhe);
    s2 : entity work.submodule port map(address(16 downto 0), data, wr, sel(2), bhe);
    s3 : entity work.submodule port map(address(16 downto 0), data, wr, sel(3), bhe);
    s4 : entity work.submodule port map(address(16 downto 0), data, wr, sel(4), bhe);
    s5 : entity work.submodule port map(address(16 downto 0), data, wr, sel(5), bhe);
    s6 : entity work.submodule port map(address(16 downto 0), data, wr, sel(6), bhe);
    s7 : entity work.submodule port map(address(16 downto 0), data, wr, sel(7), bhe);

    dcd : entity work.decoder port map(address(19 downto 17), e1, e2, e3, sel);
    e1 <= not ((not address(20)) and (not address(21)) and address(22) and address(23));
    e2 <= rd and wr;
    e3 <= '1';
    selmodule <= e2 or e1;
end arch;