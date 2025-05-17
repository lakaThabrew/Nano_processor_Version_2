----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 11:35:03 PM
-- Design Name: 
-- Module Name: Bitwise_NOT - Behavioral
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

entity Bitwise_NOT is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Bitwise_NOT;

architecture Behavioral of Bitwise_NOT is

begin
    Y <= NOT A;

end Behavioral;
