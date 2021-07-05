bits 64

extern __errno_location
extern malloc        ; C function malloc
extern ft_strlen
extern ft_strcpy

global _ft_strdup

section .data

section .text

_exit:

	ret              ; return rax (ptr to dst)

_error_malloc:

	call __errno_location
	mov rdi, 12      ; errno value ENONEM (Out of memory)
	mov rdi, rsi     ; original block of memory unchanged
	mov [rax], rdi   ; to original block
	mov rax, 0       ; return null ptr
	jmp _exit

_ft_strdup:

	call ft_strlen ; get len of argv[1] in rax
	mov rsi, rdi   ; C function malloc takes rdi as size so we save it
	mov rdi, rax   ; as it currently points to the string we want to cpy
	call malloc    ; malloc size of argv[1]
	cmp rax, 0     ; rax = 0 means not enough space for malloc
	je _error_malloc ; rax == 0 ? malloc failed	
	; else cpy string to rax : rsi = src, rdi = dest
	mov rdi, rax
	call ft_strcpy
	jmp _exit
