----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 07:15:34 PM
-- Design Name: 
-- Module Name: Comp_4bit - Behavioral
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

entity Comp_4bit is
     Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Enable: in STD_LOGIC;
            equal : out STD_LOGIC;
            greater : out STD_LOGIC;
            lesser : out STD_LOGIC );
end Comp_4bit;

architecture Behavioral of Comp_4bit is

    component Com_1bit
        port(  A : in STD_LOGIC;
               B : in STD_LOGIC;
               En : in STD_LOGIC;
               equal : out STD_LOGIC;
               great : out STD_LOGIC;
               less : out STD_LOGIC );
    end component;
    
    signal Eq : STD_LOGIC_VECTOR(3 downto 0);
    signal Gt : STD_LOGIC_VECTOR(3 downto 0);
    signal Lt : STD_LOGIC_VECTOR(3 downto 0);
    signal Enab : STD_LOGIC_VECTOR(3 downto 0);
    signal e, g, l : STD_LOGIC;
    
begin
        Enab(3) <= Enable;
        Enab(2) <= Eq(3);
        Enab(1) <= Eq(3) AND Eq(2);
        Enab(0) <= Eq(3) AND Eq(2) AND Eq(1);
    
        Com_1bit_0 : Com_1bit
            port map( A => A(3),
                      B => B(3),
                      En => Enab(3),
                      equal => eq(3),
                      great => Gt(3),
                      less => Lt(3)     );
        
        Com_1bit_1 : Com_1bit
            port map( A => A(2),
                      B => B(2),
                      En => Enab(2),
                      equal => eq(2),
                      great => Gt(2),
                      less => Lt(2)     );
                      
        Com_1bit_2 : Com_1bit
            port map( A => A(1),
                      B => B(1),
                      En => Enab(1),
                      equal => eq(1),
                      great => Gt(1),
                      less => Lt(1)     );
                      
        Com_1bit_3 : Com_1bit
            port map( A => A(0),
                      B => B(0),
                      En => Enab(0),
                      equal => eq(0),
                      great => Gt(0),
                      less => Lt(0)     );
            
        e <= Eq(3) AND Eq(2) AND Eq(1) AND Eq(0);
        g <= Gt(3) OR Gt(2) OR Gt(1) OR Gt(0);
        l  <= Lt(3) OR Lt(2) OR Lt(1) OR Lt(0);

    process (A,B,e,g,l,Enable) 
        begin
         if (A(3)='1' AND B(3)='0') then
            equal <= '0';
            greater <= '0';
            lesser <= Enable;
            
         elsif (A(3)='0' AND B(3)='1') then
            equal <= '0';
            greater <= Enable;
            lesser <= '0';
         else
            equal <= e;
            greater <= g;
            lesser <= l;
         end if;
    end process;
            
end Behavioral;
