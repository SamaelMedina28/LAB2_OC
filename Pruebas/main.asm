%include "../LIB/pc_iox.inc"

section .text
    global inc
    global inc64b
    global getNibble
    global mayor
    global esPrimo
    global sumar
    global sumar1
inc:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    inc eax

    pop ebp
    ret
inc64b:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]

    add dword[eax], 1
    adc dword[eax+4], 0
    pop ebp
    ret
getNibble:
    push ebp
    mov ebp, esp

    mov edx, [ebp+8]
    mov cl, [ebp+12]
    inc cl
    shl cl, 2
    mov al, 32
    sub al, cl
    mov cl, al
    shl edx, cl
    shr edx, 28
    mov eax, edx

    pop ebp
    ret
mayor:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ecx, [ebp+12]
    mov edx, 0

.loop:
    cmp [eax], edx
    jng .next
    mov edx, [eax]
.next:
    add eax, 4
    loop .loop

    mov ecx, 0 ; contador de posicion en 0
    mov eax, [ebp+8]  ; primera direccion del array
.encontrar:
    cmp edx, [eax+ecx*4]
    je .encontrado
    inc ecx
    jmp .encontrar

.encontrado:
    mov eax, ecx
    pop ebp
    ret

esPrimo:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp+8] ;tiene el valor a comprobar
    cmp eax, 3
    jna .primo
    test eax, 1
    jz .noPrimo
    mov ecx, 3 ; divisor inicial
    mov ebx, eax
    shr ebx, 1 ; calcular la mitad del numero
.loop:
    mov eax, [ebp+8] ; recargar el numero a comprobar
    xor edx, edx ; limpiar edx
    div ecx ; dividir eax entre ecx
    cmp edx, 0 ; si el residuo es 0, no es primo
    jz .noPrimo
    add ecx, 2 ; incrementar el divisor en 2 (solo impares)
    cmp ecx, ebx
    jl .loop
.primo:
    mov eax, 1 ; es primo
    jmp .fin
.noPrimo:
    mov eax, 0 ; no es primo
.fin:
    pop ebx
    pop ebp
    ret


sumar1:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

    mov eax, [ebp+8] ; primer numero
    mov ecx, [ebp+12] ; segundo numero
    mov edx, [ebp+16] ; tercer numero (opcional)

    add ecx, edx ; sumar los dos numeros
    push ecx ; guardar el resultado en la pila
    push eax ; guardar el primer numero en la pila
    call sumar ; llamar a la funcion sumar
    add esp, 8 ; limpiar la pila

    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
sumar:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx

    mov eax, [ebp+8] ; primer numero
    mov ecx, [ebp+12] ; segundo numero

    add eax, ecx ; sumar los dos numeros

    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
