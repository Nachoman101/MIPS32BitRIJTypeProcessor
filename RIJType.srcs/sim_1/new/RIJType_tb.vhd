----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/18/2023 12:25:30 PM
-- Design Name: 
-- Module Name: Lab4_tb - Behavioral
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

entity RIJType_tb is
end RIJType_tb;

architecture Behavioral of RIJType_tb is

signal Clock     : std_logic;
signal CarryIn     : std_logic;
signal Reset      : std_logic;
signal Enable       : std_logic;
signal Zero     : std_logic;
signal Overflow : std_logic;
signal Carryout : std_logic;
--signal WriteReg: STD_LOGIC_VECTOR(4 DOWNTO 0);
--signal ALUOut: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal ALUOp: STD_LOGIC_VECTOR(3 DOWNTO 0);
--signal Funct : STD_LOGIC_VECTOR ( 5 downto 0 );
--signal ALUOpControl : STD_LOGIC_VECTOR ( 2 downto 0 );
signal JumpTargetAddress: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal JumpTargetAddressSrc: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal PCNewAddr: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal RSAddress: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal Dout: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal PCOut: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal BranchAddr: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal InstructionAddr: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal SignExtend: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal ALUA: STD_LOGIC_VECTOR(31 DOWNTO 0);
--signal ALUB: STD_LOGIC_VECTOR(31 DOWNTO 0);
begin

RIJType_inst : entity work.RIJTypeDatapath_wrapper 
    port map(
      Clock => Clock,
      CarryIn => CarryIn,
      Carryout => Carryout,
      Enable => Enable,
      Overflow => Overflow,
      Reset => Reset,
      Zero => Zero,
      --ALUOut => ALUOut,
      PCOut => PCOut,
      JumpTargetAddress => JumpTargetAddress,
      JumpTargetAddressSrc => JumpTargetAddressSrc,
      PCNewAddr => PCNewAddr,
      RSAddress => RSAddress,
--      SignExtend => SignExtend,
--      BranchAddr => BranchAddr,
--      InstructionAddr => InstructionAddr,
      Dout => Dout
      --WriteReg => WriteReg,
--      ALUOp => ALUOp,
--      ALUA => ALUA,
--      ALUB => ALUB
      --ALUOpControl => ALUOpControl,
      --Funct => Funct
    );
    
simulation : process begin

reset <= '0';
enable <= '1';
clock <= '0';
carryin <= '0';
wait for 10 ns;

for i in 0 to 103 loop
    clock <= '1';
    wait for 10 ns;
    clock <= '0';
    wait for 10 ns;
end loop;

end process;    

--clk : process begin
--    Clock <= '0';
--    wait for 10 ns;
--    Clock <= '1';
--    wait for 10 ns;
--end process;
    
--simulation : process begin
----    rst <= '1';
----    en <= '0';
----    wait for 20 ns;
--    carryin <= '0';
--    Reset <= '0';
--    Enable <= '1';
--    wait for 500 ns;
--end process;    

end Behavioral;
