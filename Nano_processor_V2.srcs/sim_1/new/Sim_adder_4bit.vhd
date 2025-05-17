----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 01:08:40 PM
-- Design Name: 
-- Module Name: Sim_adder_4bit - Behavioral
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

entity Sim_adder_4bit is
--  Port ( );
end Sim_adder_4bit;

architecture Behavioral of Sim_adder_4bit is

     component Adder_4bit
       Port ( 
           input  : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           C_out  : out STD_LOGIC
       );
   end component;

   signal input_tb  : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
   signal output_tb : STD_LOGIC_VECTOR (3 downto 0);
   signal C_out_tb  : STD_LOGIC;

begin
   UUT: Adder_4bit
       Port map (
           input  => input_tb,
           output => output_tb,
           C_out  => C_out_tb
       );

    process
        begin
           -- Test 1: input = 0000, expect output = 0001
           input_tb <= "0000";
           wait for 100 ns;
    
           -- Test 2: input = 0001, expect output = 0010
           input_tb <= "0001";
           wait for 100 ns;
    
           -- Test 3: input = 1110, expect output = 1111
           input_tb <= "1110";
           wait for 100 ns;
    
           -- Test 4: input = 1111, expect output = 0000, carry out = 1
           input_tb <= "1111";
           wait for 100 ns;
    
           wait;  -- End simulation
   end process;

end Behavioral;
