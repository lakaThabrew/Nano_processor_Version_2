----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 12:53:40 PM
-- Design Name: 
-- Module Name: Program_counter_v2 - Behavioral
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

entity Program_counter_v2 is
      Port (    input : in STD_LOGIC_VECTOR(3 downto 0);
                output: out STD_LOGIC_VECTOR(3 downto 0);
                Clk: in STD_LOGIC;
                Reset: in STD_LOGIC );
end Program_counter_v2;

architecture Behavioral of Program_counter_v2 is

    component D_FF
        port (  D : in STD_LOGIC;
                Res : in STD_LOGIC;
                Clk : in STD_LOGIC;
                Q : out STD_LOGIC;
                Qbar : out STD_LOGIC);
    end component;
    
    
begin
    D_FF_0 : D_FF
        port map(
            D => input(0),
            Res => Reset,
            Clk => Clk,
            Q => output(0)
        );            

    D_FF_1 : D_FF
        port map(
            D => input(1),
            Res => Reset,
            Clk => Clk,
            Q => output(1)
        );
         
    D_FF_2 : D_FF
       port map(
            D => input(2),
            Res => Reset,
            Clk => Clk,
            Q => output(2)
        );
        
    D_FF_3 : D_FF
        port map(
            D => input(3),
            Res => Reset,
            Clk => Clk,
            Q => output(3)
                );

end Behavioral;
