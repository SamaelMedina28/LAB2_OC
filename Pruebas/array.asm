%include "../LIB/pc_iox.inc"

section .text
    global _start


_start:

    mov edx, mensaje  ; Cargar la dirección del mensaje en EDX
    call puts

    mov ecx, 0
    mov edx, 0

.loop:
    cmp ecx, 10       ; Comprobar si hemos alcanzado el final del array
    jge .end          ; Si ecx >= 10, saltar al final
    mov al, [array + ecx * 4] ; Cargar el elemento actual del array en AL
    cmp al, dl
    jng .next         ; Si el elemento actual es menor o igual que dl, saltar a next
    xor edx, edx      ; Si es mayor, reiniciar edx a 0
    mov dl, al      ; Actualizar edx con el nuevo mayor
.next:
    add ecx, 1        ; Mover al siguiente elemento del array
    jmp .loop

.end:
    mov al, dl
    add al, '0'       ; Convertir el número a su representación ASCII
    call putchar       ; Imprimir el mayor encontrado
    mov al, 0x0A      ; Nueva línea
    call putchar       ; Imprimir nueva línea
    mov eax, 1         ; Código de salida
    int 0x80         ; Llamada al sistema para salir


section .data
mensaje db "Hello, World!", 0x0A , 0; Mensaje a imprimir
array dd 1, 2, 3, 4, 5, 6, 7, 2, 1, 0 ; Un ejemplo de array
