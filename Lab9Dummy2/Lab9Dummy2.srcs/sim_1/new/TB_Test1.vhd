----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 11:28:53 PM
-- Design Name: 
-- Module Name: TB_Test1 - Behavioral
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

entity TB_Test1 is
--  Port ( );
end TB_Test1;

architecture Behavioral of TB_Test1 is

--signal D0, D1, D2, D3 : STD_LOGIC;
signal input: STD_LOGIC_VECTOR(6 downto 0);
signal D: STD_LOGIC_VECTOR(2 downto 0);





begin

    input <= "0000100";
    --0001
    D <= input(2 downto 0);

end Behavioral;
