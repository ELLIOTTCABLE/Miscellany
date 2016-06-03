# QtSPIM Installation Check Program 1
     .text
main: li $t0,23
     li $t1,35
     li $t2,47
     mul $t3,$t0,$t1
     mul $t3,$t3,$t2
     move $a0,$t3
     li $v0,1
     syscall
     li $v0,10
     syscall
