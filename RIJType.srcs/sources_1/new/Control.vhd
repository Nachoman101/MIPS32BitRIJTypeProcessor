----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2024 08:39:30 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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

entity Control is
    Port ( Opcode: in STD_LOGIC_VECTOR(5 DOWNTO 0);
           RegWrite: out STD_LOGIC;
           ALUOp: out STD_LOGIC_VECTOR(2 DOWNTO 0);
           ALUSrc: out STD_LOGIC;
           RegDst: out STD_LOGIC_VECTOR(1 DOWNTO 0);
           MemtoReg: out STD_LOGIC_VECTOR(1 DOWNTO 0);
           MemRead: out STD_LOGIC;
           MemWrite: out STD_LOGIC;
           Branch: out STD_LOGIC_VECTOR(1 DOWNTO 0));
end Control;

architecture Behavioral of Control is

begin

with Opcode select
    Branch <= "00" when "000100", --BEQ
              "01" when "000101", --BNE
              "11" when others;

with Opcode select
--    RegWrite <= '0' when "111111",
--                '1' when others;
    RegWrite <= '0' when "101011", --Store Word
                '0' when "000101", --BEQ
                '0' when "000100", --BNE
                '0' when "000010", --Jump
                '1' when others;
--Regwrite <= '0' when Opcode = "101011" else
--            '0' when Opcode = "000101" else
--            '0' when Opcode = "000100" else
--            '0' when Opcode = "000010" else
--            '0' when (Opcode = "000000" and Funct = "0

with Opcode select
    RegDst <= "00" when "000000", --R Type
              "10" when "000011", -- jal
              "01" when others; 
              
with Opcode select
    ALUSrc <= '0' when "000000",
              '0' when "000100",
              '0' when "000101",
              '1' when others;

with Opcode select
    ALUOp <= "000" when "000000", --R type
             "001" when "001100", --And Immediate
             "010" when "001101", --Or Immediate
             "011" when "001000", --Add Immediate
             "011" when "001001", --Add Immediate Unsigned
             "100" when "001010", --Set Less Than Immediate
             "101" when "001011", --Set Less Than Immmediate Unsigned
             "011" when "100011", --Load Word
             "011" when "101011", --Store Word
             "110" when "000100", --BEQ
             "110" when "000101", --BNE
             "111" when others;
             
with Opcode select 
    MemtoReg <= "01" when "100011",
                "10" when "000011",
                "00" when others;
             
with Opcode select
    MemRead <= '1' when "100011",
               '0' when others;
               
with Opcode select
    MemWrite <= '1' when "101011",
                '0' when others;

end Behavioral;
