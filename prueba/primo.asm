%include "../LIB/pc_io.inc"

section .text
    global _start

_start:

    mov eax, 13         ; Número a comprobar
    call is_prime       ; Resultado en eax (0 o 1)
    add al, '0'         ; Convertirlo en carácter ASCII ('0' o '1')
    call putchar

    mov al, 10
    call putchar

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; ------------------------------------
; is_prime:
; Entrada: eax = número a comprobar
; Salida: eax = 1 si es primo, 0 si no
; ------------------------------------
is_prime:
    push eax            ; Guardamos el número original en la pila

    cmp eax, 2
    jb .no_primo        ; Menor a 2 → no primo
    cmp eax, 3
    jbe .es_primo       ; 2 o 3 → primo

    test eax, 1
    jz .no_primo        ; par → no primo

    mov ecx, 2
.loop:
    pop ebx             ; restauramos el número original en ebx
    push ebx            ; y lo volvemos a guardar

    cmp ecx, ebx
    jae .es_primo

    mov eax, ebx
    xor edx, edx
    div ecx             ; eax = ebx / ecx → edx = residuo

    test edx, edx
    jz .no_primo        ; Si edx == 0 → divisible → no primo

    inc ecx
    jmp .loop

.es_primo:
    pop eax             ; limpiar pila
    mov eax, 1
    ret

.no_primo:
    pop eax             ; limpiar pila
    mov eax, 0
    ret
