# --------------------------------
# Elliott Cable <a221@elliottcable.name>, Ken Kelley <askjk11@uaa.alaska.edu>
# Ordering Example
# Feburary 7th, 2009
# CS A221: Programming Assignment 1b
#
# PURPOSE:  Sort three values by size, smallest to largest.
#
# ALGORITHM:
#             A = 2
#             B = 3
#             C = 1
#             SMALLEST = 0
#             MIDDLE = 0
#             LARGEST = 0
#             if b > a
#               swap a, b
#             if c > b
#               swap b, c
#               if b > a
#                 swap a, b
#
# INPUTS:     Memory registers named A, B, and C identify random test values.
#
# OUTPUTS:    Memory registers LARGEST, MIDDLE, and SMALLEST identify the
#             INPUT values, re-ordered for size
# --------------------------------

.data
    A:        .word   -12                                                    # A = 2
    B:        .word   3                                                      # B = 3
    C:        .word   56                                                     # C = 1
    LARGEST:  .word   0                                                      # SMALLEST = 0
    MIDDLE:   .word   0                                                      # MIDDLE = 0
    SMALLEST: .word   0                                                      # LARGEST = 0
                                                                             # 
.text                                                                        # 
  main:                                                                      # 
    lw $a0, A($zero)                                                         # 
    lw $a1, B($zero)                                                         # 
    lw $a2, C($zero)                                                         # 
                                                                             # 
    sgt $t0, $a1, $a0                                                        # 
    bne $t0, $zero, FIRSTIF                                                  # if a1 > a0
    j AFTERFIRSTIF                                                           # 
                                                                             # 
  FIRSTIF:                                                                   # 
    add $t0, $a0, $zero                                                      # swap a0, a1
    add $a0, $a1, $zero                                                      # 
    add $a1, $t0, $zero                                                      # 
    j AFTERFIRSTIF                                                           # 
                                                                             # 
  AFTERFIRSTIF:                                                              # 
    sgt $t0, $a2, $a1                                                        # 
    bne $t0, $zero, SECONDIF                                                 # if a2 > a1
                                                                             # 
  SECONDIF:                                                                  # 
    add $t0, $a1, $zero                                                      # swap a1, a2
    add $a1, $a2, $zero                                                      # 
    add $a2, $t0, $zero                                                      # 
    j AFTERSECONDIF                                                          # 
                                                                             # 
  AFTERSECONDIF:                                                             # 
    sgt $t0, $a1, $a0                                                        # 
    bne $t0, $zero, NESTEDIF                                                 # if a1 > a0
    j AFTERNESTEDIF                                                          # 
                                                                             # 
  NESTEDIF:                                                                  # 
    add $t0, $a0, $zero                                                      # swap a0, a1
    add $a0, $a1, $zero                                                      # 
    add $a1, $t0, $zero                                                      # 
    j AFTERNESTEDIF                                                          # 
                                                                             # 
  AFTERNESTEDIF:                                                             # 
    sw $a0, LARGEST($zero)                                                   # 
    sw $a1, MIDDLE($zero)                                                    # 
    sw $a2, SMALLEST($zero)                                                  # 
    jr $ra                                                                   # 
                                                                              