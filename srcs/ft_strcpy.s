bits 64

global _ft_strcpy

section .data

section .text

_arg_error:             ; original strcpy would have undefined behaviour

	mov BYTE rax, 0     ; my strcpy returns a null string
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

	mov rax, -1         ; rax is our ptr

	; error cases where dest < source or dest or source do not exist

	cmp rdi, 0          ; does argv[1] exist ?
	jng _arg_error
	cmp rsi, 0          ; does argv[2] exist ?
	jng _arg_error

	jmp _strcpy_loop
