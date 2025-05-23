%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimientos externos para imprimir en hexadecimal

section .text
    global pbin8b
    global pbin16b
    global pbin32b
    
pbin8b:
    push ebp
    mov ebp, esp ; Protocolo de entrada
    push ebx

    mov dl, [ebp+8] ; Cargar el byte a imprimir en DL
    mov ecx, 8 ; Inicializar el contador de bits a 8
.loop: ; Bucle para imprimir los bits
    shl dl, 1 ; Desplazar el byte a la izquierda
    jc .print1 ; Si el bit más significativo es 1, saltar a imprimir 1
    mov eax, '0' ; Cargar 0 en EAX
    jmp .print ; Saltar a imprimir

.print1:
    mov eax, '1' ; Cargar 1 en EAX
    jmp .print ; Saltar a imprimir
.print:
    call putchar ; Llamar a la función para imprimir el carácter
    
    loop .loop ; Decrementar el contador y repetir si no es cero

    pop ebx
    pop ebp ; Protocolo de salida

    mov al, 10
    call putchar ; Imprimir un salto de línea
    ret ; Devolver al llamador
pbin16b:
    push ebp
    mov ebp, esp ; Protocolo de entrada
    push ebx
    push edx
    push eax
    push ecx

    mov dx, [ebp+8] ; Cargar el valor de 16 bits en DX

    mov al, dh      ; Obtener el byte alto
    push eax        ; Pasar como argumento
    call pbin8b     ; Imprimir byte alto
    add esp, 4      ; Limpiar la pila

    mov al, dl      ; Obtener el byte bajo
    push eax        ; Pasar como argumento
    call pbin8b     ; Imprimir byte bajo
    add esp, 4      ; Limpiar la pila
    pop ecx
    pop eax
    pop edx

    pop ebx
    pop ebp         ; Protocolo de salida
    ret             ; Devolver al llamador
pbin32b:
    push ebp
    mov ebp, esp ; Protocolo de entrada
    push ebx
    push edx
    push eax
    push ecx

    mov edx, [ebp+8] ; Cargar el valor de 32 bits en EAX
    mov eax, edx      ; Copiar el valor a EAX`

    mov ax, dx      ; Obtener el byte bajo
    shl eax, 16     ; Desplazar a la izquierda para obtener el byte alto
    push eax        ; Pasar como argumento
    call pbin16b     ; Imprimir byte bajo
    add esp, 4      ; Limpiar la pila

    shr eax, 16     ; Desplazar a la derecha para obtener el byte alto
    mov dx, ax      ; Obtener el byte alto
    push eax        ; Pasar como argumento
    call pbin16b     ; Imprimir byte alto
    add esp, 4      ; Limpiar la pila

    pop ecx
    pop eax
    pop edx

    pop ebx
    pop ebp         ; Protocolo de salida
    ret             ; Devolver al llamador