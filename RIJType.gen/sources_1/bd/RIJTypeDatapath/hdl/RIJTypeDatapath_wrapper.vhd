--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Aug  1 01:24:26 2024
--Host        : JaviOrd-Envy running 64-bit major release  (build 9200)
--Command     : generate_target RIJTypeDatapath_wrapper.bd
--Design      : RIJTypeDatapath_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RIJTypeDatapath_wrapper is
  port (
    CarryIn : in STD_LOGIC;
    CarryOut : out STD_LOGIC;
    Clock : in STD_LOGIC;
    DOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Enable : in STD_LOGIC;
    JumpTargetAddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpTargetAddressSrc : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Overflow : out STD_LOGIC;
    PCNewAddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PCOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RSAddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Reset : in STD_LOGIC;
    Zero : out STD_LOGIC
  );
end RIJTypeDatapath_wrapper;

architecture STRUCTURE of RIJTypeDatapath_wrapper is
  component RIJTypeDatapath is
  port (
    Clock : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Enable : in STD_LOGIC;
    CarryIn : in STD_LOGIC;
    Zero : out STD_LOGIC;
    Overflow : out STD_LOGIC;
    CarryOut : out STD_LOGIC;
    DOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PCOut : out STD_LOGIC_VECTOR ( 31 downto 0 );
    PCNewAddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    RSAddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpTargetAddressSrc : out STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpTargetAddress : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath;
begin
RIJTypeDatapath_i: component RIJTypeDatapath
     port map (
      CarryIn => CarryIn,
      CarryOut => CarryOut,
      Clock => Clock,
      DOut(31 downto 0) => DOut(31 downto 0),
      Enable => Enable,
      JumpTargetAddress(31 downto 0) => JumpTargetAddress(31 downto 0),
      JumpTargetAddressSrc(31 downto 0) => JumpTargetAddressSrc(31 downto 0),
      Overflow => Overflow,
      PCNewAddr(31 downto 0) => PCNewAddr(31 downto 0),
      PCOut(31 downto 0) => PCOut(31 downto 0),
      RSAddress(31 downto 0) => RSAddress(31 downto 0),
      Reset => Reset,
      Zero => Zero
    );
end STRUCTURE;
