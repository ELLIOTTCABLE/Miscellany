# --------------------------------
# Elliott Cable <a221@elliottcable.name>, Ken Kelley <askjk11@uaa.alaska.edu>
# Basic Assembler Instructions Example
# Feburary 7th, 2009
# CS A221: Programming Assignment 1a
#
# PURPOSE:  This program demonstrates basic loading and manipluation of memory
#           registers.
#
# ALGORITHM:
#             A = 12
#             B = 16
#             C = -23
#             D = 83886080
#
#             a0 = A
#             a1 = B
#             a2 = C
#             a3 = D
#
#             s0 = a0 * (2 ** 2)
#
#             s1 = a1 / (2 ** 2)
#
#             def shift_right(n)
#               if n >= 0
#                 result = n / 2
#               else
#                 # (In this situation, the sign will flip, and the value will become much larger)
#               end
#               return result
#             end
#             s2 = shift_right(shift_right(a2))
#
#             def rotate(n)
#               if n >= 0 && n < ((2 ** 30) - 1)
#                 result = n * 2
#               else
#                 # (We can't easily describe the actions of a roll in this situation:
#                 # the last digit dropps of and it becomes the first digit - basically
#                 # switches the sign after a certain point)
#               end
#               return result
#             end
#             s3 = 8.times {rotate(a3)}
#
#             A = s0
#             B = s1
#             C = s2
#             D = s3
#
# INPUTS:     Memory registers named A, B, C, and D identify random test values.
#
# OUTPUTS:    A, B, C, and D are updated with the results of the calculations.
# --------------------------------

.data
  A:      .word 12                                                           # A = 12
  B:      .word 16                                                           # B = 16
  C:      .word -23                                                          # C = -23
  D:      .word 83886080                                                     # D = 83886080
                                                                             #
.text                                                                        #
  main:                                                                      #
    lw $a0, A($zero)                                                         # a0 = A
    lw $a1, B($zero)                                                         # a1 = B
    lw $a2, C($zero)                                                         # a2 = C
    lw $a3, D($zero)                                                         # a3 = D
                                                                             #
    sll $s0, $a0, 2                                                          # s0 = a0 * (2 ** 2)
                                                                             #
    sra $s1, $a1, 2                                                          # s1 = a1 / (2 ** 2)
                                                                             #
    srl $s2, $a2, 2                                                          # result = n / 2 (see above...) 0's fill in the most significant digits
                                                                             #
    li $t0, 8                                                                # t0 = 8
    rol $s3, $a3, $t0                                                        # result = n * 2 (see above...) the most significant digit drops off and it becomes the least
                                                                             #
    sw $s0, A($zero)                                                         # A = s0
    sw $s1, B($zero)                                                         # B = s1
    sw $s2, C($zero)                                                         # C = s2
    sw $s3, D($zero)                                                         # D = s3
                                                                             #
    jr $ra                                                                   # return
