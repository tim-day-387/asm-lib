// lib: Simple memory management helpers
	.section .text
	.include "const/mem.s"
	.globl clear_buffer
	.globl compare_buffer
	.globl len_data_buffer


// Fill the buffer with null
// %rdi => buffer location
// %rsi => buffer length
clear_buffer:
	decq %rsi

clear_buffer_start:
	movb $NULL, (%rdi,%rsi,1)
	decq %rsi

	cmpq $0, %rsi
	je clear_buffer_done

	jmp clear_buffer_start

clear_buffer_done:
	ret


// Do the buffers match?
// %rdi => buffer 1 location
// %rsi => buffer 2 location
// %rdx => buffer length
compare_buffer:
	decq %rdx

	movb (%rdi,%rdx,1), %al
	cmpb (%rsi,%rdx,1), %al
	jne compare_buffer_ne

	cmpq $0, %rdx
	je compare_buffer_e

	jmp compare_buffer

compare_buffer_e:
	movq $1, %rax
	ret

compare_buffer_ne:
	movq $0, %rax
	ret


// Get the length of non-zero data in buffer
// %rdi => buffer location
// %rsi => buffer length
len_data_buffer:
	movq $0, %rax

len_data_buffer_start:
	movb (%rdi,%rax,1), %bl
	cmpb $0, %bl
	je len_data_buffer_end

	incq %rax

	cmpq %rsi, %rax
	je len_data_buffer_end

	jmp len_data_buffer_start

len_data_buffer_end:
	ret
