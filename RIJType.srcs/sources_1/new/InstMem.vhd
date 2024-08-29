library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity InstMem is
    Port ( addr : in  STD_LOGIC_VECTOR (31 downto 0);
           inst_out : out  STD_LOGIC_VECTOR (31 downto 0));
end InstMem;

architecture Behavioral of InstMem is

--type Instruction_Memory is array (0 to 255) of std_logic_vector (7 downto 0);
--    signal RAM: Instruction_Memory:=(
--            x"01",x"2a",x"40",x"20",-- 0X00:  1:  add  $t0, $t1, $t2
--            x"01",x"4b",x"48",x"21",-- 0x04:  2:  addu $t1, $t2, $t3
--            x"01",x"6c",x"50",x"24",-- 0x08:  3:  and  $t2, $t3, $t4
--            x"01",x"8d",x"58",x"27",-- 0x0C:  4:  nor  $t3, $t4, $t5
--            x"01",x"ae",x"60",x"25",-- 0x10:  5:  or   $t4, $t5, $t6
--            x"01",x"cf",x"68",x"26",-- 0x14:  6:  xor  $t5, $t6, $t7 
--            x"02",x"32",x"80",x"22",-- 0x18:  7:  sub  $s0, $s1, $s2
--            x"02",x"53",x"88",x"23",-- 0x1C:  8:  subu $s1, $s2, $s3
--            x"02",x"74",x"90",x"2a",-- 0x20:  9:  slt  $s2, $s3, $s4
--            x"02",x"95",x"98",x"2b",-- 0x24:  10: sltu $s3, $s4, $s5
--            x"00",x"15",x"a2",x"80",-- 0X28:  11: sll  $s4, $s5, 10
--            x"00",x"16",x"aa",x"82",-- 0X2C:  12: srl  $s5, $s6, 10
--            x"00",x"00",x"00",x"00",-- 0X48: (empty location) 
--            x"00",x"00",x"00",x"00",-- 0X4C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x50: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x54: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x58: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x5C: (empty location)
--            x"30",x"08",x"00",x"01",-- 0X30:  13: andi $t0, $zero, 1
--            x"34",x"08",x"00",x"01",-- 0X34:  14: ori $t0, $zero, 1
--            x"20",x"08",x"00",x"01",-- 0X38:  15: addi $t0, $zero, 1 
--            x"24",x"08",x"00",x"03",-- 0X3C:  16: addiu $t0,$zero, 3 
--            x"28",x"08",x"FF",x"FF",-- 0X40:  17: slti $t0, $zero, 0xFFFF
--            x"2C",x"08",x"FF",x"FF",-- 0X44:  18: sltiu $t0, $zero, 0xFFFF
----            x"00",x"00",x"00",x"00",-- 0X48: (empty location) 
----            x"00",x"00",x"00",x"00",-- 0X4C: (empty location)
----            x"00",x"00",x"00",x"00",-- 0x50: (empty location)
----            x"00",x"00",x"00",x"00",-- 0x54: (empty location)
----            x"00",x"00",x"00",x"00",-- 0x58: (empty location)
----            x"00",x"00",x"00",x"00",-- 0x5C: (empty location)
--            x"8C",x"08",x"00",x"08",-- 0x60: lw $t0, 8($zero)
--            x"21",x"08",x"00",x"08",-- 0x64: addi $t0, $t0, 8
--            x"AC",x"08",x"00",x"08",-- 0x68: sw $t0, 8($zero)
--            x"00",x"00",x"00",x"00",-- 0x6C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x70: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x74: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x78: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x7C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x80: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x84: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x88: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x8C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x90: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x94: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x98: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x9C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xAC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xBC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xCC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xDC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xEC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF8: (empty location)
--            x"00",x"00",x"00",x"00" -- 0xFF: (empty location)
--            );

