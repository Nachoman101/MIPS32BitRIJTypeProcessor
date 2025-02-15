----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2024 10:09:42 PM
-- Design Name: 
-- Module Name: ALUSrcMux - Behavioral
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

entity ALUSrcMux is
    Port (ReadRegister2: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          B: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          ALUSrc: in STD_LOGIC;
          BOperand: out STD_LOGIC_VECTOR(31 DOWNTO 0) );
end ALUSrcMux;

architecture Behavioral of ALUSrcMux is

begin

with ALUSrc select
    BOperand <= ReadRegister2 when '0',
                B when others;

end Behavioral;
