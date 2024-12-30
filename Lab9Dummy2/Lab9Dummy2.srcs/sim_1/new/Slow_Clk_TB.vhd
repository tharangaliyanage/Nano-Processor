----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 09:36:49 PM
-- Design Name: 
-- Module Name: Slow_Clk_TB - Behavioral
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

entity Slow_Clk_TB is
--  Port ( );
end Slow_Clk_TB;

architecture Behavioral of Slow_Clk_TB is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

signal Clk, Clk_out : STD_LOGIC := '0';


begin

UUT: Slow_Clk
port map(
Clk_in => Clk,
Clk_out => Clk_out
);

process
    begin
    wait for 10ns;
    Clk <= NOT(Clk);
end process;


end Behavioral;
