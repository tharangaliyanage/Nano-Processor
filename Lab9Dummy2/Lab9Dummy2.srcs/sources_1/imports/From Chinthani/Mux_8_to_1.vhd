----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2022 10:58:59 AM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
component Decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal DY :STD_LOGIC_VECTOR (7 downto 0);
begin
Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => S,
    Y => DY,
    EN => EN);

Y <=     ((D(0) and DY(0))
        or  (D(1) and DY(1))
        or  (D(2) and DY(2))
        or  (D(3) and DY(3))
        or  (D(4) and DY(4))
        or  (D(5) and DY(5))
        or  (D(6) and DY(6))
        or  (D(7) and DY(7))) AND EN;
           

end Behavioral;
