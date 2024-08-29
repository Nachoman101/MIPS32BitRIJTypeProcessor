transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib
vlib riviera/xlslice_v1_0_3

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlslice_v1_0_3 riviera/xlslice_v1_0_3

vcom -work xil_defaultlib -93  -incr \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_PCAdder_0_0/sim/RIJTypeDatapath_PCAdder_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_ALU_0_0/sim/RIJTypeDatapath_ALU_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_ALUSrcMux_0_0/sim/RIJTypeDatapath_ALUSrcMux_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_ALU_Control_0_0/sim/RIJTypeDatapath_ALU_Control_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_BranchLogic_0_0/sim/RIJTypeDatapath_BranchLogic_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_BranchMux_0_0/sim/RIJTypeDatapath_BranchMux_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_Control_0_0/sim/RIJTypeDatapath_Control_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_DataMem_0_0/sim/RIJTypeDatapath_DataMem_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_InstMem_0_0/sim/RIJTypeDatapath_InstMem_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_ProgramCounter_0_0/sim/RIJTypeDatapath_ProgramCounter_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_RegDstMux_0_0/sim/RIJTypeDatapath_RegDstMux_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_RegFile_0_0/sim/RIJTypeDatapath_RegFile_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_SignExt_0_0/sim/RIJTypeDatapath_SignExt_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_WriteBackMux_0_0/sim/RIJTypeDatapath_WriteBackMux_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_branch_adder_0_0/sim/RIJTypeDatapath_branch_adder_0_0.vhd" \

vlog -work xlslice_v1_0_3  -incr -v2k5 -l xil_defaultlib -l xlslice_v1_0_3 \
"../../../../RIJType.gen/sources_1/bd/RIJTypeDatapath/ipshared/217a/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlslice_v1_0_3 \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_0_0/sim/RIJTypeDatapath_xlslice_0_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_1_0/sim/RIJTypeDatapath_xlslice_1_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_2_0/sim/RIJTypeDatapath_xlslice_2_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_3_0/sim/RIJTypeDatapath_xlslice_3_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_4_0/sim/RIJTypeDatapath_xlslice_4_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_5_0/sim/RIJTypeDatapath_xlslice_5_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_6_0/sim/RIJTypeDatapath_xlslice_6_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_JumpTargetAddressCalc_0_0/sim/RIJTypeDatapath_JumpTargetAddressCalc_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_jumpLogic_0_0/sim/RIJTypeDatapath_jumpLogic_0_0.vhd" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_jumpOutMux_0_0/sim/RIJTypeDatapath_jumpOutMux_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xil_defaultlib -l xlslice_v1_0_3 \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_7_0/sim/RIJTypeDatapath_xlslice_7_0.v" \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_xlslice_8_0/sim/RIJTypeDatapath_xlslice_8_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/RIJTypeDatapath/ip/RIJTypeDatapath_jmpSrcMux_0_0/sim/RIJTypeDatapath_jmpSrcMux_0_0.vhd" \
"../../../bd/RIJTypeDatapath/sim/RIJTypeDatapath.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

