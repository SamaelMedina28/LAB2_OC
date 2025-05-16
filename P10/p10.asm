%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimientos externos para imprimir en hexadecimal

section .text
    global pbin8b
    
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
