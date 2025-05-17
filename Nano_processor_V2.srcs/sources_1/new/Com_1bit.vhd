----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 07:04:35 PM
-- Design Name: 
-- Module Name: Com_1bit - Behavioral
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

entity Com_1bit is
      Port (    A : in STD_LOGIC;
                B : in STD_LOGIC;
                En : in STD_LOGIC;
                equal : out STD_LOGIC;
                great : out STD_LOGIC;
                less : out STD_LOGIC);
end Com_1bit;

architecture Behavioral of Com_1bit is

begin
    equal <= (A XNOR B) AND EN;
    great <= (A AND (NOT B)) AND EN;
    less  <= ((NOT A) AND B) AND EN;

end Behavioral;
