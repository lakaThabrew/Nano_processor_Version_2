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
                "00100010000001", -- MOVI R1,1         ; R1 <- 1
                "00100100000101", -- MOVI R2,5         ; R2 <- 5
                "00101000000000", -- MOVI R3,0         ; R3 <- 0
                "00101100000001", -- MOVI R4,1         ; R4 <- 1
                "00000011001000", -- ADD  R3,R1        ; R3 <- R3 + R1
                "00000010011000", -- ADD  R1,R4        ; R1 <- R1 + 1
                "00000100100000", -- COMP R1,R2        ; Set zero flag if R1 = R2
                "00110010001111", -- JZR  R1,15        ; If R1 == R2 ? jump to line 15 (end)
                "00110000000100", -- JZR  R0,4         ; Unconditional jump to ADD loop (line 4)
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000", -- NOP
                "00000000000000"  -- HALT / NOP
                    );
begin

    Instruction_bus <= proc_ROM(to_integer(unsigned(Memory_Sel)));

end Behavioral;
