# Intro_to_computer_systems

[TOC]

## Assembly

A register can hold 32 bits = 4 bytes = 1 word 

`add`

`sub`

`addi`

`$0` or `$zero`: register zero (always be 0) --> copy value



#### Data transfer instructions

`lw $t0,8($s0)`: load word to $t0 from location 8 + $s0 (Memory to Reg)

`sw $t0,8($s0)`: store value in $t0 at address 8 + $s0 (Reg to Memory)

`$s0`: base integer; `8`: offset



#### Conditional branches

`beq r1, r2, L1`: if r1 == r2 then go to L1

`bne`: if r1!= r2 

`j label`: jump to a label

`sll`: shift logical left (for multiplication of 2^n)

`slt reg1, reg2, reg3`: "Set on Less Than"

- if reg2 < reg3 then reg1 = 1
- else reg1 = 0

`slti reg1, reg2, const`: compare with a `const`

`sltu`: `u` means unsigned 

`sltiu`: combination of two options above



#### Logical Operators

`and`, `andi`

`or`, `ori`

Put the hexadecimal `0xFFF`



`sll`: "shift left logical"

`srl`: "shift right logical"

`sra`: "shift right arithmetic"

[difference between logical and arithmetic shift](https://open4tech.com/logical-vs-arithmetic-shift/)



#### Function

`$ra`: Return address

`$a1 ... $a3`: Arguments

`$v1, $v2`: Return values

`$s1 ... $s7`: Local variables



`jr $ra`: tell the system to continue at `$ra`

```assembly
addi $ra, $zero, 1016
j sum
```

`jal sum` is an equivalent statement (Link and jump)

`jr reg`: jump register (jumps back to that address `$ra`)

 

#### Nested procedures







