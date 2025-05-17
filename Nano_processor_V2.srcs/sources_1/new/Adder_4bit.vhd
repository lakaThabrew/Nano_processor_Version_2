----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 12:59:09 PM
-- Design Name: 
-- Module Name: Adder_4bit - Behavioral
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

entity Adder_4bit is
  Port (   input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC );
end Adder_4bit;

architecture Behavioral of Adder_4bit is
    component RCA_4
        port ( A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               A2 : in STD_LOGIC;
               A3 : in STD_LOGIC;
               B0 : in STD_LOGIC;
               B1 : in STD_LOGIC;
               B2 : in STD_LOGIC;
               B3 : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S0 : out STD_LOGIC;
               S1 : out STD_LOGIC;
               S2 : out STD_LOGIC;
               S3 : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;
    
begin
    RCA_0 : RCA_4
        port map(  A0 => input(0),
                   A1 => input(1),
                   A2 => input(2),
                   A3 => input(3),
                   B0 => '1',
                   B1 => '0',
                   B2 => '0',
                   B3 => '0',
                   C_in => '0',
                   S0 => output(0),
                   S1 => output(1),
                   S2 => output(2),
                   S3 => output(3),
                   C_out => C_out);

end Behavioral;
