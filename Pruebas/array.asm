%include "../LIB/pc_iox.inc"

section .text
    global _start


_start:

    mov edx, mensaje  ; Cargar la dirección del mensaje en EDX
    call puts

    mov eax, 1         ; Código de salida
    int 0x80         ; Llamada al sistema para salir


section .data
mensaje db "Hello, World!", 0x0A , 0; Mensaje a imprimir
