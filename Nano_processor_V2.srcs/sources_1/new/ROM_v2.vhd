----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 11:21:09 AM
-- Design Name: 
-- Module Name: ROM_v2 - Behavioral
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_v2 is
      Port ( Memory_Sel: in STD_LOGIC_VECTOR(3 downto 0);
             Instruction_bus: out STD_LOGIC_VECTOR(13 downto 0));
end ROM_v2;

architecture Behavioral of ROM_v2 is

    type rom_type is array(0 to 15) of STD_LOGIC_VECTOR(13 downto 0);
    signal proc_ROM : rom_type := ( 
                "00100010000100", -- MOVI R1,4        R1 <- 4             0
                "00100100000001", -- MOVI R2,1        R2 <- 1             1
                "00010100000000", -- NEG  R2          R2 <- -1            2
                "00000010100010", -- ADD  R1,R2       R1 <- R2 + R1       3
                "00110010000111", -- JZR  R1,7  00110010000111                          4
                "00001110010010", -- ADD  R7,R1       R7 <- R7 + R1       5
                "00110000000011", -- JZR  R0,3                            6
                "00110000000111", -- JZR  R0,7                             7
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000" -- NOP
                    );
begin

    Instruction_bus <= proc_ROM(to_integer(unsigned(Memory_Sel)));

end Behavioral;
