----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2024 02:57:20 AM
-- Design Name: 
-- Module Name: BranchMux - Behavioral
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

entity BranchMux is
    Port (BranchAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          PCAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          BranchOut: in STD_LOGIC;
          NextAddr: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end BranchMux;

architecture Behavioral of BranchMux is

begin

with BranchOut select
    NextAddr <= BranchAddr when '1',
                PCAddr when others;
                
end Behavioral;
