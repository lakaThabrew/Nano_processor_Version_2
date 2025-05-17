----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 08:19:01 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
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
end ALU;

architecture Behavioral of ALU is

    component Add_Sub_unit
        Port ( 
                A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                M : in STD_LOGIC;
                C_out : out STD_LOGIC;
                S : out STD_LOGIC_VECTOR (3 downto 0); 
                Zero : out STD_LOGIC;
                overflow : out STD_LOGIC);
    end component;
    
    component Comp_4bit
        port (  A : in STD_LOGIC_VECTOR(3 downto 0);
                B : in STD_LOGIC_VECTOR(3 downto 0);
                Enable: in STD_LOGIC;
                equal : out STD_LOGIC;
                greater : out STD_LOGIC;
                lesser : out STD_LOGIC );
    end component;
    
    component multiplier_2
        port ( A : in STD_LOGIC_VECTOR (1 downto 0);
               B : in STD_LOGIC_VECTOR (1 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Bitwise_AND
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Bitwise_OR
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Bitwise_XOR
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component Bitwise_NOT 
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
     component right_shift_by1
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
     end component; 
     
     component right_shift_by2
        port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
     end component; 
      
     component Mux_8_4bit
        port (  A0 : in STD_LOGIC_VECTOR (3 downto 0);
                A1 : in STD_LOGIC_VECTOR (3 downto 0);
                A2 : in STD_LOGIC_VECTOR (3 downto 0);
                A3 : in STD_LOGIC_VECTOR (3 downto 0);
                A4 : in STD_LOGIC_VECTOR (3 downto 0);
                A5 : in STD_LOGIC_VECTOR (3 downto 0);
                A6 : in STD_LOGIC_VECTOR (3 downto 0);
                A7 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC_VECTOR (2 downto 0);
                Y : out STD_LOGIC_VECTOR (3 downto 0)); 
    end component;
    
    signal output_0, output_1, output_2, output_3, output_4, output_5, output_6, output_7 : STD_LOGIC_VECTOR(3 downto 0);
        
begin
    Add_unit_0 : Add_Sub_unit
        port map(   A => input_1,
                    B => input_2,
                    M => Add_Sel,
                    C_out => ALU_C_out,
                    S => output_0,
                    Zero => ALU_Zero,
                    overflow => ALU_overflow);
    
    multiplier_0 : Multiplier_2
        port map(  A => input_1(1 downto 0),
                   B => input_2(1 downto 0),
                   Y => output_1 );
    
    BWA_0 : Bitwise_AND
        port map(  A => input_1,
                   B => input_2,
                   Y => output_2 );
                   
    BWO_0 : Bitwise_OR
        port map (  A => input_1,
                    B => input_2,
                    Y => output_3 );
   
    BWX_0 : Bitwise_XOR
        port map ( A => input_1,
                   B => input_2,
                   Y => output_4 );
    
    BWN_0 : Bitwise_NOT
        port map ( A => input_1,
                   Y => output_5);
    
    RS2_0 : right_shift_by2
        port map( A => input_1,
                  Y => output_6);
    
    RS1_0 : right_shift_by1
        port map(   A => input_1,
                    Y => output_7 );
   
   Output_Selector : Mux_8_4bit
        port map (     A0 => output_0,
                       A1 => output_1,
                       A2 => output_2,
                       A3 => output_3,
                       A4 => output_4,
                       A5 => output_5,
                       A6 => output_6,
                       A7 => output_7,
                       Sel => Output_enable,
                       Y => ALU_S       );
    
    Comparator_0 : Comp_4bit
        port map(   A => input_1,
                    B => input_2,
                    Enable => Comp_Enable,
                    equal => ALU_equal,
                    greater => ALU_greater,
                    lesser => ALU_lesser);
end Behavioral;
