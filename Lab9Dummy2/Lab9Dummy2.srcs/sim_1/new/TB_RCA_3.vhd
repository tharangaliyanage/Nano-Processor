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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is

    COMPONENT RCA_3
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               C_in : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC);
    END COMPONENT;

    signal a0, a1, a2, s0, s1, s2, c_in, c_out: STD_LOGIC;




begin

UUT: RCA_3 PORT MAP(
    A(0) => a0,
    A(1) => a1,
    A(2) => a2,
    S(0) => s0,
    S(1) => s1,
    S(2) => s2,
    C_in => c_in,
    C_out => c_out);


    process
    begin
    
    --A = 000
    --answer = 001 
    
        a0 <= '0'; -- set initial values
        a1 <= '0'; -- set initial values
        a2 <= '0'; -- set initial values
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        --A = 010
        --answer = 011
        
        a0 <= '0'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '0'; -- set initial values
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
       
        --A = 110
        --answer = 111
        
        a0 <= '0'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '1'; -- set initial values
        

        WAIT; -- will wait forever
    
    end process;


end Behavioral;
