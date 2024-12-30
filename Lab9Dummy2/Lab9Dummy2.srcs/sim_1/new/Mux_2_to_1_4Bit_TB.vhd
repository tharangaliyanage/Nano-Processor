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

entity Mux_2_to_1_4Bit_TB is
--  Port ( );
end Mux_2_to_1_4Bit_TB;

architecture Behavioral of Mux_2_to_1_4Bit_TB is

component Mux_2_to_1_4Bit
    Port ( S : in STD_LOGIC;
       RCA_out : in STD_LOGIC_VECTOR (3 downto 0); --RCA
       Imm_Val : in STD_LOGIC_VECTOR (3 downto 0); --Immediate Value
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal rca_out, imm_val, y : STD_LOGIC_VECTOR (3 downto 0);
signal s : STD_LOGIC;

begin

UUT: Mux_2_to_1_4Bit
port map (
S => s,
RCA_out => rca_out,
Imm_Val => imm_val,
Y => y
);


process
begin

--rca_out = 1, imm_val = 2
rca_out <= "0001";
imm_val <= "0010";

--change s
s <= '0';
wait for 100ns;

s <= '1';
wait for 100ns;

--rca_out = 10(a), imm_val = 11(b)
rca_out <= "1010";
imm_val <= "1011";

--change s
s <= '0';
wait for 100ns;

s <= '1';
wait;




end process;



end Behavioral;
