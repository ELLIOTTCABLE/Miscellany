.data
  # Output messages
  Greeting: .asciiz "** Enter commands, and hit return to process:\n"
  Prompt:   .asciiz ">> "
  Error:    .asciiz "!! Oh-oh! Something happened that shouldn't have: Error #"
  Goodbye:  .asciiz "** Awwww...\n"
  # Static messages
  Exit:       .asciiz "exit"
  Int:        .asciiz "int "
  Print:      .asciiz "print "
  Equals:     .asciiz " = "
  PlusEquals: .asciiz " += "
  # Buffers
  # These have to have a lot of whitespace to pre-allocate the (possibly)
  # necessary memory
  BInput:      .asciiz "                                                                                                                              ;"
  BProcessing: .asciiz "                                                                                                                              ;"
  # Debugging
  Ender: .asciiz "]\n"
  Seperator: .asciiz "# ---- ---- ! ---- ---- #\n"
  
.text
  main:
    la $a0, Greeting($zero)
    li $v0, 4; syscall # print_string
    
    addi $sp, $sp, -12
    sw $s0, 8($sp)
    sw $s1, 4($sp)
    sw $s2, 0($sp)
  
  MOTHERLOOP_start:
    la $ra, MOTHERLOOP_after_shift
    la $a0, BInput($zero)
    la $a1, BProcessing($zero)
    j SHIFT
  MOTHERLOOP_after_shift:
    D1:; la $ra, AD1; j DEBUG; AD1:
    la $ra, MOTHERLOOP_have_processable
    lb $t1, BInput($zero)
    beq $t1, 0, READ_NEW_INPUT
  MOTHERLOOP_have_processable:
    la $ra, MOTHERLOOP_start
    lb $a0, BProcessing($zero)
    j PROCESS

# ---- ---- ! ---- ---- #
  
  li $a0, 0
  ERROR:
    move $t0, $a0
    la $a0, Error($zero)
    li $v0, 4; syscall # print_string
    
    move $a0, $t0
    li $v0, 1; syscall # print_int
    
    li $v0, 10; syscall # exit
  
  DEBUG:
    la $a0, Seperator($zero)
    li $v0, 4; syscall # print_string
    la $a0, BInput($zero)
    li $v0, 4; syscall # print_string
    la $a0, Ender($zero)
    li $v0, 4; syscall # print_string
    la $a0, BProcessing($zero)
    li $v0, 4; syscall # print_string
    la $a0, Ender($zero)
    li $v0, 4; syscall # print_string
    la $a0, Seperator($zero)
    li $v0, 4; syscall # print_string
    
    j $ra
  
  li $a0, 1
  j ERROR
  READ_NEW_INPUT:
    la $a0, Prompt($zero)
    li $v0, 4; syscall # print_string
    
    la $a0, BInput
    li $a1, 128
    li $v0, 8; syscall # read_string
    
    j $ra
  
  li $a0, 2
  j ERROR
  SHIFT:
    move $s0, $ra
    
    SHIFT_start:
      la $ra, SHIFT_middle
      li $a2, 59
      j COPY_STRING
      
    SHIFT_middle:
      addi $v0, 1
      la $ra, SHIFT_end
      move $a1, $a0
      move $a0, $v0
      li $a2, 0
      j COPY_STRING
      
    SHIFT_end:
      move $ra, $s0
      j $ra
  
  li $a0, 3
  j ERROR
  COPY_STRING:
    move $t1, $a0
    move $t2, $a1
    
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
  
  li $a0, 4
  j ERROR
  # Processes a null-terminated string, containing a valid instruction.
  # 
  # Takes as arguments: $a0 containing an address to the null-terminated
  # string containing the input.
  PROCESS:
    move $s0, $ra
    
    PROCESS_exit:
      la $ra, PROCESS_exit_2
      la $a0, Exit($zero)
      la $a1, BProcessing($zero)
      j COMPARE
    PROCESS_exit_2:
      bnez $v0, IS_EXIT
    
    PROCESS_int:
      # …
    
    move $ra, $s0
    j $ra
  
  li $a0, 5
  j ERROR
  # Compares one string to another.
  # 
  # Takes as arguments: $a0 containing the address to the first null-
  # terminated string, $a1 containing the address to the second null-
  # terminated string.
  # 
  # Returns: $v0 containing boolean 1 or 0.
  COMPARE:
    li $t0, 0 # current_byte
    move $t1, $a0
    move $t2, $a1
    
    COMPARE_loop_start:
      bne $t1, $t2, COMPARE_fail
      beqz $t1, COMPARE_end
    
    COMPARE_fail:
      li $v0, 0
      j $ra
    
    COMPARE_end:
      li $v0, 1
      j $ra
  
  li $a0, 6
  j ERROR
  IS_EXIT:
    la $a0, Goodbye($zero)
    li $v0, 4; syscall # print_string
    
    j EXIT
  
  li $a0, 7
  j ERROR
  EXIT:
    lw $s2, 0($sp)
    lw $s1, 4($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    
    li $v0, 10; syscall # exit
