// lib: Exiting the program
	.section .text
	.include "const/syscall.s"
	.globl exit


// Exit the program
// %rdi => exit code
exit:
	movq SYS_EXIT, %rax
	syscall
