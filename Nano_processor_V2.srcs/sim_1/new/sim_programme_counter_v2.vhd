----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 05:54:03 PM
-- Design Name: 
-- Module Name: sim_programme_counter_v2 - Behavioral
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

entity sim_programme_counter_v2 is
--  Port ( );
end sim_programme_counter_v2;

architecture Behavioral of sim_programme_counter_v2 is

    component Program_counter_v2 is
        Port ( input : in STD_LOGIC_VECTOR(3 downto 0);
               output: out STD_LOGIC_VECTOR(3 downto 0);
               Clk: in STD_LOGIC;
               Reset: in STD_LOGIC );
    end component;
    
    signal input_tb  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal output_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk_tb    : STD_LOGIC := '0';
    signal Reset_tb  : STD_LOGIC := '0';
    
begin
    UUT: Program_counter_v2 
        port map (
            input  => input_tb,
            output => output_tb,
            Clk    => Clk_tb,
            Reset  => Reset_tb
    );
    
    process
        begin
            Clk_tb <= '0';
            wait for 5 ns;
            Clk_tb <= '1';
            wait for 5 ns;
   end process;
   
   process 
       begin
            -- Case 1: Reset active
               Reset_tb <= '1';
               input_tb <= "0000";
               wait for 100ns;
       
               -- Case 2: Load input "0001"
               Reset_tb <= '0';
               input_tb <= "0001";
               wait for 100ns;
       
               -- Case 3: Load input "1010"
               input_tb <= "1010";
               wait for 100ns;
       
               -- Case 4: Load input "1111"
               input_tb <= "1111";
               wait for 100ns;
       
               -- Case 5: Activate Reset again
               Reset_tb <= '1';
               input_tb <= "0101";
               wait for 100ns;
               wait;
    end process;

end Behavioral;
