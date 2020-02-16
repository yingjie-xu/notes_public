# Intro_to_computer_systems

[TOC]

## IEEE floating point standard

#### Two's complement 

Invert all the bits and add one to the last bit (Find the negative value of the same number)



#### Single precision (32 bits = 4 bytes)

- 1 bit: **sign** (0: positive, 1: negative)
- 8 bits: **exponent** 
- 23 bits: **significand** (we don't keep 1 for the significand) --> change to scientific notation and keep all the bits after the decimal point.

**Exponent code = exponent value + bias (127)**

- exponent = 00000000
  - denormalized number: assume the first bit in the scientific notation is 0
- exponent = 11111111
  - if significand is all 0's --> +- infinity
  - else: NaN (not a number)



## Assembly

**A register can hold 32 bits = 4 bytes = 1 word** 

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

`$zero`: constant zero

`$a0 ... $a3`: Arguments

`$v0, $v1`: Return values

`$s0 ... $s7`: Local variables (no change when calling functions)

`$t0 ... $t7`: temporary values

`$sp`: stack pointer



#### jump

`jr $ra`: tell the system to continue at `$ra`

```assembly
addi $ra, $zero, 1016
j sum
```

`jal sum` is an equivalent statement (Link and jump)

`jr reg`: jump register (jumps back to that address `$ra`)

 

#### Nested procedures (recall slide procedures)

Memory allocation: Stack (`$sp` stack pointer), Heap, Static, Code

```assembly
addi $sp, $sp, -8  #allocate space on the stack
sw $ra, 4($sp)     #save the return address
sw $a1, 0($sp)     #save arg1

# call the sub-procedure here

lw $ra, 4($sp)     #restore the return address
lw $a1, 0($sp)     #restore arg1
addi $sp, $sp, 8   #restore stack
jr $ra             #go back
```

Steps:

1. save necessary values onto stack
2. assign arguments
3. `jal` call for the sub-procedure
4. restore values from stack (and restore the stack)













