----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/29/2024 07:46:07 PM
-- Design Name: 
-- Module Name: jumpLogic - Behavioral
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

entity jumpLogic is
    Port (Opcode: in STD_LOGIC_VECTOR(5 DOWNTO 0);
          Funct: in STD_LOGIC_VECTOR(5 DOWNTO 0);
          JumpSrc: out STD_LOGIC;
          JumpOut: out STD_LOGIC );
end jumpLogic;

architecture Behavioral of jumpLogic is

begin

JumpOut <= '1' when Opcode = "000010" else 
           '1' when (Opcode = "000000" and Funct = "001000") else
           '1' when Opcode = "000011" else --Just added for part 3
           '0';

JumpSrc <= '0' when Opcode = "000010" else
           '0' when Opcode = "000011" else -- Just added for a part 3
           '1' when (Opcode = "000000" and Funct = "001000") else
           '1';

end Behavioral;
