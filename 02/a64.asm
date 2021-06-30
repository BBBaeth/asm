bits 64

global _main

section .data
message: db 10
.len: equ $ - message

section .text

_exit:
	mov	rax, 0x2000001
	mov	rdi, 0
	syscall

_write:
	mov	rax, 0x2000004 ; write
	mov rdi, 1 ; stdout
	mov rsi, [rsi] ; get the argument itself
	mov rdx, message.len
	syscall

	mov	rax, 0x2000004
	mov rsi, message
	mov rdi, 1
	mov rdx, message.len
	syscall

	ret

_main:

	add		rsi, 8                  ; argv - point to next argument
	dec		rdi                     ; argc - count down - remove path
	push	rdi                     ; save registers
	push	rsi                     ; bcs write will overwrite them

	call	_write

	pop		rsi                     ; restore registers
	pop		rdi                     ; to state before write

	cmp rdi, 1                      ; stop at 1 because argv[0] is path
	jne		_main                   ; if not done counting keep going
	jmp		_exit
