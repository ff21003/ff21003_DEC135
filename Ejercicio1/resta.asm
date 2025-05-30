section .data
    num1 dw 50
    num2 dw 20
    num3 dw 5
    msg db "El resultado de restar 50 - 20 - 5 es: ", 0
    msg_len equ $ - msg
    newline db 10

section .bss
    buffer resb 6  ; 5 dígitos + \n

section .text
    global _start

_start:
    ; Imprimir mensaje
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Realizar la resta usando 16 bits
    mov ax, [num1]
    sub ax, [num2]
    sub ax, [num3]

    ; Guardar resultado en BX
    mov bx, ax

    ; conversión a ASCII
    mov edi, buffer + 5         ; apuntar al final del buffer
    mov byte [edi], 10          ; salto de línea
    dec edi

    mov cx, 10                  ; divisor (base 10)
    xor eax, eax
    mov ax, bx
    test ax, ax
    jnz .convert_loop

    ; Si es 0
    mov byte [edi], '0'
    dec edi
    jmp .print

.convert_loop:
    xor dx, dx
    div cx                      ; AX / 10
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
