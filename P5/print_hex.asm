%include "../LIB/pc_iox.inc"


section	.text

	global _start       

_start:                     ;tell linker entry point

;INCISO A
	mov ebx, 0x5C4B2A60      ; Carga valor inicial en EBX
    mov eax, ebx             ; Copia EBX a EAX para imprimir 
    call pHex_dw             ; Imprime valor original  
    
    mov al, 10               
    call putchar             ; Imprime salto de línea 

    add ebx, 0x02201202      ; Suma matrícula al acumulador 
    mov eax, ebx             ; Copia resultado a EAX 
    call pHex_dw             ; Imprime resultado de la suma 

    mov al, 10               
    call putchar
    call putchar             ; Doble salto de línea 

;INCISO B
	
	push bx                  ; Guarda los 16 bits menos significativos de EBX en la pila
    mov ax, bx               ; Copia BX a AX
    call pHex_w              ; Imprime valor de AX 
    
    mov al, 10
    call putchar
    call putchar             ; Doble salto de línea

; INCISO C
    mov cl, 8                ; Carga 8 en CL para multiplicar
    mov al, bl               ; Mueve BL (byte bajo de EBX) a AL
    mul cl                   ; Multiplica AL*CL, resultado en AX
    mov [N], ax              ; Guarda resultado en variable N
    call pHex_w              ; Imprime resultado
    
    mov al, 10
    call putchar
    call putchar             ; Doble salto de línea

; INCISO D

	add word [N], 1          ; Incrementa N en 1
    mov ax, [N]              ; Carga N en AX
    call pHex_w              ; Imprime N incrementado
    
    mov al, 10
    call putchar
    call putchar             ; Doble salto de línea
 

; INCISO E
    mov ax, bx               ; Carga BX en AX para división
    mov cl, 0xFF             ; Divisor = 255
    div cl                   ; Divide AX/CL → AL=cociente, AH=residuo
    call pHex_w              ; Imprime AX (contiene residuo y cociente)

    mov cl, al               ; Guarda cociente en CL
    mov al, 10
    call putchar             ; Salto de línea

    mov al, ah               ; Mueve residuo a AL
    call pHex_b              ; Imprime residuo (8 bits)
    
    mov al, 10
    call putchar             ; Salto de línea

    mov al, cl               ; Recupera cociente
    call pHex_b              ; Imprime cociente (8 bits)
    
    mov al, 10
    call putchar
    call putchar             ; Doble salto de línea

; INCISO F

    add byte [N], ah         ; Suma el residuo a N (solo byte bajo)
    mov ax, [N]
    call pHex_w              ; Imprime nuevo valor de N
    
	mov al,10	; cambio de linea
	call putchar 

    dec word [N]             ; Decrementa N
    mov ax, [N]
    call pHex_w              ; Imprime N decrementado

	mov al, 10              ; Salto de línea
	call putchar
	
    ; Análisis de banderas
    pushfd                   ; Guarda EFLAGS en la pila
    pop eax                  ; Recupera en EAX
    call pHex_dw             ; Imprime estado de banderas

	; Vemos que se activaron 2 banderas, la de paridad P y la de acarreo C
	; Esto se debe a que en la ultima operacino unicamente usamos los 8 bits menos ignificativos de N al sumarselos con AH, y ya que esta suma supero los bits que tenia disponibles, el carry se activo
	; Y el de paridad se activo unicamente por que el resultado de la operacion de decrementar N dio un numero par (E)
	
    mov al, 10
    call putchar
    call putchar             ; Doble salto de línea

; INCISO G
    pop ax                   ; Saca valor guardado en Inciso B
    call pHex_w              ; Debe coincidir con valor original
    
    mov al, 10
    call putchar             ; Salto de línea

    ; Fin del programa
    mov eax, 1              ; Llamada al sistema para salir
    int 0x80

section	.data
N dw 0x0000 
