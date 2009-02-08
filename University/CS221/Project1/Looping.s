# --------------------------------
# Elliott Cable <a221@elliottcable.name>, Ken Kelley <askjk11@uaa.alaska.edu>
# Looping Example
# Feburary 7th, 2009
# CS A221: Programming Assignment 1c
#
# PURPOSE:  Loop over an array and count the even and odd bits
#
# ALGORITHM:
#             ARRAY = [6, 18, -3, 58, 201, 44, 83, -175, -42, 8, 0]
#             N = array.length
#             EVEN = 0
#             ODD = 0
#             
#             t0 = 0
#             s0 = N
#             t1 = 4
#             s1 = 0 # (EVEN)
#             s2 = 0 # (ODD)
#             
#             while(t0 < s0) {
#               # We shift the byte out of addressing space and then pad it with 0s to get
#               # the last bit of the byte, because we don't have a load_bit tool
#               t2 = load_byte(array[t1])
#               shift_left(t2, 31)
#               shift_right(t2, 31)
#               
#               if t2 == 0 # even
#                 s1++
#               else # odd
#                 s2++
#               end
#               
#               t0++
#               t1 = t1 + 4
#             }
#             
#             EVEN = s1
#             ODD = s2
# 
# INPUTS:     A memory register 'ARRAY' containing a series of integers, and a
#             memory register 'N' containing the length of said array.
#
# OUTPUTS:    Memory registers at 'EVEN' and 'ODD' are updated with the count
#             of even and odd integers from 'ARRAY'.
# --------------------------------

.data
  ARRAY:  .word 6, 18, -3, 58, 201, 44, 83, -175, -42, 8, 0                  # ARRAY = [6, 18, -3, 58, 201, 44, 83, -175, -42, 8, 0]
  N:      .word 11 # $s0                                                     # N = array.length
  EVEN:   .word 0 # $s1                                                      # EVEN = 0
  ODD:    .word 0 # $s2                                                      # ODD = 0
                                                                             # 
.text                                                                        # 
  main:                                                                      # 
    li $t0, 0                                                                # t0 = 0
    lw $s0, N                                                                # s0 = N
    li $t1, 4                                                                # t1 = 4
    li $s1, 0                                                                # s1 = 0 # (EVEN)
    li $s2, 0                                                                # s2 = 0 # (ODD)
    j LOOPSTART                                                              # 
                                                                             # 
  LOOPSTART:                                                                 # while(t0 < s0) {
    bge $t0, $s0, END                                                        # # We shift the byte out of addressing space and then pad it with 0s to get
                                                                             # # the last bit of the byte, because we don't have a load_bit tool to obtain single bit
    lb $t2, ARRAY($t1)                                                       # t2 = load_byte(array[t0])
    sll $t2, $t2, 31                                                         # shift_left(t2, 31)
    srl $t2, $t2, 31                                                         # shift_right(t2, 31)
                                                                             # 
    beq $t2, $zero, ISEVEN                                                   # if t2 == 0 # even
    j ISODD                                                                  # else # odd
                                                                             # 
  LOOPEND:                                                                   # 
    addi $t0, $t0, 1                                                         # t0++
    addi $t1, $t1, 4                                                         # t1 = t1 + 4 # increment index 'into array'
    j LOOPSTART                                                              # 
                                                                             # 
  ISEVEN:                                                                    # 
    addi $s1, $s1, 1                                                         # s1++
    j LOOPEND                                                                # 
                                                                             # 
  ISODD:                                                                     # 
    addi $s2, $s2, 1                                                         # s2++
    j LOOPEND                                                                # 
                                                                             # 
  END:                                                                       # 
    sw $s1, EVEN                                                             # EVEN = s1
    sw $s2, ODD                                                              # ODD = s2
    jr $ra                                                                   # return
                                                                             # 