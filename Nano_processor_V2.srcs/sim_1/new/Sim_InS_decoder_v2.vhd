----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 10:57:16 AM
-- Design Name: 
-- Module Name: Sim_InS_decoder_v2 - Behavioral
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

entity Sim_InS_decoder_v2 is
--  Port ( );
end Sim_InS_decoder_v2;

architecture Behavioral of Sim_InS_decoder_v2 is
    component Instruction_decoder_v2
        Port (
            Instruction_Bus : in STD_LOGIC_VECTOR(13 downto 0);
            Reg_Check_Jump : in STD_LOGIC_VECTOR(3 downto 0);
            Reg_Enable : out STD_LOGIC_VECTOR(2 downto 0);
            Load_Sel : out STD_LOGIC;
            Imm_Value : out STD_LOGIC_VECTOR(3 downto 0);
            Reg_Sel_1 : out STD_LOGIC_VECTOR(2 downto 0);
            Reg_Sel_2 : out STD_LOGIC_VECTOR(2 downto 0);
            Add_Sub_Sel : out STD_LOGIC;
            Jump_flag : out STD_LOGIC;
            Address_Jump : out STD_LOGIC_VECTOR(3 downto 0);
            Output_enable : out STD_LOGIC_VECTOR(2 downto 0);
            Comp_En : out STD_LOGIC
    );
    end component;

    signal Instruction_Bus : STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
    signal Reg_Check_Jump : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Reg_Enable : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_Sel : STD_LOGIC;
    signal Imm_Value : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_Sel_1 : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_Sel_2 : STD_LOGIC_VECTOR(2 downto 0);
    signal Add_Sub_Sel : STD_LOGIC;
    signal Jump_flag : STD_LOGIC;
    signal Address_Jump : STD_LOGIC_VECTOR(3 downto 0);
    signal Output_enable : STD_LOGIC_VECTOR(2 downto 0);
    signal Comp_En : STD_LOGIC;
    
begin
    UUT: Instruction_decoder_v2
        Port map (
            Instruction_Bus => Instruction_Bus,
            Reg_Check_Jump => Reg_Check_Jump,
            Reg_Enable => Reg_Enable,
            Load_Sel => Load_Sel,
            Imm_Value => Imm_Value,
            Reg_Sel_1 => Reg_Sel_1,
            Reg_Sel_2 => Reg_Sel_2,
            Add_Sub_Sel => Add_Sub_Sel,
            Jump_flag => Jump_flag,
            Address_Jump => Address_Jump,
            Output_enable => Output_enable,
            Comp_En => Comp_En
    );
    
    process
        begin
            -- Test 0000: Normal Operation
            Instruction_Bus <= "00000010100000"; -- operator="0000", RS1="001", RS2="010"
            wait for 50 ns;
    
            -- Test 0001: Add/Sub
            Instruction_Bus <= "00010110000000";
            wait for 50 ns;
    
            -- Test 0010: Load Immediate
            Instruction_Bus <= "00101000001010"; -- Imm=1010
            wait for 50 ns;
    
            -- Test 0011: Conditional Jump (with jump condition met)
            Instruction_Bus <= "00111010000100";
            Reg_Check_Jump <= "0000";
            wait for 50 ns;
    
            -- Test 0100: Compare
            Instruction_Bus <= "01000010100000";
            wait for 50 ns;
    
            -- Test 0101 to 1011: Output Enable variants
            Instruction_Bus <= "01010111000000";
            wait for 50 ns;
    
            Instruction_Bus <= "01100111000000";
            wait for 50 ns;
    
            Instruction_Bus <= "01110111000000";
            wait for 50 ns;
    
            Instruction_Bus <= "10000111000000";
            wait for 50 ns;
    
            Instruction_Bus <= "10011100000000";
            wait for 50 ns;
    
            Instruction_Bus <= "10101110000000";
            wait for 50 ns;
    
            Instruction_Bus <= "10110010000000";
            wait for 50 ns;
    
            wait for 100 ns;
    
            wait;
        end process;  

end Behavioral;
