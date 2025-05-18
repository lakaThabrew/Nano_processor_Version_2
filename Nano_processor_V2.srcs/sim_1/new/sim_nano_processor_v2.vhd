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
            Clk           : in  STD_LOGIC;
            Reset         : in  STD_LOGIC;
            Output        : out STD_LOGIC_VECTOR(3 downto 0);
            Flag_overflow : out STD_LOGIC;
            Flag_Zero     : out STD_LOGIC;
            Flag_C_out    : out STD_LOGIC;
            Flag_Sign     : out STD_LOGIC;
            Flag_Equal    : out STD_LOGIC;
            Flag_Greater  : out STD_LOGIC;
            Flag_Lesser   : out STD_LOGIC;
            AnodeSelector : out STD_LOGIC_VECTOR(3 downto 0);
            S_7Seg        : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    signal Clk           : STD_LOGIC := '0';
    signal Reset         : STD_LOGIC := '0';
    signal Output        : STD_LOGIC_VECTOR(3 downto 0);
    signal Flag_overflow : STD_LOGIC;
    signal Flag_Zero     : STD_LOGIC;
    signal Flag_C_out    : STD_LOGIC;
    signal Flag_Sign     : STD_LOGIC;
    signal Flag_Equal    : STD_LOGIC;
    signal Flag_Greater  : STD_LOGIC;
    signal Flag_Lesser   : STD_LOGIC;
    signal AnodeSelector : STD_LOGIC_VECTOR(3 downto 0);
    signal S_7Seg        : STD_LOGIC_VECTOR(6 downto 0);
    
begin
    UUT: Nano_processor_V2
        Port map (
            Clk           => Clk,
            Reset         => Reset,
            Output        => Output,
            Flag_overflow => Flag_overflow,
            Flag_Zero     => Flag_Zero,
            Flag_C_out    => Flag_C_out,
            Flag_Sign     => Flag_Sign,
            Flag_Equal    => Flag_Equal,
            Flag_Greater  => Flag_Greater,
            Flag_Lesser   => Flag_Lesser,
            AnodeSelector => AnodeSelector,
            S_7Seg        => S_7Seg
        );

    clk_process :process
    begin
        Clk <= '0';
        wait for 2 ns;
        Clk <= '1';
        wait for 2 ns;
    end process;

    process
        begin
            -- Initial Reset
            Reset <= '1';
            wait for 100 ns;
            Reset <= '0';
    
            wait;
    end process;


end Behavioral;
