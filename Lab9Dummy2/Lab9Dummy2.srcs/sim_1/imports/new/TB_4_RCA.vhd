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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is

    COMPONENT RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           Sel_add_sub : in std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
    END COMPONENT;

    signal a0, a1, a2, a3, b0, b1, b2, b3, s0, s1, s2, s3, c_in, c_out, sel_add_sub: STD_LOGIC;




begin

UUT: RCA_4 PORT MAP(
    A(0) => a0,
    A(1) => a1,
    A(2) => a2,
    A(3) => a3,
    B(0)=> b0,
    B(1) => b1,
    B(2) => b2,
    B(3) => b3,
    S(0) => s0,
    S(1) => s1,
    S(2) => s2,
    S(3) => s3,
    C_in => c_in,
    C_out => c_out,
    Sel_add_sub => sel_add_sub);


    process
    begin
    
    sel_add_sub <= '0';
    
    
    
        --1110 - 0100
        a0 <= '0'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '1'; -- set initial values
        a3 <= '1'; -- set initial values
        b0 <= '0'; -- set initial values
        b1 <= '0'; -- set initial values
        b2 <= '1'; -- set initial values
        b3 <= '0';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        
        --0000 - 0111
        --answer = 1001
        
        a0 <= '0'; -- set initial values
        a1 <= '0'; -- set initial values
        a2 <= '0'; -- set initial values
        a3 <= '0'; -- set initial values
        b0 <= '1'; -- set initial values
        b1 <= '1'; -- set initial values
        b2 <= '1'; -- set initial values
        b3 <= '0';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0110 + 0110    
        --answer = 1100
        
        a0 <= '0'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '1'; -- set initial values
        a3 <= '1'; -- set initial values
        b0 <= '1'; -- set initial values
        b1 <= '0'; -- set initial values
        b2 <= '0'; -- set initial values
        b3 <= '0';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0011 + 1011
        a0 <= '1'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '0'; -- set initial values
        a3 <= '0'; -- set initial values
        b0 <= '1'; -- set initial values
        b1 <= '1'; -- set initial values
        b2 <= '0'; -- set initial values
        b3 <= '1';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0011 + 0001
        a0 <= '1'; -- set initial values
        a1 <= '1'; -- set initial values
        a2 <= '0'; -- set initial values
        a3 <= '0'; -- set initial values
        b0 <= '1'; -- set initial values
        b1 <= '0'; -- set initial values
        b2 <= '0'; -- set initial values
        b3 <= '0';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        --0000 + 1011
        a0 <= '0'; -- set initial values
        a1 <= '0'; -- set initial values
        a2 <= '0'; -- set initial values
        a3 <= '1'; -- set initial values
        b0 <= '1'; -- set initial values
        b1 <= '1'; -- set initial values
        b2 <= '0'; -- set initial values
        b3 <= '1';

        WAIT; -- will wait forever
    
    end process;


end Behavioral;
