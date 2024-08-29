----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2024 07:38:21 PM
-- Design Name: 
-- Module Name: SignExt - Behavioral
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

entity SignExt is
    Port ( Immediate: in STD_LOGIC_VECTOR(15 DOWNTO 0);
           Output32Bit: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end SignExt;

architecture Behavioral of SignExt is

begin

--Output32Bit <= Immediate(15) & "0000000000000000" & Immediate(14 downto 0);
Output32Bit <= x"0000" & Immediate when Immediate(15) = '0' else
               x"FFFF" & Immediate;
               
end Behavioral;
