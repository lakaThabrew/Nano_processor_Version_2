----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 09:13:33 PM
-- Design Name: 
-- Module Name: sim_Com_4bit - Behavioral
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

entity sim_Com_4bit is
--  Port ( );
end sim_Com_4bit;

architecture Behavioral of sim_Com_4bit is

    component Comp_4bit
        port(   A : in STD_LOGIC_VECTOR(3 downto 0);
                B : in STD_LOGIC_VECTOR(3 downto 0);
                Enable: in STD_LOGIC;
                equal : out STD_LOGIC;
                greater : out STD_LOGIC;
                lesser : out STD_LOGIC );
    end component;
    
    signal A, B       : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
        signal Enable     : STD_LOGIC := '0';
        signal equal      : STD_LOGIC;
        signal greater    : STD_LOGIC;
        signal lesser     : STD_LOGIC;
    
    begin
        UUT: Comp_4bit
            Port map (
                A       => A,
                B       => B,
                Enable  => Enable,
                equal   => equal,
                greater => greater,
                lesser  => lesser
            );
   
    process
        begin
            -- Test 1: A = B
            A <= "1010"; B <= "1010"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 2: A > B
            A <= "1100"; B <= "1011"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 3: A < B
            A <= "0111"; B <= "1000"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 4: A = B = 0000
            A <= "0000"; B <= "0000"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 5: A = 1111, B = 0000
            A <= "1111"; B <= "0000"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 6: A = 0000, B = 1111
            A <= "0000"; B <= "1111"; Enable <= '1';
            wait for 100 ns;
    
            -- Test 7: Disable comparator
            A <= "1010"; B <= "1010"; Enable <= '0';
            wait for 100 ns;
    
            -- End of test
            wait;
        end process;


end Behavioral;