--type Instruction_Memory is array (0 to 255) of std_logic_vector (7 downto 0);
--    signal RAM: Instruction_Memory:=(
--            x"8c",x"08",x"00",x"00",-- 0X00         lw $t0, 0($zero) 
--            x"8c",x"09",x"00",x"04",-- 0X04         lw $t1, 4($zero) 
--            x"8c",x"0a",x"00",x"08",-- 0X08         lw $t2, 8($zero) 
--            x"8c",x"0b",x"00",x"0c",-- 0X0C         lw $t3, 12($zero) 
--            x"8c",x"0c",x"00",x"10",-- 0X10         lw $t4, 16($zero) 
--            x"8c",x"0d",x"00",x"14",-- 0X14         lw $t5, 20($zero) 
--            x"21",x"08",x"00",x"01",-- 0X18  insts: addi $t0, $t0, 1 
--            x"31",x"29",x"00",x"00",-- 0X1C         andi $t1, $t1, 0 
--            x"35",x"4a",x"00",x"07",-- 0X20         ori $t2, $t2, 7 
--            x"29",x"6b",x"00",x"09",-- 0X24         slti $t3, $t3, 9 
--            x"2d",x"8c",x"00",x"00",-- 0X28         sltiu $t4, $t4, 0 
--            x"01",x"a8",x"68",x"22",-- 0X2C         sub $t5, $t5, $t0 
--            x"11",x"a0",x"00",x"01",-- 0X30         beq  $t5, $zero, store
--            x"15",x"a0",x"ff",x"f8",-- 0X34         bne  $t5, $zero, insts
--            x"ac",x"08",x"00",x"00",-- 0X38  store: sw $t0, 24($zero) 
--            x"ac",x"09",x"00",x"04",-- 0X3C         sw $t1, 28($zero) 
--            x"ac",x"0a",x"00",x"08",-- 0X40         sw $t2, 32($zero) 
--            x"ac",x"0b",x"00",x"0c",-- 0X44         sw $t3, 36($zero) 
--            x"ac",x"0c",x"00",x"10",-- 0x48         sw $t4, 40($zero) 
--            x"ac",x"0d",x"00",x"14",-- 0x4C         sw $t5, 44($zero)
--            x"00",x"00",x"00",x"00",-- 0x50: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x54: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x58: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x5C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x60: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x64: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x68: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x6C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x70: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x74: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x78: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x7C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x80: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x84: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x88: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x8C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x90: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x94: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x98: (empty location)
--            x"00",x"00",x"00",x"00",-- 0x9C: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xA8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xAC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xB8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xBC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xC8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xCC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xD8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xDC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xE8: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xEC: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF0: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF4: (empty location)
--            x"00",x"00",x"00",x"00",-- 0xF8: (empty location)
--            x"00",x"00",x"00",x"00" -- 0xFF: (empty location)
--            );

