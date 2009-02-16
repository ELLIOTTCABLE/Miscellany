# --------------------------------
# Elliott Cable <a221@elliottcable.name>, Ken Kelley <askjk11@uaa.alaska.edu>
# Looping Example
# Feburary 15th, 2009
# CS A221: Programming Assignment 2
# 
# PURPOSE:  Loop over the lines of this program (as it's own data) and count
#           the total R, I, and J-type instructions.
# 
# ALGORITHM:
#             RS = 0
#             JS = 0
#             IS = 0
#             s0 = get_address("main")
#             s1 = 0
#             s2 = 0
#             s3 = 0
#             loop do
#               t0 = get_opcode(s0)
#               break if t0 != 0x3E00008
#               t1 = shift_right(t0, 26)
#               s1++ if t1 == 0
#               s2++ if t1 == 2 || 3
#               s3++ else
#             end
#             s3++
#             RS = s1
#             JS = s2
#             IS = s3
#             return
# 
# INPUTS:     None
# 
# OUTPUTS:    Four constants (Rs, Js, and Is) counting the total count of each
#             type of instruction.
# --------------------------------
.data
  RS:     .word 0 # $s1                                                             # RS = 0
  JS:     .word 0 # $s2                                                             # JS = 0
  IS:     .word 0 # $s3                                                             # IS = 0
.text                                                                               # 
  main:                                                                             # 
    la $s0, main                                                                    # s0 = get_address("main")
    li $s1, 0                                                                       # s1 = 0
    li $s2, 0                                                                       # s2 = 0
    li $s3, 0                                                                       # s3 = 0
    j LOOPSTART                                                                     # 
                                                                                    # 
  LOOPSTART:                                                                        # loop do
    lw $t0, 0($s0)                                                                  #   t0 = get_opcode(s0)
    beq $t0, 0x3E00008, END # We've computed this as the literal value of `jr $ra`  #   break if t0 != 0x3E00008
    srl $t1, $t0, 26                                                                #   t1 = shift_right(t0, 26)
    beq $t1, 0, ISR                                                                 #   s1++ if t1 == 0
    beq $t1, 2, ISJ                                                                 #   s2++ if t1 == 2 || 3
    beq $t1, 3, ISJ                                                                 #   
    j ISI                                                                           #   s3++ else
                                                                                    # 
  LOOPEND:                                                                          # 
    addi $s0, $s0, 4                                                                #   s0 = s0 + 4
    j LOOPSTART                                                                     # 
                                                                                    # 
  ISR:                                                                              # 
    addi $s1, $s1, 1                                                                # 
    j LOOPEND                                                                       # 
                                                                                    # 
  ISJ:                                                                              # 
    addi $s2, $s2, 1                                                                # 
    j LOOPEND                                                                       # 
                                                                                    # 
  ISI:                                                                              # 
    addi $s3, $s3, 1                                                                # 
    j LOOPEND                                                                       # 
                                                                                    # 
  END:                                                                              # end
    addi $s3, $s3, 1 # `jr $ra` is unconditionally an 'I'                           # s3++
    sw $s1, RS                                                                      # RS = s1
    sw $s2, JS                                                                      # JS = s2
    sw $s3, IS                                                                      # IS = s3
    jr $ra                                                                          # return
