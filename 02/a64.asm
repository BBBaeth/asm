bits 64

global _main

section .data
message: db " ",10
.len: equ $ - message

section .text

_exit:
	mov	rax, 0x2000001
	mov	rdi, 0
	syscall

_write:
	mov	rax, 0x2000004
	mov rsi, rdi
	mov rdi, 1
	mov rdx, message.len
	syscall
	mov	rax, 0x2000004
	mov rsi, message
	mov rdi, 1
	mov rdx, message.len
	syscall


	ret

_main:

	push	rdi                     ; save registers
	push	rsi
	sub		rsp, 8                  ; align stack before call

	mov		rdi, [rsi]              ; the argument string to display
	call	_write

	add		rsp, 8                  ; restore %rsp to pre-aligned value
	pop		rsi                     ; restore registers
	pop		rdi

	add		rsi, 8                  ; point to next argument
	dec		rdi                     ; count down
	jnz		_main                    ; if not done counting keep going
	jmp		_exit
