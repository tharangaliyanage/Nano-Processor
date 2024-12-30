----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 10:58:31 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

    component FA
        port(
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic
        );
    end component;

    SIGNAL FA0_C, FA1_C, FA2_C: std_logic;
    SIGNAL B_Sig, S_FA : STD_LOGIC_VECTOR (3 downto 0);


begin

   B_Sig(0) <= (B(0) XOR C_in); 
   B_Sig(1) <= (B(1) XOR C_in); 
   B_Sig(2) <= (B(2) XOR C_in); 
   B_Sig(3) <= (B(3) XOR C_in); 


   FA_0 : FA
        port map (
        A => A(0),
        B => B_Sig(0),
        C_in => C_in,
        S => S_FA(0),
        C_out => FA0_C);

    FA_1 : FA
        port map (
        A => A(1),
        B => B_Sig(1),
        C_in => FA0_C,
        S => S_FA(1),
        C_out => FA1_C);

    FA_2 : FA
        port map (
        A => A(2),
        B => B_Sig(2),
        C_in => FA1_C,
        S => S_FA(2),
        C_out => FA2_C);

    FA_3 : FA
        port map (
        A => A(3),
        B => B_Sig(3),
        C_in => FA2_C,
        S => S_FA(3),
        C_out => C_out);

S <= S_FA;
Zero <= NOT(S_FA(0)) AND NOT(S_FA(1)) AND NOT(S_FA(2)) AND NOT(S_FA(3)); --AND NOT(C_out);

end Behavioral;
