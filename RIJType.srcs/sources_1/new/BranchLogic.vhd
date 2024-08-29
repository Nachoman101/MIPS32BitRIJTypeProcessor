----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/28/2024 02:43:46 AM
-- Design Name: 
-- Module Name: BranchLogic - Behavioral
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

entity BranchLogic is
    Port (Branch: in STD_LOGIC_VECTOR(1 DOWNTO 0);
          Zero: in STD_LOGIC;
          BranchOut: out STD_LOGIC );
end BranchLogic;

architecture Behavioral of BranchLogic is

begin

BranchOut <= '0' when Branch = "11" else
             '1' when (Branch = "00" and Zero = '1') else --BEQ
             '1' when (Branch = "01" and Zero = '0') else -- BNE
             '0';

end Behavioral;
