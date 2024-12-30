----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2022 03:17:53 PM
-- Design Name: 
-- Module Name: TB_PC_3Bit - Behavioral
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

entity PC_3Bit_TB is
--  Port ( );
end PC_3Bit_TB;

architecture Behavioral of PC_3Bit_TB is
component PC_3Bit

Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal D,Q:std_logic_vector(2 downto 0):="000";
signal En,Reset,Clk:std_logic:='0';

begin
UUT:PC_3Bit
port map(
D=>D,
En=>En,
Reset=>Reset,
Clk=>Clk,
Q=>Q
);
process
begin
        Clk <=  NOT(Clk);
        wait for 20ns;
end process;
process
BEGIN 
    Reset<='1';
    wait for 40ns;
    Reset<='0';
    WAIT FOR 40NS;
    D<="000";
    WAIT FOR 40NS;
    
    D<="001";
    wait for 40ns;
    D<="010";
    wait for 40ns;
    D<="011";
    wait for 40ns;
    D<="100";
    wait for 40ns;
    D<="101";
    wait for 40ns;
    D<="110";
    wait for 40ns;
    D<="111";
    wait ;
    
    
end process;

    
end Behavioral;
