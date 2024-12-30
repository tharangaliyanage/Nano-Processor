----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:13:32 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

--Importing components================================

component SevenSeg_LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component Reg_Bank 
    Port ( Reg_en : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Input_D : in STD_LOGIC_VECTOR (3 downto 0);
       Q0 : out STD_LOGIC_VECTOR (3 downto 0);
       Q1 : out STD_LOGIC_VECTOR (3 downto 0);
       Q2 : out STD_LOGIC_VECTOR (3 downto 0);
       Q3 : out STD_LOGIC_VECTOR (3 downto 0);
       Q4 : out STD_LOGIC_VECTOR (3 downto 0);
       Q5 : out STD_LOGIC_VECTOR (3 downto 0);
       Q6 : out STD_LOGIC_VECTOR (3 downto 0);
       Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component AU 
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
       D1 : in STD_LOGIC_VECTOR (3 downto 0);
       D2 : in STD_LOGIC_VECTOR (3 downto 0);
       D3 : in STD_LOGIC_VECTOR (3 downto 0);
       D4 : in STD_LOGIC_VECTOR (3 downto 0);
       D5 : in STD_LOGIC_VECTOR (3 downto 0);
       D6 : in STD_LOGIC_VECTOR (3 downto 0);
       D7 : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_SelA : in STD_LOGIC_VECTOR (2 downto 0);
       Reg_SelB : in STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_Sel : in STD_LOGIC;
       Reg_Chk_Jmp : out STD_LOGIC_VECTOR (3 downto 0);
       RCA_out : out STD_LOGIC_VECTOR (3 downto 0);
       Overflow : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;


component Mux_2_to_1_4Bit 
    Port ( S : in STD_LOGIC;
       RCA_out : in STD_LOGIC_VECTOR (3 downto 0); --RCA
       Imm_Val : in STD_LOGIC_VECTOR (3 downto 0); --Immediate Value
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component Ins_Decoder 
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
       Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
       Load_sel : out STD_LOGIC;
       Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub_Sel : out STD_LOGIC;
       Jump_add : out STD_LOGIC_VECTOR (2 downto 0);
       Jump_flag : out STD_LOGIC;
       Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0));
end component;


component Program_ROM_LUT_8_12
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (11 downto 0));
end component;


component PC_3Bit
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
       En : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;


component RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0);
       C_out : out STD_LOGIC);
end component;


component Mux_2_to_1_3Bit
    Port ( S : in STD_LOGIC;
       D0 : in STD_LOGIC_VECTOR (2 downto 0);
       D1 : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;



--Declaring signals========================================

signal Imm_Val_Ins_to_Mux, RCA_out, Reg_Chk_Jmp, Data_Mux_to_Reg_Bank, Data_bus0, Data_bus1, Data_bus2, Data_bus3, Data_bus4, Data_bus5, Data_bus6, Data_bus7: STD_LOGIC_VECTOR(3 downto 0);
signal Ins_Bus : STD_LOGIC_VECTOR(11 downto 0);
signal Reg_bus, Mem_Bus, Reg_SelA , Reg_SelB, Count_Mux_to_PC, Mem_RCA3_to_Mux, Jmp_Add: STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub_Sel, Load_Select_Ins_to_Mux, C_out_RCA_3, Jmp_Flag: STD_LOGIC;
signal Slow_Clk_Signal: STD_LOGIC;



begin

--Port mapping=============================================================

SevenSeg_LUT_16_7_0 : SevenSeg_LUT_16_7
port map(
address => Data_bus7,
data => Seven_seg_out);

Slow_Clk_0 : Slow_Clk
port map (
    Clk_in => Clk,
    Clk_out => Slow_Clk_Signal);


Reg_Bank_0 : Reg_Bank
port map (
      Reg_en => Reg_bus,
      Clk => Slow_Clk_Signal,
      Reset => Reset,
      Input_D => Data_Mux_to_Reg_Bank,
      Q0 => Data_bus0,
      Q1 => Data_bus1,
      Q2 => Data_bus2,
      Q3 => Data_bus3,
      Q4 => Data_bus4,
      Q5 => Data_bus5,
      Q6 => Data_bus6,
      Q7 => Data_bus7 );

AU_0 : AU
port map (
    D0 => Data_bus0,
    D1 => Data_bus1,
    D2 => Data_bus2,
    D3 => Data_bus3,
    D4 => Data_bus4,
    D5 => Data_bus5,
    D6 => Data_bus6,
    D7 => Data_bus7,
    Reg_SelA => Reg_SelA,
    Reg_SelB => Reg_SelB,
    Add_Sub_Sel => Add_Sub_Sel,
    Reg_Chk_Jmp => Reg_Chk_Jmp,
    RCA_out => RCA_out,
    Overflow => Overflow,
    Zero => Zero
 );

Mux_2_to_1_4Bit_0 : Mux_2_to_1_4Bit
port map (
    S => Load_Select_Ins_to_Mux,
    RCA_out => RCA_out,
    Imm_Val => Imm_Val_Ins_to_Mux,
    Y => Data_Mux_to_Reg_Bank);

Program_ROM_LUT_8_12_0 : Program_ROM_LUT_8_12
port map (
    address => Mem_Bus,
    data => Ins_Bus);

PC_3Bit_0 : PC_3Bit
port map (
    D => Count_Mux_to_PC,
    EN => '1',
    Reset => Reset,
    Clk => Slow_Clk_Signal,
    Q => Mem_Bus);

RCA_3_0 : RCA_3
port map (
    A => Mem_Bus,
    C_in => '0',
    S => Mem_RCA3_to_Mux,
    C_out => C_out_RCA_3);

Mux_2_to_1_3Bit_0 : Mux_2_to_1_3Bit
port map (
    S => Jmp_Flag,
    D0 => Mem_RCA3_to_Mux,
    D1 => Jmp_Add,
    Y => Count_Mux_to_PC);

Ins_Decoder_0 : Ins_Decoder
port map (
    Instruction => Ins_Bus,
    Reg_en => Reg_bus,
    Load_sel => Load_Select_Ins_to_Mux,
    Imm_Val => Imm_Val_Ins_to_Mux,
    Reg_Sel_A => Reg_SelA,
    Reg_Sel_B => Reg_SelB,
    Add_Sub_Sel => Add_Sub_Sel,
    Jump_add => Jmp_Add,
    Jump_flag => Jmp_Flag,
    Reg_Chk_Jmp => Reg_Chk_Jmp);


R7 <= Data_bus7;

an <= "1110";

end Behavioral;