type Instruction_Memory is array (0 to 255) of std_logic_vector (7 downto 0);
    signal RAM: Instruction_Memory:=(
            --x"21",x"08",x"00",x"01",-- 0X00  L1: addi $t0, $t0, 1
            --x"08",x"00",x"00",x"00",-- 0X04  j L1
--            x"00",x"00",x"F8",x"20",-- 0X00  add $ra, $zero, $zero
--            x"21",x"08",x"00",x"01",-- 0X04  addi $t0, $t0, 1
--            x"03",x"E0",x"00",x"08",-- 0X08  jr $ra
            x"00",x"00",x"40",x"20",-- 0X00         add  $t0, $zero, $zero 
            x"00",x"00",x"48",x"20",-- 0X04         add  $t1, $zero, $zero
            x"20",x"0a",x"00",x"02",-- 0X08         addi $t2, $zero, 2
            x"20",x"0b",x"00",x"14",-- 0X0C         addi $t3, $zero, 20 
            x"8d",x"04",x"00",x"00",-- 0X10  L1:    lw   $a0, 0($t0)  
            x"8d",x"05",x"00",x"04",-- 0X14         lw   $a1, 4($t0) 
            x"0c",x"00",x"00",x"0d",-- 0X18         jal  MULT
            x"ad",x"62",x"00",x"00",-- 0X1C         sw   $v0, 0($t3) 
            x"21",x"08",x"00",x"08",-- 0X20         addi $t0, $t0, 8
            x"21",x"6b",x"00",x"04",-- 0X24         addi $t3, $t3, 4
            x"21",x"29",x"00",x"01",-- 0X28         addi $t1, $t1, 1 
            x"15",x"2a",x"ff",x"f8",-- 0X2C         bne  $t1, $t2, L1 
            x"08",x"00",x"00",x"13",-- 0X30         j    DONE 
            x"00",x"00",x"80",x"20",-- 0X34  MULT:  add  $s0, $zero, $zero 
            x"00",x"42",x"10",x"22",-- 0X38         sub  $v0, $v0, $v0
            x"00",x"44",x"10",x"20",-- 0X3C  L2:	add  $v0, $v0, $a0        
            x"22",x"10",x"00",x"01",-- 0X40         addi $s0, $s0, 1
            x"16",x"05",x"ff",x"fd",-- 0X44         bne  $s0, $a1, L2 
            x"03",x"e0",x"00",x"08",-- 0X48         jr   $ra
            x"00",x"00",x"00",x"00",-- 0x4C         DONE:   nop   
            x"00",x"00",x"00",x"00",-- 0x50: (empty location)
            x"00",x"00",x"00",x"00",-- 0x54: (empty location)
            x"00",x"00",x"00",x"00",-- 0x58: (empty location)
            x"00",x"00",x"00",x"00",-- 0x5C: (empty location)
            x"00",x"00",x"00",x"00",-- 0x60: (empty location)
            x"00",x"00",x"00",x"00",-- 0x64: (empty location)
            x"00",x"00",x"00",x"00",-- 0x68: (empty location)
            x"00",x"00",x"00",x"00",-- 0x6C: (empty location)
            x"00",x"00",x"00",x"00",-- 0x70: (empty location)
            x"00",x"00",x"00",x"00",-- 0x74: (empty location)
            x"00",x"00",x"00",x"00",-- 0x78: (empty location)
            x"00",x"00",x"00",x"00",-- 0x7C: (empty location)
            x"00",x"00",x"00",x"00",-- 0x80: (empty location)
            x"00",x"00",x"00",x"00",-- 0x84: (empty location)
            x"00",x"00",x"00",x"00",-- 0x88: (empty location)
            x"00",x"00",x"00",x"00",-- 0x8C: (empty location)
            x"00",x"00",x"00",x"00",-- 0x90: (empty location)
            x"00",x"00",x"00",x"00",-- 0x94: (empty location)
            x"00",x"00",x"00",x"00",-- 0x98: (empty location)
            x"00",x"00",x"00",x"00",-- 0x9C: (empty location)
            x"00",x"00",x"00",x"00",-- 0xA0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xA4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xA8: (empty location)
            x"00",x"00",x"00",x"00",-- 0xAC: (empty location)
            x"00",x"00",x"00",x"00",-- 0xB0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xB4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xB8: (empty location)
            x"00",x"00",x"00",x"00",-- 0xBC: (empty location)
            x"00",x"00",x"00",x"00",-- 0xC0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xC4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xC8: (empty location)
            x"00",x"00",x"00",x"00",-- 0xCC: (empty location)
            x"00",x"00",x"00",x"00",-- 0xD0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xD4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xD8: (empty location)
            x"00",x"00",x"00",x"00",-- 0xDC: (empty location)
            x"00",x"00",x"00",x"00",-- 0xE0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xE4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xE8: (empty location)
            x"00",x"00",x"00",x"00",-- 0xEC: (empty location)
            x"00",x"00",x"00",x"00",-- 0xF0: (empty location)
            x"00",x"00",x"00",x"00",-- 0xF4: (empty location)
            x"00",x"00",x"00",x"00",-- 0xF8: (empty location)
            x"00",x"00",x"00",x"00" -- 0xFF: (empty location)
            );

begin

    inst_out(7 downto 0)    <= RAM(to_integer(unsigned(addr)+3));
    inst_out(15 downto 8)   <= RAM(to_integer(unsigned(addr)+2)); 
    inst_out(23 downto 16)  <= RAM(to_integer(unsigned(addr)+1));
    inst_out(31 downto 24)  <= RAM(to_integer(unsigned(addr)));

end Behavioral;