----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 02:31:50 AM
-- Design Name: 
-- Module Name: Mux_8way_4bit_TB - Behavioral
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

entity Mux_8way_4bit_TB is
--  Port ( );
end Mux_8way_4bit_TB;

architecture Behavioral of Mux_8way_4bit_TB is

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

signal d0, d1, d2, d3, d4, d5, d6, d7, y : STD_LOGIC_VECTOR (3 downto 0);
signal s : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Mux_8way_4bit
port map(
S => s,
D0 => d0,
D1 => d1,
D2 => d2,
D3 => d3,
D4 => d4,
D5 => d5,
D6 => d6,
D7 => d7,
Y => y
);

process
    begin
    
    --Here let's set D0 - D7 to the corresponding decimal value * 2
    -- Example : D0 -> 0, D1 -> 2, D2 -> 4...
    d0 <= "0000";
    d1 <= "0010";
    d2 <= "0100";
    d3 <= "0110";
    d4 <= "1000";
    d5 <= "1010";
    d6 <= "1100";
    d7 <= "1110";
    
    --now let's change S and check the output
    s <= "000";
    wait for 100 ns;
    
    s <= "001";
    wait for 100 ns;
    
    s <= "010";
    wait for 100 ns;
    
    s <= "011";
    wait for 100 ns;
    
    s <= "100";
    wait for 100 ns;
    
    s <= "101";
    wait for 100 ns;
    
    s <= "110";
    wait for 100 ns;
    
    s <= "111";
    wait;
    
    
end process;




end Behavioral;
