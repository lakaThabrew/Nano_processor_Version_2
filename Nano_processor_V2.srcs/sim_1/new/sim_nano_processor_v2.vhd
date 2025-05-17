----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 06:27:09 PM
-- Design Name: 
-- Module Name: sim_nano_processor_v2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_nano_processor_v2 is
--  Port ( );
end sim_nano_processor_v2;

architecture Behavioral of sim_nano_processor_v2 is

    component Nano_processor_V2
        Port (
            Slow_Clk     : in  STD_LOGIC;
            Reset        : in  STD_LOGIC;
            Seven_Seg    : out STD_LOGIC_VECTOR(6 downto 0);
            Seven_Enable : out STD_LOGIC_VECTOR(3 downto 0);
            Output       : out STD_LOGIC_VECTOR(3 downto 0);
            Flag_Greater : out STD_LOGIC;
            Flag_Lesser  : out STD_LOGIC
        );
    end component;

    signal Slow_Clk     : STD_LOGIC := '0';
    signal Reset        : STD_LOGIC := '0';
    signal Seven_Seg    : STD_LOGIC_VECTOR(6 downto 0);
    signal Seven_Enable : STD_LOGIC_VECTOR(3 downto 0);
    signal Output       : STD_LOGIC_VECTOR(3 downto 0);
    signal Flag_Greater : STD_LOGIC;
    signal Flag_Lesser  : STD_LOGIC;
    
begin
    UUT: Nano_processor_V2
        port map (
            Slow_Clk     => Slow_Clk,
            Reset        => Reset,
            Seven_Seg    => Seven_Seg,
            Seven_Enable => Seven_Enable,
            Output       => Output,
            Flag_Greater => Flag_Greater,
            Flag_Lesser  => Flag_Lesser
        );

    clk_process :process
    begin
        Slow_Clk <= '1';
        wait for 2 ns;
        Slow_Clk <= '0';
        wait for 2 ns;
    end process;

    process
        begin
            -- Initial Reset
            Reset <= '1';
            wait for 200 ns;
            Reset <= '0';
    
            -- Let processor run for some time
            wait for 300 ns;
    
            -- Re-assert reset if needed
            Reset <= '1';
            wait for 100 ns;
            Reset <= '0';
    
            wait;
    end process;


end Behavioral;
