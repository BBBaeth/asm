bits 64

global _main

section .data

message:	db	"Hello World!", 10
.len:		equ	$ - message

section .text

_main:
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, message
	mov rdx, message.len
	syscall

	mov rax, 0x2000001
	mov rdi, 0
	syscall
