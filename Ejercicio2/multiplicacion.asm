section .data
    num1 db 10
    num2 db 7
    msg db "El resultado de multiplicar 10 * 7 es: ", 0
    msg_len equ $ - msg
    newline db 10

section .bss
    buffer resb 6  ; hasta 5 dígitos + \n

section .text
    global _start

_start:
    ; Imprimir mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Multiplicación de 8 bits: AL * BL → AX
    mov al, [num1]
    mov bl, [num2]
    mul bl            ; Resultado: AX = AL * BL (16 bits)

    ; Guardar resultado en BX
    mov bx, ax

    mov edi, buffer + 5
    mov al, [newline]
    mov [edi], al
    dec edi

    xor eax, eax
    mov ax, bx        ; pasar resultado a EAX para división

    mov ecx, 10
    test ax, ax
    jnz .convert_loop

    ; Si resultado es 0
    mov byte [edi], '0'
    dec edi
    jmp .print

.convert_loop:
    xor edx, edx
    div ecx           ; AX / 10, residuo en DL
    add dl, '0'
    mov [edi], dl
    dec edi
    test ax, ax
    jnz .convert_loop

.print:
    inc edi
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 6
    sub edx, edi
    int 0x80

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80
