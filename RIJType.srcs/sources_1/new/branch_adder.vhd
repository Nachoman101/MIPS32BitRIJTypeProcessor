----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2024 08:17:43 PM
-- Design Name: 
-- Module Name: branch_adder - Behavioral
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

entity branch_adder is
    Port (InstructionAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          SignExtend: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          BranchAddr: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end branch_adder;

architecture Behavioral of branch_adder is
signal shll: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal twoShift: STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000010";
begin


--BranchAddr <= STD_LOGIC_VECTOR(signed(InstructionAddr) + signed(shll));

BranchAddr <= STD_LOGIC_VECTOR(unsigned(InstructionAddr) + unsigned(shll));

--shll <= STD_LOGIC_VECTOR(shift_left(unsigned(SignExtend),natural(to_integer(unsigned(twoShift)))));
shll <= SignExtend(29 DOWNTO 0) & "00";


end Behavioral;
