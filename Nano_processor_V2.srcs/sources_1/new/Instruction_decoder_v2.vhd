----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 10:17:05 AM
-- Design Name: 
-- Module Name: Instruction_decoder_v2 - Behavioral
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

entity Instruction_decoder_v2 is
      Port (    Instruction_Bus: in STD_LOGIC_VECTOR(13 downto 0);
                Reg_Check_Jump: in STD_LOGIC_VECTOR(3 downto 0);
                Reg_Enable: out STD_LOGIC_VECTOR(2 downto 0);
                Load_Sel: out STD_LOGIC;
                Imm_Value: out STD_LOGIC_VECTOR(3 downto 0);
                Reg_Sel_1: out STD_LOGIC_VECTOR(2 downto 0);
                Reg_Sel_2: out STD_LOGIC_VECTOR(2 downto 0);
                Add_Sub_Sel: out STD_LOGIC;
                Jump_flag: out STD_LOGIC;
                Address_Jump: out STD_LOGIC_VECTOR(3 downto 0);
                Output_enable : out STD_LOGIC_VECTOR(2 downto 0);
                Comp_En : out STD_LOGIC );
end Instruction_decoder_v2;
    
architecture Behavioral of Instruction_decoder_v2 is

    signal operator : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    operator <= Instruction_Bus(13 downto 10);
    
    process (Operator, Instruction_Bus, Reg_Check_Jump)
        begin
             Add_Sub_Sel <= '0';
             Jump_flag <= '0';
             Load_Sel <= '0';
             Reg_Sel_1 <= "000";
             Reg_Sel_2 <= "000";
             Imm_Value <= "0000";
             Reg_Enable <= "000";
             Address_Jump <= "0000";
             Output_enable <= "000";
             Comp_En <= '0';
                         
            if operator = "0000" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "000";
                
            elsif operator = "0001" then
                Reg_Enable <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(9 downto 7);
                Add_Sub_Sel <= '1';
                output_enable <= "000";
                
            elsif operator = "0010" then
                Imm_Value <= Instruction_Bus(3 downto 0);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                Load_Sel <= '1';
                
            elsif operator = "0011" then
                Address_Jump <= Instruction_Bus(3 downto 0);
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                if Reg_Check_Jump = "0000" then
                    Jump_Flag <= '1';
                end if;
                
            elsif operator = "0100" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                Comp_En <= '1';
                
            elsif operator = "0101" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "001";
                
            elsif operator = "0110" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "010";
                
            elsif operator = "0111" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "011";
                
            elsif operator = "1000" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Sel_2 <= Instruction_Bus(6 downto 4);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "100";
                            
            elsif operator = "1001" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "101";
                
            elsif operator = "1010" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "110";
                
            elsif operator = "1011" then
                Reg_Sel_1 <= Instruction_Bus(9 downto 7);
                Reg_Enable <= Instruction_Bus(9 downto 7);
                output_enable <= "111";
                
            end if;
    end process;

end Behavioral;
