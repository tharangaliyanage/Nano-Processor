----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 09:16:33 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_SelA : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_SelB : in STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : in STD_LOGIC;
           Reg_Chk_Jmp : out STD_LOGIC_VECTOR (3 downto 0);
           RCA_out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end AU;

architecture Behavioral of AU is

component Mux_8way_4bit 
    Port (
        S : in STD_LOGIC_VECTOR (2 downto 0);
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        D2 : in STD_LOGIC_VECTOR (3 downto 0);
        D3 : in STD_LOGIC_VECTOR (3 downto 0);            
        D4 : in STD_LOGIC_VECTOR (3 downto 0);
        D5 : in STD_LOGIC_VECTOR (3 downto 0);
        D6 : in STD_LOGIC_VECTOR (3 downto 0);
        D7 : in STD_LOGIC_VECTOR (3 downto 0);
        Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in std_logic;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

SIGNAL Reg_A_out,Reg_B_out, RCA_out_sig : STD_LOGIC_VECTOR (3 downto 0);


begin

Mux_8way_4bit_A : Mux_8way_4bit
        port map (
        S => Reg_SelA,
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7,
        Y => Reg_A_out
        );

Mux_8way_4bit_B : Mux_8way_4bit
        port map (
        S => Reg_SelB,
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7,
        Y => Reg_B_out
        );

RCA_4_0 : RCA_4
        port map (
        A => Reg_A_out,
        B => Reg_B_out,
        C_in => Add_Sub_Sel,
        S => RCA_out_sig,
        C_out => Overflow,
        Zero => Zero);
        
RCA_out <= RCA_out_sig;
Reg_Chk_Jmp <= Reg_A_out;

end Behavioral;
