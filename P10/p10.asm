
%include "../LIB/pc_io.inc"

section .text
    global pbin8b
    global pbin16b
    global pbin32b
    global pbin64b

; Función para 8 bits
pbin8b:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

    mov dl, [ebp+8]     ; Cargar el byte
    mov bl, dl          ; Usar BL para preservar DL
    mov ecx, 8          ; Contador de bits
    
.print_bit:
    mov al, '0'         ; Valor por defecto
    shl bl, 1           ; Mover bit al carry
    jnc .print          ; Si no hay carry, imprimir '0'
    mov al, '1'         ; Cambiar a '1' si hay carry
.print:
    push ecx            ; Preservar ECX
    call putchar 
    pop ecx             ; Restaurar ECX
    
    loop .print_bit

    mov al, 10          ; Salto de línea
    call putchar 

    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

; Función para 16 bits
pbin16b:
    push ebp
    mov ebp, esp
    push ebx
    push edx

    mov dx, [ebp+8]     ; Cargar valor de 16 bits

    ; Byte alto
    movzx eax, dh
    push eax
    call pbin8b
    add esp, 4

    ; Byte bajo
    movzx eax, dl
    push eax
    call pbin8b
    add esp, 4

    pop edx
    pop ebx
    pop ebp
    ret

; Función para 32 bits
pbin32b:
    push ebp
    mov ebp, esp
    push ebx
    push edx

    mov edx, [ebp+8]    ; Cargar valor de 32 bits

    ; Palabra alta
    shr edx, 16
    push edx
    call pbin16b
    add esp, 4

    ; Palabra baja
    mov edx, [ebp+8]
    and edx, 0xFFFF
    push edx
    call pbin16b
    add esp, 4

    pop edx
    pop ebx
    pop ebp
    ret

; Función para 64 bits
pbin64b:
    push ebp
    mov ebp, esp
    push ebx
    push edx

    ; Parte alta (32 bits superiores)
    mov edx, [ebp+12]
    push edx
    call pbin32b
    add esp, 4

    ; Parte baja (32 bits inferiores)
    mov edx, [ebp+8]
    push edx
    call pbin32b
    add esp, 4

    pop edx
    pop ebx
    pop ebp
    ret