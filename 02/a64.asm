bits 64

global _main

section .data

section .text

_exit:
	mov	rax, 0x2000001
	mov	rdi, 0
	syscall

_loop:
	pop rsi
	cmp r8, 0 ; do we have > 0 arguments
	jle	_exit ; if no quit

	mov	rax, 0x2000004
	mov rdi, 1
	pop rsi
	mov rdx, 10
	syscall

	dec r8
	pop r8 ; get argc
	jmp _loop

_main:
	pop r8 ; get argc
	pop rsi ; remove first argument (program name) by popping one first
	jmp _loop
