# vim: set shiftwidth=8 tabstop=8 noexpandtab softtabstop& list listchars=tab\: ·:

.data
A:	.word	5
B:	.word	2

.text
main:	lw	$t0, A
	lw	$t1, B
	mult	$t0, $t1
	mflo	$a0

	li	$v0, 1		# PRINT_INT $a0
	syscall

	li	$v0, 10
	syscall
