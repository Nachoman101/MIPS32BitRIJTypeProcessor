----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2024 09:21:09 PM
-- Design Name: 
-- Module Name: ALU_Control - Behavioral
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

entity ALU_Control is
    Port (Funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
          ALUOp: in STD_LOGIC_VECTOR(2 DOWNTO 0);
          ALUCntl: out STD_LOGIC_VECTOR(3 DOWNTO 0) );
end ALU_Control;

architecture Behavioral of ALU_Control is

signal ALUControlSignalFunct: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal ALUControlSignalALUOp: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal ALUControlSignal: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

--process(Funct,ALUOp)
--begin

--if(ALUOp = "000") then --R Type Instruction, look at format
--    ALUControlSignal <= ALUControlSignalFunct;
--else 
--    ALUControlSignal <= ALUControlSignalALUOp;
--end if;


--end process;

ALUControlSignal <= ALUControlSignalFunct when ALUOp = "000" else ALUControlSignalALUOp;

with Funct select
    ALUControlSignalFunct <= "0000" when "100100", --And
                        "0001" when "100101", --Or
                        "0010" when "100110", --XOR
                        "0011" when "100111", --nor
                        "0100" when "100000", --add
                        "0100" when "100001", --addu
                        "0101" when "100010", --sub
                        "0101" when "100011", --sub u
                        "0110" when "000000", --sll
                        "0111" when "000010", --srl
                        "1000" when "101010", --slt
                        "1001" when "101011", --sltu
                        "0000" when others;

with ALUOp select
    ALUControlSignalALUOp <= "0000" when "001", --And Immediate 
                             "0001" when "010", --Or Immediate
                             "0100" when "011", --Add Immediate
                             "1000" when "100", --Set Less Than Immediate
                             "1001" when "101", --Set Less Than Immediate Unsigned
                             "0101" when "110", --BEQ and BNE
                             "1111" when others;
ALUCntl <= ALUControlSignal;

end Behavioral;
