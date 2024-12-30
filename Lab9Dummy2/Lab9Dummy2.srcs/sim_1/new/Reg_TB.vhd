----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/21/2022 04:42:15 PM
-- Design Name: 
-- Module Name: Reg_TB - Behavioral
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

entity Reg_TB is
--  Port ( );
end Reg_TB;

architecture Behavioral of Reg_TB is

component Reg 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D ,Q : STD_LOGIC_VECTOR (3 downto 0);
signal  En,Clk,Reset : STD_LOGIC := '0';

begin

UUT:Reg
PORT MAP (
    D => D,
    En => En,
    Clk => Clk,
    Reset => Reset,
    Q=>Q
);

 process
      begin
      wait for 10ns;
      Clk <= NOT(Clk);
 end process;
 
 process
    begin
    En <='1';
    D<="1001";
    wait for 103ns;
    
    En <= '0';
    wait for 104ns;
    
    
    D<= "1101";
    wait for 110ns;
    
    Reset <= '1';
    wait for 95ns;
    
    Reset<='0';
    En<='1';
    D<="0001";
    wait;
    
    
 end process;


end Behavioral;
