bits 64

extern ___error

global _ft_read

section .data

section .text

_exit:
	ret                ; ret 0>= if fine or -1 if error

_error_read:
	neg rax            ; rax holds -errno so we *-1
	mov rdi, rax       ; rdi <- errno value to keep track of it
	call ___error      ; error puts errno ptr in rax
	mov [rax], rdi     ; put error nb in errno
	mov rax, -1
	ret

_ft_read:

	mov rax, 0x2000003 ; 3 = read
	syscall            ; modifies CF (carry flag) if error
	jc _error_read     ; condition = CF is not clear
	jmp _exit
