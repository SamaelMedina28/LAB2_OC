%include "../LIB/pc_iox.inc"

section .text
    global NotBit32b
    global str_cnt_chr
    global shr_s
    global isPrime
    global XchgBits

NotBit32b:
    push ebp
    mov ebp, esp
    ; _______
    mov eax, [ebp+8]   ; El valor original de 32 bits
    mov cl, [ebp+12]   ; La posicion del bit a negar
    mov edx, 1
    shl edx, cl
    xor eax, edx
    ; _______
    pop ebp
    ret  ;retorna el valor de eax

str_cnt_chr:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp+8]    ; Puntero al string (char*)
    mov dl, [ebp+12]    ; Caracter a buscar (char, en EDX de 8 bits)
    xor ebx, ebx        ; Contador de coincidencias (inicializado a 0)

.loop:
    cmp byte [eax], 0
    je .fin
    cmp [eax], dl
    jne .next
    inc ebx

.next:
    inc eax
    jmp .loop

.fin:
    mov eax, ebx

    pop ebx
    pop ebp
    ret

shr_s:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]
    sar eax,1

    pop ebp
    ret
isPrime:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp+8]

    cmp eax, 3 ;si es igual o menor a 3 es primo
    jna .primo

    mov ecx, 2
    mov ebx, eax
.loop:
    xor edx, edx
    mov eax, ebx
    div ecx
    cmp edx, 0
    jz .noPrimo
    inc ecx
    cmp ecx, ebx
    jae .primo
    jmp .loop
.primo:
    mov eax, 1
    jmp .fin
.noPrimo:
    mov eax, 0
.fin:
    pop ebx
    pop ebp
    ret
XchgBits:
    push ebp
    mov ebp, esp
    push ebx

    ;Sacando los parametros
    mov eax, [ebp + 8]   ;Primer parametro de derecha a izquierda
    mov cl, [ebp+12]    ;Segundo parametro, posicion de bit
    mov bl, [ebp+16]    ;Tercer parametro, posicion de bit

    mov edx, eax
    shr edx, cl
    and edx, 1
    
    mov edi, eax
    mov cl, bl
    shr edi, cl
    and edi, 1
    
    cmp edx, edi
    je .fin

    mov esi, 1
    mov cl, [ebp+12]
    shl esi, cl
    mov edi, 1
    mov cl, [ebp+16]
    shl edi, cl
    or esi, edi
    xor eax, esi

.fin:
    pop ebx
    pop ebp
    ret


