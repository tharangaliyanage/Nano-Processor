----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 10:41:37 PM
-- Design Name: 
-- Module Name: Ins_Dec_TB - Behavioral
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

entity Ins_Dec_TB is
--  Port ( );
end Ins_Dec_TB;

architecture Behavioral of Ins_Dec_TB is

    COMPONENT Ins_Decoder
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           Load_sel : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_add : out STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : out STD_LOGIC);
    END COMPONENT;


signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_en : STD_LOGIC_VECTOR (2 downto 0);
signal Load_sel : STD_LOGIC;
signal Imm_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Sel_A : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Sel_B : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub_Sel : STD_LOGIC;
signal Jump_add : STD_LOGIC_VECTOR (2 downto 0);
signal Jump_flag : STD_LOGIC;
signal Reg_Chk_Jmp : STD_LOGIC_VECTOR (3 downto 0);



begin

UUT: Ins_Decoder PORT MAP(
    Instruction => Instruction,
    Reg_Chk_Jmp => Reg_Chk_Jmp,
    Reg_en => Reg_en,
    Load_sel => Load_sel ,
    Imm_Val => Imm_Val ,
    Reg_Sel_A => Reg_Sel_A ,
    Reg_Sel_B => Reg_Sel_B ,
    Add_Sub_Sel => Add_Sub_Sel ,
    Jump_add => Jump_add ,
    Jump_flag => Jump_flag );


process
begin

    Reg_Chk_Jmp <= "0000";
    Instruction <= "100110000110";   --MOVI 3,6
    WAIT FOR 100 ns; -- after 100 ns change inputs
        
    Instruction <= "101000001001";   --MOVI 4,9
    WAIT FOR 100 ns; -- after 100 ns change inputs
        
   -- Reg_Chk_Jmp <= "0000";
    Instruction <= "000111000000";   --ADD 3,4
    WAIT FOR 100 ns; -- after 100 ns change inputs
    
    Instruction <= "011000000000";   --NEG 4
    WAIT FOR 100 ns; -- after 100 ns change inputs
        
    Instruction <= "111110000001";   --JZR 7,1
    Reg_Chk_Jmp <= "0000";
    WAIT FOR 100 ns; -- after 100 ns change inputs
    
    Instruction <= "110110000010";   --JZR 3,2
    Reg_Chk_Jmp <= "0001";
    WAIT ; -- after 100 ns change inputs
    
    
    
end process;

end Behavioral;
