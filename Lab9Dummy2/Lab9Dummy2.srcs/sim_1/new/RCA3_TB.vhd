----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 11:07:00 AM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity RCA_3_TB is
--  Port ( );
end RCA_3_TB;

architecture Behavioral of RCA_3_TB is

    COMPONENT RCA_3
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               C_in : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC);
    END COMPONENT;

    signal A,S : STD_LOGIC_VECTOR (2 downto 0);
    SIGNAL c_in,c_out:std_logic;





begin

UUT: RCA_3 PORT MAP(
    A=>A,
    C_in => c_in,
    C_out => c_out,
    S=>S);

    process
    begin
    
    --A = 000
    --answer = 001 
        C_in<='0';
        A<="000";
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        --A = 010
        --answer = 011
        
       A<="001";
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
       
        --A = 110
        --answer = 111
        
        A<="010";
        WAIT FOR 100NS;
        A<="011";
        WAIT FOR 100NS;
        A<="100";
        WAIT FOR 100NS;
        A<="101";
        WAIT FOR 100NS;
        A<="110";
        WAIT FOR 100NS;
        A<="111";
       
        
        

        WAIT; -- will wait forever
    
    end process;


end Behavioral;
