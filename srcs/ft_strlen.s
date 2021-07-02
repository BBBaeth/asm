bits 64

global _ft_strlen

section .data

section .text

_exit:
	ret           ; return rax (len)


_strlen_loop:

	inc rax                 ; rax++
	cmp byte [rsi + rax], 0 ; argv[1][rax] == null ?
	jne _strlen_loop        ; not null, continue
	jmp _exit               ; null, return

_ft_strlen:

	cmp rdi, 1     ; argc > 1 ?
	jng _exit      ; if not (path only), return
	add	rsi, 8     ; get next argv[] bcs argv[0] is path
	mov rsi, [rsi] ; rsi <- argv[1] instead of argv*
	mov rax, -1    ; rax will be our i/ptr
	jmp _strlen_loop
