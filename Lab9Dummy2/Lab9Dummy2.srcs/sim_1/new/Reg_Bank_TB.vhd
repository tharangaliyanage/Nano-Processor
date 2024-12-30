----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 08:06:12 AM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity Reg_Bank_TB is
--  Port ( );
end Reg_Bank_TB;

architecture Behavioral of Reg_Bank_TB is
component Reg_Bank 
    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Input_D : in STD_LOGIC_VECTOR (3 downto 0);
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_en : STD_LOGIC_VECTOR (2 downto 0);
signal Clk,Reset : STD_LOGIC := '0';
signal Input_D ,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Reg_Bank
    PORT MAP(
        Reg_en => Reg_en,
        Clk=> Clk,
        Reset=> Reset,
        Input_D=> Input_D,
        Q0=>Q0,
        Q1=>Q1,
        Q2=>Q2,
        Q3=>Q3,
        Q4=>Q4,
        Q5=>Q5,
        Q6=>Q6,
        Q7=>Q7 );
        
        
        process
            begin
            wait for 10ns;
            Clk <= NOT(Clk);
        end process;
        
        process 
            begin
            
            Reset <= '1';
            wait for 50ns;
            
            Reset<='0';
            Reg_en<="001";
            Input_D<="0001";
            wait for 105ns;
            
            Reg_en<="010";
            Input_D<="1001";
            wait for 102ns;
            
            Reset <= '1';
            wait for 50ns;
            
            Reset<='0';
            Reg_en<="111";
            Input_D<="0001";
            wait for 105ns;
                        
            Reg_en<="001";
            Input_D<="1001";
            wait for 102ns;
            
            Reg_en<="101";
            Input_D<="1101";
            wait for 103ns;
            
            Reg_en<="110";
            Input_D<="0011";
                 
            wait;
                        
                        
        end process;

end Behavioral;