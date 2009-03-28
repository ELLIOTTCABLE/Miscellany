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
  EXIT:
    la $a0, Goodbye($zero)
    li $v0, 4; syscall # print_string

    li $v0, 10; syscall # exit
