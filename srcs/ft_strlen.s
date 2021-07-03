bits 64

global _ft_strlen

section .data

section .text

_exit:

	ret           ; return rax (len)

_strlen_loop:

	inc rax                 ; rax++
	cmp byte [rdi + rax], 0 ; argv[1][rax] == null ?
	jne _strlen_loop        ; not null, continue
	jmp _exit               ; null, return

_ft_strlen:

	mov rax, -1             ; rax will be our i/ptr
	cmp rdi, byte 0         ; argument is stored in rdi
	jle _exit               ; if no argument return -1
	jmp _strlen_loop
