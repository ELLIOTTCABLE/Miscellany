.data
  # Output messages
  Greeting:     .asciiz "** Enter commands, and hit return to process:\n"
  Prompt:       .asciiz ">> "
  Error:        .asciiz "!! Oh-oh! Something happened that shouldn't have: Error #"
  Goodbye:      .asciiz "** Awwww...\n"
  # Buffers
  BInput:       .asciiz ""
  BProcessing:  .asciiz ""
  # Debugging
  YAY:          .asciiz "YAY!\n"
  
.text
  main:
    la $a0, Greeting($zero)
    li $v0, 4; syscall # print_string
  
  MOTHERLOOP_start:
    la $ra, MOTHERLOOP_have_input
    lb $t1, BInput($zero)
    beq $t1, 0, READ_NEW_INPUT
  MOTHERLOOP_have_input:
    j EXIT

# ---- ---- ! ---- ---- #
  
  li $a0, 0
  ERROR:
    move $t0, $a0
    la $a0, Error($zero)
    li $v0, 4; syscall # print_string
    
    move $a0, $t0
    li $v0, 1; syscall # print_int
    
    li $v0, 10; syscall # exit
  
  READ_NEW_INPUT:
    la $a0, Prompt($zero)
    li $v0, 4; syscall # print_string
    
    la $a0, BInput
    li $a1, 128
    li $v0, 8; syscall # read_string
    
    j $ra
  
  li $a0, 1
  j ERROR
  CHECK_INPUT_BUFFER:
    li $t0, 0 # byte = null
    li $t1, 0 # statement_complete = false
    li $t2, 0 # reading_statement = false
    move $t3, $a0 # i
    move $t4, $a0 # j
    move $t5, $a1 # k
  
    CHECK_INPUT_BUFFER_start:
      lb $t0, $t3
      beq $t0, 0, CHECK_INPUT_BUFFER_null
      beq $t0, 52, CHECK_INPUT_BUFFER_semicolon
      beq $t0, 32, CHECK_INPUT_BUFFER_space
      bnez $t1, CHECK_INPUT_BUFFER_copy_up
      j CHECK_INPUT_BUFFER_copy_down
    
    CHECK_INPUT_BUFFER_end:
      addi $t3, 1
      addi $t4, 1
      j CHECK_INPUT_BUFFER_start
    
    CHECK_INPUT_BUFFER_increment:
      addi $t5, 1
      j CHECK_INPUT_BUFFER_start
    
    CHECK_INPUT_BUFFER_null:
      sb $t0, $a1
      sb $t0, $t4
    
    CHECK_INPUT_BUFFER_semicolon:
      bnez $t1, CHECK_INPUT_BUFFER_copy_up
      beqz $t2, CHECK_INPUT_BUFFER_end
      li $t1, 1 # statement_complete = true
      move $t4, $a0 # reset j
      li $t0, 0 # copy down a null byte instead of a semicolon
      j CHECK_INPUT_BUFFER_copy_down
    
    CHECK_INPUT_BUFFER_space:
      bnez $t1, CHECK_INPUT_BUFFER_copy_up
      bnez $t2, CHECK_INPUT_BUFFER_copy_down
      j CHECK_INPUT_BUFFER_end
    
    CHECK_INPUT_BUFFER_copy_down:
      li $t2, 1 # reading_statement = true
      sb $t0, $a1
      j CHECK_INPUT_BUFFER_end
    
    CHECK_INPUT_BUFFER_copy_up:
      sb $t0, $t4
      j CHECK_INPUT_BUFFER_end
  
  li $a0, 2
  j ERROR
  EXIT:
    la $a0, Goodbye($zero)
    li $v0, 4; syscall # print_string

    li $v0, 10; syscall # exit
