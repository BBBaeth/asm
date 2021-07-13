bits 64

extern ___error
extern _malloc        ; C function malloc
extern _ft_strlen
extern _ft_strcpy

global _ft_strdup

section .data

section .text

_exit:

	ret              ; return rax (ptr to dst)

_error_arg:

	mov rax, 0       ; return null ptr
	jmp _exit

_error_malloc:

	call ___error
	mov rdi, 12      ; errno value ENONEM (Out of memory)
	mov [rax], rdi   ; to original block
	mov rax, 0       ; return null ptr
	jmp _exit

_ft_strdup:          ; rdi = s1 (s2 for cpy)

	call _ft_strlen  ; rax <- len
	cmp rax, -1      ; rdi does not exist
	jng _error_arg

	add rax, 1       ; rax + 1, for '\0' end
	push rdi         ; push str
	mov rdi, rax     ; rdi <- size to malloc
	call _malloc     ; malloc size of argv[1] (rdi = rax = len)

	cmp rax, 0       ; rax = 0 means not enough space for malloc
	je _error_malloc ; rax == 0 ? malloc failed
                     ; else cpy string to rax : rsi = src, rdi = dest
	mov rdi, rax
	pop rsi          ; get str (s2) back from stack
	call _ft_strcpy
	jmp _exit
