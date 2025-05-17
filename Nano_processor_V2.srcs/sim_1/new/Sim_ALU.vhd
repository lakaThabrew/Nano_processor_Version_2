----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 09:20:31 AM
-- Design Name: 
-- Module Name: Sim_ALU - Behavioral
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

entity Sim_ALU is
--  Port ( );
end Sim_ALU;

architecture Behavioral of Sim_ALU is

    component ALU
        Port (  input_1 : in STD_LOGIC_VECTOR (3 downto 0);
                input_2 : in STD_LOGIC_VECTOR (3 downto 0);
                Add_Sel : in STD_LOGIC;
                ALU_C_out : out STD_LOGIC;
                ALU_S : out STD_LOGIC_VECTOR (3 downto 0); 
                ALU_Zero : out STD_LOGIC;
                ALU_overflow : out STD_LOGIC;
                Output_enable: in STD_LOGIC_VECTOR(2 downto 0);
                Comp_enable : in STD_LOGIC;
                ALU_Equal : out STD_LOGIC;
                ALU_greater : out STD_LOGIC;
                ALU_lesser : out STD_LOGIC );
    end component;
    
    signal input_1, input_2 : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Add_Sel : STD_LOGIC := '0';
    signal ALU_C_out : STD_LOGIC;
    signal ALU_S : STD_LOGIC_VECTOR (3 downto 0);
    signal ALU_Zero : STD_LOGIC;
    signal ALU_overflow : STD_LOGIC;
    signal Output_enable : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Comp_enable : STD_LOGIC := '0';
    signal ALU_Equal, ALU_greater, ALU_lesser : STD_LOGIC;
       
begin
    UUT: ALU
        Port map (
            input_1 => input_1,
            input_2 => input_2,
            Add_Sel => Add_Sel,
            ALU_C_out => ALU_C_out,
            ALU_S => ALU_S,
            ALU_Zero => ALU_Zero,
            ALU_overflow => ALU_overflow,
            Output_enable => Output_enable,
            Comp_enable => Comp_enable,
            ALU_Equal => ALU_Equal,
            ALU_greater => ALU_greater,
            ALU_lesser => ALU_lesser
    );
    -- 230631 ---> 0011 1000 0100 1110 0111
    process
        begin
            -- Test 1: Addition
                input_1 <= "0100";  -- 4
                input_2 <= "0011";  -- 3
                Add_Sel <= '0';     -- Addition
                Output_enable <= "000"; -- Select output_0 (Add/Sub result)
                Comp_enable <= '0';
                wait for 50 ns;
        
                -- Test 2: Subtraction
                Add_Sel <= '1';     -- Subtraction
                wait for 50 ns;
        
                -- Test 3: Multiplication (input_1[1:0] * input_2[1:0] => 3*1 = 3)
                input_1 <= "0011";  -- 3 (lower 2 bits = 11)
                input_2 <= "0001";  -- 1 (lower 2 bits = 01)
                Output_enable <= "001"; -- Select output_1 (Multiplier)
                wait for 50 ns;
        
                -- Test 4: Bitwise AND
                input_1 <= "1100";
                input_2 <= "1010";
                Output_enable <= "010"; -- output = 1000
                wait for 50 ns;
        
                -- Test 5: Bitwise OR
                Output_enable <= "011"; --output = 1110
                wait for 50 ns;
        
                -- Test 6: Bitwise XOR
                Output_enable <= "100"; --output = 0110
                wait for 50 ns;
        
                -- Test 7: Bitwise NOT (only input_1 used)
                Output_enable <= "101"; --output = 1101
                wait for 50 ns;
        
                -- Test 8: Right shift by 2
                input_1 <= "1111";
                Output_enable <= "110"; --output = 0011
                wait for 50 ns;
        
                -- Test 9: Right shift by 1
                Output_enable <= "111"; --output = 0110
                wait for 50 ns;
        
                -- Test 10: Comparison test - Equal
                input_1 <= "0101";
                input_2 <= "0101";
                Comp_enable <= '1';
                wait for 50 ns;
        
                -- Test 11: Comparison test - Greater
                input_1 <= "1001";
                input_2 <= "0011";
                wait for 50 ns;
        
                -- Test 12: Comparison test - Lesser
                input_1 <= "0001";
                input_2 <= "1000";
                wait for 50 ns;
        
                wait;
            end process;
end Behavioral;
