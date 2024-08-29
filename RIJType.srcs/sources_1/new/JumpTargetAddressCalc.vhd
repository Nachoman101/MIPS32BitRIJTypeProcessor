----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/29/2024 06:59:41 PM
-- Design Name: 
-- Module Name: JumpTargetAddressCalc - Behavioral
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

entity JumpTargetAddressCalc is
    Port (AddressShifted: in STD_LOGIC_VECTOR(25 DOWNTO 0);
          PCAddressPlus4: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          JumpTargetAddress: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end JumpTargetAddressCalc;

architecture Behavioral of JumpTargetAddressCalc is
signal AddressShiftedAfter: STD_LOGIC_VECTOR(27 DOWNTO 0);
begin
AddressShiftedAfter <= AddressShifted & "00";

JumpTargetAddress <= PCAddressPlus4(31 DOWNTO 28) & AddressShiftedAfter;

end Behavioral;
