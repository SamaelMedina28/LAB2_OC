%include "../LIB/pc_iox.inc"

section .text
    global NotBit32b
    global str_cnt_chr

NotBit32b:
    push ebp
    mov ebp, esp 
    push ebx
    push edx
    ; _______ 
    mov eax, [ebp+8]   ; El valor original de 32 bits
    mov cl, [ebp+12]   ; La posicion del bit a negar
    mov edx, 1
    shl edx, cl
    xor eax, edx
    ; _______
    pop edx
    pop ebx
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
