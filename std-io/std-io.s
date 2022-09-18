// lib: Basic file I/O for stdin/stdout/stderr
	.section .text
	.include "const/file.s"
	.globl stdin
	.globl stdout
	.globl stderr


// Read from stdin
// %rdi => buffer location
// %rsi => buffer length
stdin:
	movq %rsi, %rdx
	movq %rdi, %rsi
	movq $STDIN, %rdi
	call read

	ret


// Write to stdout
// %rdi => buffer location
// %rsi => buffer length
stdout:
	movq %rsi, %rdx
	movq %rdi, %rsi
	movq $STDOUT, %rdi
	call write

	ret


// Write to stderr
// %rdi => buffer location
// %rsi => buffer length
stderr:
	movq %rsi, %rdx
	movq %rdi, %rsi
	movq $STDERR, %rdi
	call write

	ret
