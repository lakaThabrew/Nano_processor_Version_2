----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 05:48:25 PM
-- Design Name: 
-- Module Name: Sim_multiply - Behavioral
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

entity Sim_multiply is
--  Port ( );
end Sim_multiply;

architecture Behavioral of Sim_multiply is
    component Multiplier_2 is
    
        Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
               B : in STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal A_tb : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal B_tb : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal Y_tb : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    UUT: Multiplier_2 port map (
        A => A_tb,
        B => B_tb,
        Y => Y_tb
    );
    
    process
        begin
            A_tb <= "00";
            B_tb <= "00";
            wait for 100ns;
            
            A_tb <= "11";
            B_tb <= "10";
            wait for 100ns;
            
             A_tb <= "11";
             B_tb <= "01";
             wait for 100ns;
             
             A_tb <= "11";
             B_tb <= "11";
             wait for 100ns;
             wait;
    end process;
end Behavioral;
