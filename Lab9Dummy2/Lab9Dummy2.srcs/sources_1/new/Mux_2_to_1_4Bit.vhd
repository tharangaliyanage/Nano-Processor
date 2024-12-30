----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 08:57:24 PM
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

entity Mux_2_to_1_4Bit is
    Port ( S : in STD_LOGIC;
           RCA_out : in STD_LOGIC_VECTOR (3 downto 0); --RCA
           Imm_Val : in STD_LOGIC_VECTOR (3 downto 0); --Immediate Value
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_to_1_4Bit;

architecture Behavioral of Mux_2_to_1_4Bit is

begin


--S = 0 ---> RCA_out
--S = 1 ---> Immediate value


    Y(0) <= (NOT(S) AND (RCA_out(0))) OR (S AND (Imm_Val(0)));

    Y(1) <= (NOT(S) AND (RCA_out(1))) OR (S AND (Imm_Val(1)));
   
    Y(2) <= (NOT(S) AND (RCA_out(2))) OR (S AND (Imm_Val(2)));

    Y(3) <= (NOT(S) AND (RCA_out(3))) OR (S AND (Imm_Val(3)));

end Behavioral;