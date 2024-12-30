----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 12:24:52 AM
-- Design Name: 
-- Module Name: TB_RCA - Behavioral
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

entity RCA_4_TB is
--  Port ( );
end RCA_4_TB;

architecture Behavioral of RCA_4_TB is

    COMPONENT RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
    END COMPONENT;
    
    signal A :std_logic_vector(3 downto 0);
    signal B :  STD_LOGIC_VECTOR (3 downto 0);
    signal S :  STD_LOGIC_VECTOR (3 downto 0);
    signal c_in,c_out,zero :std_logic;
begin

UUT: RCA_4 PORT MAP(

    A=>A,
    B=>B,
    C_in => c_in,
    S=>S,
    C_out => c_out,
    Zero => zero
);

    process
    begin
    

    
         C_in<='1';
    
        --1110 - 0100 ANSWER=1010
        A<="1110";
        B<="0100";
        

        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        --0000 - 0111
        --answer = 1001
        A<="0000";
        B<="0111";
        
        

        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0110 + 0110    
        --answer = 1100
        C_in<='0';
        A<="0110";
        B<="0110";
        
        

        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0011 + 1011 ANSWER=1100
        A<="0011";
        B<="1011";
        

        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0011 + 0001 ANSWE=0100
        A<="0011";
        B<="0001";
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0011 + 0001 ANSWE=0100
        A<="0000";
        B<="0000";       

        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0000 + 1011 ANSWER=1011
        A<="0000";
        B<="1011";
   
        WAIT; -- will wait forever
    
    end process;
    
end Behavioral;