bits 64

global _ft_strcpy

section .data

section .text

_error_no_arg:          ; strcpy would segfault
	mov rax, 0
	ret

_exit:
	mov rax, rdi        ; strcpy returns s1
	ret                 ; return rax <- rdi (ptr to s1)

_strcpy_loop:
	inc rax             ; rax++
	mov cl, [rsi + rax] ; cl equivalent to al but in CX register
	mov [rdi + rax], cl ; dst[ptr] = src[ptr]
	cmp cl, byte 0      ; is char == \0 ?
	je _exit            ; finished copying
	jmp _strcpy_loop

_ft_strcpy: ; rsi = source, rdi = dest
	mov rax, -1  ; rax is our ptr
;	cmp rdi, byte 0 ; does dst point somewhere ? if not nothing to cpy
;	jng _error_no_arg
;	cmp rsi, byte 0 ; does src exist ? if not then nothing to cpy : return null
;	jng _error_no_arg
	jmp _strcpy_loop
