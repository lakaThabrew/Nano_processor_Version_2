----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 01:08:40 PM
-- Design Name: 
-- Module Name: Sim_ROM_v2 - Behavioral
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

entity Sim_ROM_v2 is
--  Port ( );
end Sim_ROM_v2;

architecture Behavioral of Sim_ROM_v2 is

    component ROM_v2
        Port (
            Memory_Sel     : in  STD_LOGIC_VECTOR(4 downto 0);
            Instruction_bus: out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component;

    signal Memory_Sel     : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal Instruction_bus: STD_LOGIC_VECTOR(13 downto 0);

begin
    UUT: ROM_v2
        Port Map (
            Memory_Sel      => Memory_Sel,
            Instruction_bus => Instruction_bus
        );
    process 
        begin
                Memory_Sel <= "00000"; wait for 50 ns;
                Memory_Sel <= "00001"; wait for 50 ns;
                Memory_Sel <= "00010"; wait for 50 ns;
                Memory_Sel <= "00011"; wait for 50 ns;
                Memory_Sel <= "00100"; wait for 50 ns;
                Memory_Sel <= "00101"; wait for 50 ns;
                Memory_Sel <= "00110"; wait for 50 ns;
                Memory_Sel <= "00111"; wait for 50 ns;
                Memory_Sel <= "01000"; wait for 50 ns;
                Memory_Sel <= "01001"; wait for 50 ns;
                Memory_Sel <= "01010"; wait for 50 ns;
                Memory_Sel <= "01011"; wait for 50 ns;
                Memory_Sel <= "01100"; wait for 50 ns;
                Memory_Sel <= "01101"; wait for 50 ns;
                Memory_Sel <= "01110"; wait for 50 ns;
                Memory_Sel <= "01111"; wait for 50 ns;
        
                wait; -- Stop simulation
            end process;


end Behavioral;
