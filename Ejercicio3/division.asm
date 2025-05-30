section .data
    dividend dd 75
    divisor  dd 15
    msg db "El resultado de dividir 75 / 15 es: ", 0
    msg_len equ $ - msg
    newline db 10

section .bss
    buffer resb 12  ; hasta 10 dígitos + salto de línea + nulo

section .text
    global _start

_start:
    ; --- Imprimir mensaje ---
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; --- División ---
    mov eax, [dividend]   ; EAX = 75
    xor edx, edx
    mov ecx, [divisor]    ; ECX = 15
    div ecx               ; EAX = cociente, EDX = residuo

    ; Guardamos el cociente en EBX para convertirlo a texto
    mov ebx, eax

    ; --- Conversión a ASCII ---
    mov edi, buffer + 10
    mov al, [newline]
    mov [edi], al
    dec edi

    mov eax, ebx          ; pasar resultado a EAX para dividirlo por 10
    mov ecx, 10
    test eax, eax
    jnz .convert_loop

    ; Si es 0
    mov byte [edi], '0'
    dec edi
    jmp .print

.convert_loop:
    xor edx, edx
    div ecx               ; divide EAX / 10
    add dl, '0'           ; convierte residuo a ASCII
    mov [edi], dl
    dec edi
    test eax, eax
    jnz .convert_loop

.print:
    inc edi
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 11
    sub edx, edi
    int 0x80

    ; --- Salida ---
    mov eax, 1
    xor ebx, ebx
    int 0x80
