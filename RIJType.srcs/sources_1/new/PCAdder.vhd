----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2024 08:22:33 PM
-- Design Name: 
-- Module Name: PCAdder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCAdder is
    Port ( CurrAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
           NextAddr: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end PCAdder;

architecture Behavioral of PCAdder is

signal NewAddress: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

NewAddress <= STD_LOGIC_VECTOR(unsigned(CurrAddr) + x"00000004");

NextAddr <= NewAddress;
end Behavioral;
