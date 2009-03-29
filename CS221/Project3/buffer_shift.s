.data
  # Buffers
  BInput:       .asciiz "                                                                                                                              ;"
  BProcessing:  .asciiz "                                                                                                                              ;"
  # String
  Seperator1:   .asciiz "]\n"
  Seperator2:   .asciiz "# ---- ---- ! ---- ---- #\n"

.text
main:
  main_start:
    la $a0, BInput($zero)
    li $v0, 4; syscall # print_string
    la $a0, Seperator1($zero)
    li $v0, 4; syscall # print_string
    
    la $a0, BProcessing($zero)
    li $v0, 4; syscall # print_string
    la $a0, Seperator1($zero)
    li $v0, 4; syscall # print_string
    
    la $a0, Seperator2($zero)
    li $v0, 4; syscall # print_string
    
    lb $t0, BInput($zero)
    beqz $t0, main_end
    
    la $ra, main_start
    la $a0, BInput($zero)
    la $a1, BProcessing($zero)
    j SHIFT
  main_end:
    li $v0, 10; syscall # exit

# Shifts an "array" string, seperated by semicolons.
# 
# Takes arguments of: an address to a null-terminated string as $a0, and an
# address to which the null-terminated "shiftee" string will be written as
# $a1.
SHIFT:
  addi $sp, $sp, -4
  sw $s0, 0($sp)
  move $s0, $ra
  SHIFT_start:
    la $ra, SHIFT_middle
    li $a2, 59
    j COPY_STRING
  SHIFT_middle:
    addi $v0, 1 # We don't want the terminator character
    la $ra, SHIFT_end
    move $a1, $a0
    move $a0, $v0
    li $a2, 0
    j COPY_STRING
  SHIFT_end:
    # This needs to be made "safe" by first pulling the old saved value from
    # the stack or whatever.
    move $ra, $s0
    lw $s0, 0($sp)
    addi $sp, $sp, 4
    j $ra

# Writes characters from one address to another.
# 
# Takes arguments of: an address to a string as $a0, an address to which the
# null-terminated string will be written as $a1, and an ASCII value at which
# to terminate the copy as $a2.
# 
# Will return the address of the terminator in the read string as $v0.
# 
# Note: If the the terminator is not found, the entire string will be copied
# into the address at $a1. The return value at $v0 will be the address of the
# string's null-terminator instead of the address of the first occurence of
# the ASCII value stored in $a2.
COPY_STRING:
  move $t1, $a0 # read_address
  move $t2, $a1 # write_address
  
  COPY_STRING_loop_start:
    lb $t0, 0($t1)
    beq $t0, 0, COPY_STRING_end
    beq $t0, $a2, COPY_STRING_end
    sb $t0, 0($t2)
  
  COPY_STRING_loop_end:
    addi $t1, 1
    addi $t2, 1
    j COPY_STRING_loop_start
  
  COPY_STRING_end:
    move $v0, $t1
    sb $zero, 0($t2)
    j $ra
