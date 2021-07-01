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

_get_len:
	inc rax                        ; rax++
	cmp byte [rsi + rax], 0        ; check char arg[rax]
	jne _get_len                   ; not null, continue parsing
	ret                            ; else return rax (length)

_write:
	mov rsi, [rsi]                 ; rsi <- argv[n]
	mov rax, -1                    ; init arg length count
	call _get_len                  ; rax <- arg length
	mov rdx, rax                   ; write len <- rax (arg length)
	mov	rax, 0x2000004             ; write
	mov rdi, 1                     ; stdout
	syscall

	mov	rax, 0x2000004
	mov rsi, message
	mov rdi, 1
	mov rdx, message.len
	syscall                         ; jump line between arg

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
