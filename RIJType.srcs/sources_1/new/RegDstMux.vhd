----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2024 09:56:07 PM
-- Design Name: 
-- Module Name: RegDstMux - Behavioral
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

entity RegDstMux is
    Port (RdRegister: in STD_LOGIC_VECTOR(4 DOWNTO 0);
          RtRegister: in STD_LOGIC_VECTOR(4 DOWNTO 0);
          RegDst: in STD_LOGIC_VECTOR(1 DOWNTO 0);
          WriteRegister: out STD_LOGIC_VECTOR(4 DOWNTO 0));
end RegDstMux;

architecture Behavioral of RegDstMux is

begin

with RegDst select
    WriteRegister <= RdRegister when "00",
                     RtRegister when "01",
                     "11111" when "10",
                     "00000" when others; 

end Behavioral;
