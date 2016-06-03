# vim: set shiftwidth=8 tabstop=8 noexpandtab softtabstop& list listchars=tab\: ·:

.data
STRING:	.asciiz	"Print this.\n"

.text
main:	li	$v0, 4
	la	$a0, STRING
	syscall

	li	$v0, 10
	syscall
