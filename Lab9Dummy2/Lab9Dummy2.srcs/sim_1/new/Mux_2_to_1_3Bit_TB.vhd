----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2022 02:54:29 AM
-- Design Name: 
-- Module Name: Mux_2_to_1_4Bit_TB - Behavioral
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

entity Mux_2_to_1_3Bit_TB is
--  Port ( );
end Mux_2_to_1_3Bit_TB;

architecture Behavioral of Mux_2_to_1_3Bit_TB is

component Mux_2_to_1_3Bit
    Port ( S : in STD_LOGIC;
       D0 : in STD_LOGIC_VECTOR (2 downto 0); --RCA
       D1 : in STD_LOGIC_VECTOR (2 downto 0); --Immediate Value
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal d0, d1, y : STD_LOGIC_VECTOR (2 downto 0);
signal s : STD_LOGIC;

begin

UUT: Mux_2_to_1_3Bit
port map (
S => s,
D0 => d0,
D1 => d1,
Y => y
);


process
begin

--d0 = 1, d1 = 2
d0 <= "001";
d1 <= "010";

--change s
s <= '0';
wait for 100ns;

s <= '1';
wait for 100ns;

--d0 = 6, d1 = 7
d0 <= "110";
d1 <= "111";

--change s
s <= '0';
wait for 100ns;

s <= '1';
wait;




end process;



end Behavioral;
