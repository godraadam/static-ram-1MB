library ieee;
use ieee.std_logic_1164.all;

entity submodule is
    port 
        ( address   : in std_logic_vector(16 downto 0)
        ; data      : inout std_logic_vector(15 downto 0)
        ; wr        : in std_logic
        ; sel_i     : in std_logic
        ; bhe       : in std_logic
        );
end entity;

architecture behavioral of submodule is
    signal cs_low, cs_high : std_logic;
begin
    m1 : entity work.memory64kx8bit port map(address(16 downto 1), cs_low, wr, data(7 downto 0));
    m2 : entity work.memory64kx8bit port map(address(16 downto 1), cs_high, wr, data(15 downto 8));
    cs_low <= sel_i and (not address(0));
    cs_high <= sel_i and bhe;
end behavioral;