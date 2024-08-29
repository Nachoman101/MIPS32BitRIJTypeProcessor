----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2024 04:57:22 PM
-- Design Name: 
-- Module Name: WriteBackMux - Behavioral
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

entity WriteBackMux is
    Port (ReadData: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          ALUOut: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          PCAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          MemtoReg: in STD_LOGIC_VECTOR(1 DOWNTO 0);
          DOut: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end WriteBackMux;

architecture Behavioral of WriteBackMux is

begin

--DOut <= ALUOut when MemtoReg = '0' else ReadData;
with MemToReg select
    DOut <= ALUOut when "00",
            ReadData when "01",
            PCAddr when "10",
            ALUOut when others;
            
            
            

end Behavioral;
