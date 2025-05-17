----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 11:53:14 PM
-- Design Name: 
-- Module Name: right_shift_by2 - Behavioral
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

entity right_shift_by2 is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end right_shift_by2;

architecture Behavioral of right_shift_by2 is

begin
    Y <= "00" & A(3 downto 2);

end Behavioral;
