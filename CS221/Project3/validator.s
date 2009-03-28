.data
  Greeting:     .asciiz "Enter commands, and hit return to process:\n"
  Prompt:       .asciiz ">> "
  Goodbye:      .asciiz "Awwww...\n"
  # Buffers
  BInput:       .asciiz ""
  BProcessing:  .asciiz ""
  # Debugging
  WTF:          .asciiz "WTF!\n"
  YAY:          .asciiz "YAY!\n"
  
.text
  main:
    la $a0, Greeting($zero);
    li $v0, 4; syscall # print_string
  
  MOTHERLOOP_start:
    la $ra, MOTHERLOOP_have_input;
    lb $t1, BInput($zero);
    beq $t1, 0, READ_NEW_INPUT;
  MOTHERLOOP_have_input:
    j EXIT;

# ---- ---- ! ---- ---- #
  
  uhmmmm:
    la $a0, WTF($zero);
    li $v0, 4; syscall # print_string
  
  READ_NEW_INPUT:
    la $a0, Prompt($zero);
    li $v0, 4; syscall # print_string
    
    la $a0, BInput;
    li $a1, 128;
    li $v0, 8; syscall # read_string
    
    j $ra
  
  EXIT:
    la $a0, Goodbye($zero)
    li $v0, 4; syscall; # print_string

    li $v0, 10; syscall; # exit
