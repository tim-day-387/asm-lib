// lib: Basic file I/O
	.section .text
	.include "const/syscall.s"
	.globl read
	.globl write


// Read from file
// %rdi => file descriptor
// %rsi => buffer location
// %rdx => buffer length
read:
	movq $SYS_READ, %rax
	syscall

	ret


// Write to file
// %rdi => file descriptor
// %rsi => buffer location
// %rdx => buffer length
write:
	movq $SYS_WRITE, %rax
	syscall

	ret
