----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 07:10:31 PM
-- Design Name: 
-- Module Name: sim_Comp_1bit - Behavioral
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

entity sim_Comp_1bit is
--  Port ( );
end sim_Comp_1bit;

architecture Behavioral of sim_Comp_1bit is
    component Com_1bit
        Port ( 
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            En    : in  STD_LOGIC;
            equal : out STD_LOGIC;
            great : out STD_LOGIC;
            less  : out STD_LOGIC
        );
    end component;

    signal A     : STD_LOGIC := '0';
    signal B     : STD_LOGIC := '0';
    signal En    : STD_LOGIC := '0';
    signal equal : STD_LOGIC;
    signal great : STD_LOGIC;
    signal less  : STD_LOGIC;

begin
    UUT: Com_1bit
        Port Map (
            A     => A,
            B     => B,
            En    => En,
            equal => equal,
            great => great,
            less  => less
        );


    process
        begin
            A <= '0'; B <= '0'; En <= '0'; wait for 100 ns;
            A <= '0'; B <= '0'; En <= '1'; wait for 100 ns;
            A <= '0'; B <= '1'; En <= '0'; wait for 100 ns;
            A <= '0'; B <= '1'; En <= '1'; wait for 100 ns;
            A <= '1'; B <= '0'; En <= '0'; wait for 100 ns;
            A <= '1'; B <= '0'; En <= '1'; wait for 100 ns;
            A <= '1'; B <= '1'; En <= '0'; wait for 100 ns;
            A <= '1'; B <= '1'; En <= '1'; wait for 100 ns;
    
            wait;
    end process;
end Behavioral;
