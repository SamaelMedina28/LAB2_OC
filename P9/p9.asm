%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimientos externos para imprimir en hexadecimal
%include "../LIB/pc_iox.inc"  
section	.text
    global _start       ; referencia para inicio del programa
    global suma         ; referencia para la función suma
    global getBit       ; referencia para la función getBit
    global strchr       ; referencia para la función strchr
suma:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]    ; Cargar el primer argumento en eax
    add eax, [ebp+12]   ; Sumar el segundo argumento
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp
    mov ecx, 0          ; Inicializar el contador de longitud
    mov eax, [ebp+8]    ; Cargar la dirección de la cadena en eax
.loop:
    cmp byte [eax+ecx], 0 ; Comparar el carácter actual con el terminador nulo
    je .fin              ; Si es nulo, saltar a la etiqueta .done
    inc ecx              ; Incrementar el contador
    jmp .loop            ; Repetir el bucle
.fin:
    pop ebp
    ret                  ; Devolver el tamaño de la cadena en ecx
strchr:
    push ebp
    mov ebp, esp
    mov esi, [ebp+8]    ; Cargar la dirección de la cadena en eax
    mov al, [ebp+12]   ; Cargar el carácter a buscar en ecx
.comp:
    cmp byte [esi], 0   ; Comparar el carácter actual con el terminador nulo
    je .not_found       ; Si es nulo, saltar a la etiqueta .not_found
    cmp [esi], al          ; Comparar la dirección de la cadena con 0
    je .found           ; Si es nulo, saltar a la etiqueta .found
    inc esi             ; Incrementar la dirección de la cadena
    jmp .comp           ; Repetir el bucle
.not_found:
    mov eax, 0       ; Si no se encontró el carácter, devolver 0
    jmp .done
.found:
    mov eax, esi        ; Si se encontró el carácter, devolver la dirección
.done:
    pop ebp
    ret                 ; Devolver la dirección de la cadena o 0

; Funcion para obtener el bit en la posición especificada
getBit:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]    ; Cargar el número en eax
    mov ecx, [ebp+12]   ; Cargar la posición del bit en ecx
    shr eax, cl         ; Desplazar a la derecha el número por la posición del bit
    and eax, 1          ; Obtener el bit menos significativo
    pop ebp
    ret                 ; Devolver el bit en eax