bits 64

global _ft_strcmp

section .data

section .text

_error_noarg:        ; no parameter (real strcmp would segfault)
	mov rax, 0       ; if both parameters are missing they are equal
	ret

_error_onearg:       ; only one parameter (strcmp would segfault)
	mov rax, 1       ; if argv[1] exists and not [2] : 1 > 2
	ret

_exit:
	movzx rax, al    ; we want to return str1[] - str2[]
	movzx r8, bl     ; zx puts \0 at end of register content

	sub rax, r8      ; str1[n] - str2[n] / will be + if >, 0 if =, - if <
	ret           ; return diff stocked in rax

_strcmp_loop:

	mov al, byte [rdi] ; al register is one byte large
	mov bl, byte [rsi] ; bl register is one byte large

; upcoming block avoids bus error in case we are at both end
	cmp al, byte 0
	je _exit
	cmp bl, byte 0
	je _exit

	cmp al, bl
	jne _exit          ; difference found

	inc rdi            ; ptr++
	inc rsi            ; ptr++
	jmp _strcmp_loop

_ft_strcmp:

	cmp rdi, byte 0    ; does argv[1] exist ?
	jng _error_noarg
	cmp rsi, byte 0    ; does argv[2] exist ?
	jng _error_onearg
	jmp _strcmp_loop   ; parameters ok
