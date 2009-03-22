########################################################################
#
# 	Elliott Cable <a221@elliottcable.name>
#	Ken Kelley <askjk11@uaa.alaska.edu>
# 	Looping Example
# 	February 15th, 2009
# 	CS A221: Programming Assignment 2
# 
# 	PURPOSE:  To loop through the instructions in this program 
#		identifying each type of instruction used (R, I, J),
#		which allows us to keep a count of the various types,
#		essentially demonstrating the use of a program itself
#		as its own data.
# 
# 	ALGORITHM:
#         	RS = 0
#             	JS = 0
#             	IS = 0
#             	s0 = setAddress("main")
#             	s1 = 0
#             	s2 = 0
#             	s3 = 0
#             	
#		loop body:
#              	  t0 = getInstruction(s0)
#
#		  if (t0 == 0x3E00008) 
#		  {
#             		break;
#		  }
#             	  t1 = shiftRight(t0, 26)  //obtain opcode
#		
#             	  if t1 == 0
#		  {
#			s1++;
#		  }
#             	  if ((t1 == 2)||(t1 == 3))
#		  {
#			s2++;
#		  }
#         	  else
#		  {
#			s3++;
#		  }
#		  s0 = s0 + 4;
#             	  end of loop
#             	  s3++	//increment I for j $ra
#             	  RS = s1 //store counters to memory
#             	  JS = s2
#            	  IS = s3
#             	  return
# 
# 	INPUTS:     None (Program uses its own instructions as data)
# 
# 	OUTPUTS:    Four constants (Rs, Js, and Is) which return the
#		total count of each type of instruction.
#
#######################################################################

	.data
Buffer:	.asciiz "            "                                        
Greeting:	.asciiz "Enter command:"
Stop:   .asciiz "exit;"	  
Goodbye: .asciiz "Good-Bye!"
test: .asciiz "Test!"						                  
	.text					              
main:						               
    li $v0, 4				              
	la $a0, Greeting			          
	syscall				                  
						                  
    li $v0, 8                             
    la $a0, Buffer                        
    li $a1, 20                        
    syscall
    
    li $v0, 4
    la $a0, Buffer
    syscall
    
    li $t0, 0
    li $t1, 0
    li $t4, 0
    
 exittest:     
    
    lb $t2, Buffer($t0)
    lb $t3, Stop($t1)
    bne $t2, $t3, main
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    add $t4, $t4, $t2
    beq $t0, 5, END
    
    li $v0, 4				              
	la $a0, test			          
	syscall		
    
    j exittest 
    
    
    
  #  li $t0, Stop($zero)
  # li $t1, Buffer($zero)
  #  beq $t0, $t1, END 
    

    
     			              
END:
    li $v0, 4
    la $a0, Goodbye
    syscall
    
    li $v0, 10
    syscall						                  
#CONVERT_STRING:
 #   la $t9, 0($zero)				                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  
						                  

