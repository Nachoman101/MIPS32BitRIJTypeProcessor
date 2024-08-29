----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/29/2024 08:10:22 PM
-- Design Name: 
-- Module Name: jumpOutMux - Behavioral
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

entity jumpOutMux is
    Port (JumpTargetAddress: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          NextAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          JumpOut: in STD_LOGIC;
          PCNextAddr: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end jumpOutMux;

architecture Behavioral of jumpOutMux is

begin

PCNextAddr <= NextAddr when JumpOut = '0' else JumpTargetAddress;

end Behavioral;
