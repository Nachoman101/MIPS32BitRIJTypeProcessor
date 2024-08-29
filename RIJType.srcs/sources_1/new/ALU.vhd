----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2024 05:11:17 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port( A : in STD_LOGIC_VECTOR(31 DOWNTO 0);
          B : in STD_LOGIC_VECTOR(31 DOWNTO 0);
          ALUCntl : in STD_LOGIC_VECTOR(3 DOWNTO 0);
          Shamt: in STD_LOGIC_VECTOR(4 DOWNTO 0);
          Carryin: in STD_LOGIC;
          Zero: out STD_LOGIC; 
          Overflow: out STD_LOGIC;
          Carryout: out STD_LOGIC;
          ALUOut: out STD_LOGIC_VECTOR(31 DOWNTO 0)          
    );
end ALU;

architecture Behavioral of ALU is
signal output: STD_LOGIC_VECTOR(31 downto 0);
signal ofl,co,z: STD_LOGIC;
signal sum,difference: STD_LOGIC_VECTOR(32 DOWNTO 0);
signal shll,shrl,slt,sltu: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal shiftAmount: integer range 0 to 31;
signal temp_C : std_logic_vector(32 downto 0) := (others => '0');
begin
with ALUCntl select
    output <= A and B when "0000",
           A or B when "0001",
           A xor B when "0010",
           A nor B when "0011",
           sum(31 DOWNTO 0) when "0100",
           difference(31 DOWNTO 0) when "0101",
           shll when "0110",
           shrl when "0111",
           slt when "1000",
           sltu when "1001",
           A when others;
           
temp_C(0) <= Carryin;
sum <= STD_LOGIC_VECTOR(signed('0'&A) +signed('0'&B) + signed(temp_C));
difference <= STD_LOGIC_VECTOR(signed('0'&A) -signed('0'&B));
shll <= STD_LOGIC_VECTOR(shift_left(unsigned(B),natural(to_integer(unsigned(Shamt)))));
shrl <= STD_LOGIC_VECTOR(shift_right(unsigned(B),natural(to_integer(unsigned(Shamt)))));
slt <= x"00000001" when signed(A) < signed(B) else x"00000000";
sltu <= x"00000001" when unsigned(A) < unsigned(B) else x"00000000";

z <= '1' when output = x"00000000" ELSE
     '0';
     
co <= sum(32); --Perhaps limit this to ONLY Addition and Subtraction functions

ofl <= ( (not(A(31)) and not(B(31)) and output(31)) or (A(31) and B(31) and not(output(31))) ) when ALUcntl = "0100" else
                ( (not(A(31)) and B(31) and output(31)) or (A(31) and not(B(31)) and not(output(31))) ) when ALUcntl = "0101" else
                '0';

ALUOut <= output;
Zero <= z;
Carryout <= co;
Overflow <= ofl;
end Behavioral;
