library ieee;
use ieee.std_logic_1164.all;
entity testbench is
end entity;

architecture arch of testbench is
    signal address      : std_logic_vector(23 downto 0);
    signal data         : std_logic_vector(15 downto 0) := (others => 'Z');
    signal wr, rd, bhe  : std_logic := '1';
    signal cs           : std_logic := '1';
    signal sel_module   : std_logic;
begin

    memory1 : entity work.sram port map(address, data, wr, rd, bhe, sel_module);

    process
    begin
        address <= x"C00000";
        bhe <= '1';
        wr <= '1';
        rd <= '0';
        data <= x"FEED";
        wait for 20ns;
        
        address <= x"C00002";
        data <= x"BEEF";  
        wait for 20 ns;
        
        address <= x"C00004";
        data <= x"FACE";
        wait for 20ns;
        
        address <= x"C00000";
        wr <= '0';
        rd <= '1';
        wait;

    end process;

end architecture;