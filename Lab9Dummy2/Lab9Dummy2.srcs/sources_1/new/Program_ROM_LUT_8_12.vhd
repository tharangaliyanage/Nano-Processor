----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2022 11:03:30 AM
-- Design Name: 
-- Module Name: Program_ROM_LUT_8_12 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM_LUT_8_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
   data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM_LUT_8_12;





architecture Behavioral of Program_ROM_LUT_8_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal program_ROM : rom_type := (

"100010000011", -- 0
"100100000001", --1
"010100000000", --2
"001110010000", --3
"000010100000", --4
"110010000111", --5
"110000000011", --6
"110000000111" --7
);


begin

data <= program_ROM(to_integer(unsigned(address)));


end Behavioral;
