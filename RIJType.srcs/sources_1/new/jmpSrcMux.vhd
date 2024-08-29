----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/29/2024 10:32:55 PM
-- Design Name: 
-- Module Name: jmpSrcMux - Behavioral
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

entity jmpSrcMux is
    Port ( JumpTargetAddressSrc: in STD_LOGIC_VECTOR(31 DOWNTO 0);
           RSAddress: in STD_LOGIC_VECTOR(31 DOWNTO 0);
           JumpSrc: in STD_LOGIC;
           JumpTargetAddress: out STD_LOGIC_VECTOR(31 DOWNTO 0)
           );
end jmpSrcMux;

architecture Behavioral of jmpSrcMux is

begin

JumpTargetAddress <= JumpTargetAddressSrc when JumpSrc = '0' else RSAddress;

end Behavioral;
