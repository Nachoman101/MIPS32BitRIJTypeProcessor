--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Aug  1 01:24:26 2024
--Host        : JaviOrd-Envy running 64-bit major release  (build 9200)
--Command     : generate_target RIJTypeDatapath.bd
--Design      : RIJTypeDatapath
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RIJTypeDatapath is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of RIJTypeDatapath : entity is "RIJTypeDatapath,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=RIJTypeDatapath,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=28,numReposBlks=28,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=19,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of RIJTypeDatapath : entity is "RIJTypeDatapath.hwdef";
end RIJTypeDatapath;

architecture STRUCTURE of RIJTypeDatapath is
  component RIJTypeDatapath_PCAdder_0_0 is
  port (
    CurrAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    NextAddr : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_PCAdder_0_0;
  component RIJTypeDatapath_ALU_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ALUCntl : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Shamt : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Carryin : in STD_LOGIC;
    Zero : out STD_LOGIC;
    Overflow : out STD_LOGIC;
    Carryout : out STD_LOGIC;
    ALUOut : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_ALU_0_0;
  component RIJTypeDatapath_ALUSrcMux_0_0 is
  port (
    ReadRegister2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ALUSrc : in STD_LOGIC;
    BOperand : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_ALUSrcMux_0_0;
  component RIJTypeDatapath_ALU_Control_0_0 is
  port (
    Funct : in STD_LOGIC_VECTOR ( 5 downto 0 );
    ALUOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ALUCntl : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component RIJTypeDatapath_ALU_Control_0_0;
  component RIJTypeDatapath_BranchLogic_0_0 is
  port (
    Branch : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Zero : in STD_LOGIC;
    BranchOut : out STD_LOGIC
  );
  end component RIJTypeDatapath_BranchLogic_0_0;
  component RIJTypeDatapath_BranchMux_0_0 is
  port (
    BranchAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PCAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BranchOut : in STD_LOGIC;
    NextAddr : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_BranchMux_0_0;
  component RIJTypeDatapath_Control_0_0 is
  port (
    Opcode : in STD_LOGIC_VECTOR ( 5 downto 0 );
    RegWrite : out STD_LOGIC;
    ALUOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ALUSrc : out STD_LOGIC;
    RegDst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MemtoReg : out STD_LOGIC_VECTOR ( 1 downto 0 );
    MemRead : out STD_LOGIC;
    MemWrite : out STD_LOGIC;
    Branch : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component RIJTypeDatapath_Control_0_0;
  component RIJTypeDatapath_DataMem_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    WriteData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MemWrite : in STD_LOGIC;
    MemRead : in STD_LOGIC;
    ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_DataMem_0_0;
  component RIJTypeDatapath_InstMem_0_0 is
  port (
    addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    inst_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_InstMem_0_0;
  component RIJTypeDatapath_ProgramCounter_0_0 is
  port (
    NextAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RST : in STD_LOGIC;
    EN : in STD_LOGIC;
    CLK : in STD_LOGIC;
    CurrAddr : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_ProgramCounter_0_0;
  component RIJTypeDatapath_RegDstMux_0_0 is
  port (
    RdRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RtRegister : in STD_LOGIC_VECTOR ( 4 downto 0 );
    RegDst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    WriteRegister : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component RIJTypeDatapath_RegDstMux_0_0;
  component RIJTypeDatapath_RegFile_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    write_en : in STD_LOGIC;
    read_reg1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    read_reg2 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    write_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    write_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    read_data1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    read_data2 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_RegFile_0_0;
  component RIJTypeDatapath_SignExt_0_0 is
  port (
    Immediate : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Output32Bit : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_SignExt_0_0;
  component RIJTypeDatapath_WriteBackMux_0_0 is
  port (
    ReadData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ALUOut : in STD_LOGIC_VECTOR ( 31 downto 0 );
    PCAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MemtoReg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DOut : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_WriteBackMux_0_0;
  component RIJTypeDatapath_branch_adder_0_0 is
  port (
    InstructionAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    SignExtend : in STD_LOGIC_VECTOR ( 31 downto 0 );
    BranchAddr : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_branch_adder_0_0;
  component RIJTypeDatapath_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_0_0;
  component RIJTypeDatapath_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_1_0;
  component RIJTypeDatapath_xlslice_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_2_0;
  component RIJTypeDatapath_xlslice_3_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_3_0;
  component RIJTypeDatapath_xlslice_4_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_4_0;
  component RIJTypeDatapath_xlslice_5_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_5_0;
  component RIJTypeDatapath_xlslice_6_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_6_0;
  component RIJTypeDatapath_JumpTargetAddressCalc_0_0 is
  port (
    AddressShifted : in STD_LOGIC_VECTOR ( 25 downto 0 );
    PCAddressPlus4 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpTargetAddress : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_JumpTargetAddressCalc_0_0;
  component RIJTypeDatapath_jumpLogic_0_0 is
  port (
    Opcode : in STD_LOGIC_VECTOR ( 5 downto 0 );
    Funct : in STD_LOGIC_VECTOR ( 5 downto 0 );
    JumpSrc : out STD_LOGIC;
    JumpOut : out STD_LOGIC
  );
  end component RIJTypeDatapath_jumpLogic_0_0;
  component RIJTypeDatapath_jumpOutMux_0_0 is
  port (
    JumpTargetAddress : in STD_LOGIC_VECTOR ( 31 downto 0 );
    NextAddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpOut : in STD_LOGIC;
    PCNextAddr : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_jumpOutMux_0_0;
  component RIJTypeDatapath_xlslice_7_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 25 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_7_0;
  component RIJTypeDatapath_xlslice_8_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component RIJTypeDatapath_xlslice_8_0;
  component RIJTypeDatapath_jmpSrcMux_0_0 is
  port (
    JumpTargetAddressSrc : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RSAddress : in STD_LOGIC_VECTOR ( 31 downto 0 );
    JumpSrc : in STD_LOGIC;
    JumpTargetAddress : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component RIJTypeDatapath_jmpSrcMux_0_0;
  signal ALUSrcMux_0_BOperand : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ALU_0_ALUOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ALU_0_Carryout : STD_LOGIC;
  signal ALU_0_Overflow : STD_LOGIC;
  signal ALU_0_Zero : STD_LOGIC;
  signal ALU_Control_0_ALUCntl : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal BranchLogic_0_BranchOut : STD_LOGIC;
  signal BranchMux_0_NextAddr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal CarryIn_1 : STD_LOGIC;
  signal Clock_1 : STD_LOGIC;
  signal Control_0_ALUOp : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal Control_0_ALUSrc : STD_LOGIC;
  signal Control_0_Branch : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Control_0_MemRead : STD_LOGIC;
  signal Control_0_MemWrite : STD_LOGIC;
  signal Control_0_MemtoReg : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Control_0_RegDst : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Control_0_RegWrite : STD_LOGIC;
  signal DataMem_0_ReadData : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Enable_1 : STD_LOGIC;
  signal InstMem_0_inst_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal JumpTargetAddressCalc_0_JumpTargetAddress : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal PCAdder_0_NextAddr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ProgramCounter_0_CurrAddr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegDstMux_0_WriteRegister : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal RegFile_0_read_data1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal RegFile_0_read_data2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Reset_1 : STD_LOGIC;
  signal SignExt_0_Output32Bit : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal WriteBackMux_0_DOut : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal branch_adder_0_BranchAddr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal jmpSrcMux_0_JumpTargetAddress : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal jumpLogic_0_JumpOut : STD_LOGIC;
  signal jumpLogic_0_JumpSrc : STD_LOGIC;
  signal jumpOutMux_0_PCNextAddr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_3_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_4_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_5_Dout : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal xlslice_6_Dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal xlslice_7_Dout : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal xlslice_8_Dout : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CarryIn : signal is "xilinx.com:signal:data:1.0 DATA.CARRYIN DATA";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CarryIn : signal is "XIL_INTERFACENAME DATA.CARRYIN, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of CarryOut : signal is "xilinx.com:signal:data:1.0 DATA.CARRYOUT DATA";
  attribute X_INTERFACE_PARAMETER of CarryOut : signal is "XIL_INTERFACENAME DATA.CARRYOUT, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Clock : signal is "xilinx.com:signal:data:1.0 DATA.CLOCK DATA";
  attribute X_INTERFACE_PARAMETER of Clock : signal is "XIL_INTERFACENAME DATA.CLOCK, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Enable : signal is "xilinx.com:signal:data:1.0 DATA.ENABLE DATA";
  attribute X_INTERFACE_PARAMETER of Enable : signal is "XIL_INTERFACENAME DATA.ENABLE, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Overflow : signal is "xilinx.com:signal:data:1.0 DATA.OVERFLOW DATA";
  attribute X_INTERFACE_PARAMETER of Overflow : signal is "XIL_INTERFACENAME DATA.OVERFLOW, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Reset : signal is "xilinx.com:signal:data:1.0 DATA.RESET DATA";
  attribute X_INTERFACE_PARAMETER of Reset : signal is "XIL_INTERFACENAME DATA.RESET, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Zero : signal is "xilinx.com:signal:data:1.0 DATA.ZERO DATA";
  attribute X_INTERFACE_PARAMETER of Zero : signal is "XIL_INTERFACENAME DATA.ZERO, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of DOut : signal is "xilinx.com:signal:data:1.0 DATA.DOUT DATA";
  attribute X_INTERFACE_PARAMETER of DOut : signal is "XIL_INTERFACENAME DATA.DOUT, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of JumpTargetAddress : signal is "xilinx.com:signal:data:1.0 DATA.JUMPTARGETADDRESS DATA";
  attribute X_INTERFACE_PARAMETER of JumpTargetAddress : signal is "XIL_INTERFACENAME DATA.JUMPTARGETADDRESS, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of JumpTargetAddressSrc : signal is "xilinx.com:signal:data:1.0 DATA.JUMPTARGETADDRESSSRC DATA";
  attribute X_INTERFACE_PARAMETER of JumpTargetAddressSrc : signal is "XIL_INTERFACENAME DATA.JUMPTARGETADDRESSSRC, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of PCNewAddr : signal is "xilinx.com:signal:data:1.0 DATA.PCNEWADDR DATA";
  attribute X_INTERFACE_PARAMETER of PCNewAddr : signal is "XIL_INTERFACENAME DATA.PCNEWADDR, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of PCOut : signal is "xilinx.com:signal:data:1.0 DATA.PCOUT DATA";
  attribute X_INTERFACE_PARAMETER of PCOut : signal is "XIL_INTERFACENAME DATA.PCOUT, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of RSAddress : signal is "xilinx.com:signal:data:1.0 DATA.RSADDRESS DATA";
  attribute X_INTERFACE_PARAMETER of RSAddress : signal is "XIL_INTERFACENAME DATA.RSADDRESS, LAYERED_METADATA undef";
begin
  CarryIn_1 <= CarryIn;
  CarryOut <= ALU_0_Carryout;
  Clock_1 <= Clock;
  DOut(31 downto 0) <= WriteBackMux_0_DOut(31 downto 0);
  Enable_1 <= Enable;
  JumpTargetAddress(31 downto 0) <= jmpSrcMux_0_JumpTargetAddress(31 downto 0);
  JumpTargetAddressSrc(31 downto 0) <= JumpTargetAddressCalc_0_JumpTargetAddress(31 downto 0);
  Overflow <= ALU_0_Overflow;
  PCNewAddr(31 downto 0) <= jumpOutMux_0_PCNextAddr(31 downto 0);
  PCOut(31 downto 0) <= ProgramCounter_0_CurrAddr(31 downto 0);
  RSAddress(31 downto 0) <= RegFile_0_read_data1(31 downto 0);
  Reset_1 <= Reset;
  Zero <= ALU_0_Zero;
ALUSrcMux_0: component RIJTypeDatapath_ALUSrcMux_0_0
     port map (
      ALUSrc => Control_0_ALUSrc,
      B(31 downto 0) => SignExt_0_Output32Bit(31 downto 0),
      BOperand(31 downto 0) => ALUSrcMux_0_BOperand(31 downto 0),
      ReadRegister2(31 downto 0) => RegFile_0_read_data2(31 downto 0)
    );
ALU_0: component RIJTypeDatapath_ALU_0_0
     port map (
      A(31 downto 0) => RegFile_0_read_data1(31 downto 0),
      ALUCntl(3 downto 0) => ALU_Control_0_ALUCntl(3 downto 0),
      ALUOut(31 downto 0) => ALU_0_ALUOut(31 downto 0),
      B(31 downto 0) => ALUSrcMux_0_BOperand(31 downto 0),
      Carryin => CarryIn_1,
      Carryout => ALU_0_Carryout,
      Overflow => ALU_0_Overflow,
      Shamt(4 downto 0) => xlslice_4_Dout(4 downto 0),
      Zero => ALU_0_Zero
    );
ALU_Control_0: component RIJTypeDatapath_ALU_Control_0_0
     port map (
      ALUCntl(3 downto 0) => ALU_Control_0_ALUCntl(3 downto 0),
      ALUOp(2 downto 0) => Control_0_ALUOp(2 downto 0),
      Funct(5 downto 0) => xlslice_6_Dout(5 downto 0)
    );
BranchLogic_0: component RIJTypeDatapath_BranchLogic_0_0
     port map (
      Branch(1 downto 0) => Control_0_Branch(1 downto 0),
      BranchOut => BranchLogic_0_BranchOut,
      Zero => ALU_0_Zero
    );
BranchMux_0: component RIJTypeDatapath_BranchMux_0_0
     port map (
      BranchAddr(31 downto 0) => branch_adder_0_BranchAddr(31 downto 0),
      BranchOut => BranchLogic_0_BranchOut,
      NextAddr(31 downto 0) => BranchMux_0_NextAddr(31 downto 0),
      PCAddr(31 downto 0) => PCAdder_0_NextAddr(31 downto 0)
    );
Control_0: component RIJTypeDatapath_Control_0_0
     port map (
      ALUOp(2 downto 0) => Control_0_ALUOp(2 downto 0),
      ALUSrc => Control_0_ALUSrc,
      Branch(1 downto 0) => Control_0_Branch(1 downto 0),
      MemRead => Control_0_MemRead,
      MemWrite => Control_0_MemWrite,
      MemtoReg(1 downto 0) => Control_0_MemtoReg(1 downto 0),
      Opcode(5 downto 0) => xlslice_0_Dout(5 downto 0),
      RegDst(1 downto 0) => Control_0_RegDst(1 downto 0),
      RegWrite => Control_0_RegWrite
    );
DataMem_0: component RIJTypeDatapath_DataMem_0_0
     port map (
      MemRead => Control_0_MemRead,
      MemWrite => Control_0_MemWrite,
      ReadData(31 downto 0) => DataMem_0_ReadData(31 downto 0),
      WriteData(31 downto 0) => RegFile_0_read_data2(31 downto 0),
      addr(31 downto 0) => ALU_0_ALUOut(31 downto 0),
      clk => Clock_1,
      en => Enable_1
    );
InstMem_0: component RIJTypeDatapath_InstMem_0_0
     port map (
      addr(31 downto 0) => ProgramCounter_0_CurrAddr(31 downto 0),
      inst_out(31 downto 0) => InstMem_0_inst_out(31 downto 0)
    );
JumpTargetAddressCalc_0: component RIJTypeDatapath_JumpTargetAddressCalc_0_0
     port map (
      AddressShifted(25 downto 0) => xlslice_7_Dout(25 downto 0),
      JumpTargetAddress(31 downto 0) => JumpTargetAddressCalc_0_JumpTargetAddress(31 downto 0),
      PCAddressPlus4(31 downto 0) => PCAdder_0_NextAddr(31 downto 0)
    );
PCAdder_0: component RIJTypeDatapath_PCAdder_0_0
     port map (
      CurrAddr(31 downto 0) => ProgramCounter_0_CurrAddr(31 downto 0),
      NextAddr(31 downto 0) => PCAdder_0_NextAddr(31 downto 0)
    );
ProgramCounter_0: component RIJTypeDatapath_ProgramCounter_0_0
     port map (
      CLK => Clock_1,
      CurrAddr(31 downto 0) => ProgramCounter_0_CurrAddr(31 downto 0),
      EN => Enable_1,
      NextAddr(31 downto 0) => jumpOutMux_0_PCNextAddr(31 downto 0),
      RST => Reset_1
    );
RegDstMux_0: component RIJTypeDatapath_RegDstMux_0_0
     port map (
      RdRegister(4 downto 0) => xlslice_3_Dout(4 downto 0),
      RegDst(1 downto 0) => Control_0_RegDst(1 downto 0),
      RtRegister(4 downto 0) => xlslice_2_Dout(4 downto 0),
      WriteRegister(4 downto 0) => RegDstMux_0_WriteRegister(4 downto 0)
    );
RegFile_0: component RIJTypeDatapath_RegFile_0_0
     port map (
      clk => Clock_1,
      en => Enable_1,
      read_data1(31 downto 0) => RegFile_0_read_data1(31 downto 0),
      read_data2(31 downto 0) => RegFile_0_read_data2(31 downto 0),
      read_reg1(4 downto 0) => xlslice_1_Dout(4 downto 0),
      read_reg2(4 downto 0) => xlslice_2_Dout(4 downto 0),
      write_data(31 downto 0) => WriteBackMux_0_DOut(31 downto 0),
      write_en => Control_0_RegWrite,
      write_reg(4 downto 0) => RegDstMux_0_WriteRegister(4 downto 0)
    );
SignExt_0: component RIJTypeDatapath_SignExt_0_0
     port map (
      Immediate(15 downto 0) => xlslice_5_Dout(15 downto 0),
      Output32Bit(31 downto 0) => SignExt_0_Output32Bit(31 downto 0)
    );
WriteBackMux_0: component RIJTypeDatapath_WriteBackMux_0_0
     port map (
      ALUOut(31 downto 0) => ALU_0_ALUOut(31 downto 0),
      DOut(31 downto 0) => WriteBackMux_0_DOut(31 downto 0),
      MemtoReg(1 downto 0) => Control_0_MemtoReg(1 downto 0),
      PCAddr(31 downto 0) => PCAdder_0_NextAddr(31 downto 0),
      ReadData(31 downto 0) => DataMem_0_ReadData(31 downto 0)
    );
branch_adder_0: component RIJTypeDatapath_branch_adder_0_0
     port map (
      BranchAddr(31 downto 0) => branch_adder_0_BranchAddr(31 downto 0),
      InstructionAddr(31 downto 0) => PCAdder_0_NextAddr(31 downto 0),
      SignExtend(31 downto 0) => SignExt_0_Output32Bit(31 downto 0)
    );
jmpSrcMux_0: component RIJTypeDatapath_jmpSrcMux_0_0
     port map (
      JumpSrc => jumpLogic_0_JumpSrc,
      JumpTargetAddress(31 downto 0) => jmpSrcMux_0_JumpTargetAddress(31 downto 0),
      JumpTargetAddressSrc(31 downto 0) => JumpTargetAddressCalc_0_JumpTargetAddress(31 downto 0),
      RSAddress(31 downto 0) => RegFile_0_read_data1(31 downto 0)
    );
jumpLogic_0: component RIJTypeDatapath_jumpLogic_0_0
     port map (
      Funct(5 downto 0) => xlslice_8_Dout(5 downto 0),
      JumpOut => jumpLogic_0_JumpOut,
      JumpSrc => jumpLogic_0_JumpSrc,
      Opcode(5 downto 0) => xlslice_0_Dout(5 downto 0)
    );
jumpOutMux_0: component RIJTypeDatapath_jumpOutMux_0_0
     port map (
      JumpOut => jumpLogic_0_JumpOut,
      JumpTargetAddress(31 downto 0) => jmpSrcMux_0_JumpTargetAddress(31 downto 0),
      NextAddr(31 downto 0) => BranchMux_0_NextAddr(31 downto 0),
      PCNextAddr(31 downto 0) => jumpOutMux_0_PCNextAddr(31 downto 0)
    );
xlslice_0: component RIJTypeDatapath_xlslice_0_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(5 downto 0) => xlslice_0_Dout(5 downto 0)
    );
xlslice_1: component RIJTypeDatapath_xlslice_1_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(4 downto 0) => xlslice_1_Dout(4 downto 0)
    );
xlslice_2: component RIJTypeDatapath_xlslice_2_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(4 downto 0) => xlslice_2_Dout(4 downto 0)
    );
xlslice_3: component RIJTypeDatapath_xlslice_3_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(4 downto 0) => xlslice_3_Dout(4 downto 0)
    );
xlslice_4: component RIJTypeDatapath_xlslice_4_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(4 downto 0) => xlslice_4_Dout(4 downto 0)
    );
xlslice_5: component RIJTypeDatapath_xlslice_5_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(15 downto 0) => xlslice_5_Dout(15 downto 0)
    );
xlslice_6: component RIJTypeDatapath_xlslice_6_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(5 downto 0) => xlslice_6_Dout(5 downto 0)
    );
xlslice_7: component RIJTypeDatapath_xlslice_7_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(25 downto 0) => xlslice_7_Dout(25 downto 0)
    );
xlslice_8: component RIJTypeDatapath_xlslice_8_0
     port map (
      Din(31 downto 0) => InstMem_0_inst_out(31 downto 0),
      Dout(5 downto 0) => xlslice_8_Dout(5 downto 0)
    );
end STRUCTURE;
