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
            Memory_Sel     : in  STD_LOGIC_VECTOR(3 downto 0);
            Instruction_bus: out STD_LOGIC_VECTOR(13 downto 0)
        );
    end component;

    signal Memory_Sel     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Instruction_bus: STD_LOGIC_VECTOR(13 downto 0);

begin
    UUT: ROM_v2
        Port Map (
            Memory_Sel      => Memory_Sel,
            Instruction_bus => Instruction_bus
        );
    process 
        begin
                Memory_Sel <= "0000"; wait for 50 ns;
                Memory_Sel <= "0001"; wait for 50 ns;
                Memory_Sel <= "0010"; wait for 50 ns;
                Memory_Sel <= "0011"; wait for 50 ns;
                Memory_Sel <= "0100"; wait for 50 ns;
                Memory_Sel <= "0101"; wait for 50 ns;
                Memory_Sel <= "0110"; wait for 50 ns;
                Memory_Sel <= "0111"; wait for 50 ns;
                Memory_Sel <= "0000"; wait for 50 ns;
                Memory_Sel <= "0001"; wait for 50 ns;
                Memory_Sel <= "1010"; wait for 50 ns;
                Memory_Sel <= "1011"; wait for 50 ns;
                Memory_Sel <= "1100"; wait for 50 ns;
                Memory_Sel <= "1101"; wait for 50 ns;
                Memory_Sel <= "1110"; wait for 50 ns;
                Memory_Sel <= "1111"; wait for 50 ns;
        
                wait; -- Stop simulation
            end process;


end Behavioral;
