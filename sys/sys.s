// lib: Generic syscall function
	.section .text
	.globl syscall


// Perform syscall
// %rdi => syscall number
// %rsi => first arg
// %rdx => second arg
// %rcx => third arg
// %r8 => fourth arg
// %r9 => fifth arg
syscall:
	movq %rdi, %rax

	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	movq %r8, %rcx
	movq %r9, %r8

	syscall

	ret
