----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2024 08:59:35 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port (NextAddr: in STD_LOGIC_VECTOR(31 DOWNTO 0);
          RST: in STD_LOGIC;
          EN: in STD_LOGIC;
          CLK: in STD_LOGIC;
          CurrAddr: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
signal addressRegister: STD_LOGIC_VECTOR(31 DOWNTO 0):= x"00000000";
begin
process(CLK)
    begin
    
    if(rising_edge(CLK)) then
        if(RST = '1') then
            addressRegister <= x"00000000";
        elsif(EN = '1') then 
            addressRegister <= NextAddr;
        end if;
    end if;
    
end process;

CurrAddr <= addressRegister;

end Behavioral;
