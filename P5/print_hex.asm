%include "../LIB/pc_iox.inc"


section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

;INCISO A
	mov ebx, 0x5C4B2A60
	mov eax, ebx
	call pHex_dw ; Imprime el valor de eax original
	
	mov al,10	; cambio de linea
	call putchar

	add ebx, 0x02201202  ; Le suma al aculador mi matricula
	mov eax, ebx
	call pHex_dw ; Imprime el resultado de la suma de la matricula

	mov al,10	; cambio de linea
	call putchar
	call putchar

;INCISO B
	
	push bx ; Se agregaron los 16 bits menos significativos de ebx a la pila
	mov ax, bx
	call pHex_w ; Imprimo lo que hay en ax, que en este caso fueron los 16 bits que metimos
	mov al,10	; cambio de linea
	call putchar
	call putchar

; INCISO C
	mov cl, 8
	mov al,bl
	mul cl
	mov [N], ax
	call pHex_w
	mov al,10	; cambio de linea
	call putchar
	mov al,10	; cambio de linea
	call putchar

; INCISO D

	ADD word [N], 1
	mov  ax,[N]
	call pHex_w
	mov al,10	; cambio de linea
	call putchar 
	mov al,10	; cambio de linea
	call putchar  

; INCISO E
	mov ax, bx
	mov cl, 0xFF
	div cl
	call pHex_w

    mov cl, al ;Guardo el valor de AL para despues imprimirlo   que tiene el cociente
	mov al,10	; cambio de linea
	call putchar   ; Imprimo completo ax 
     

	mov al, ah      ; Imprimo AH que contiene el reciduo
    call pHex_b   

	mov al,10	; cambio de linea
	call putchar  

    mov al, cl	;Imprimo AL
    call pHex_b 
	mov al,10	; cambio de linea
	call putchar 
	mov al,10	; cambio de linea
	call putchar 

; INCISO F

	add byte [N], ah
	mov ax, [N]
	call pHex_w 
	mov al,10	; cambio de linea
	call putchar 
	dec word [N]
	mov ax, [N]
	call pHex_w 
	mov al, 10              ; Salto de línea
	call putchar
	
	pushfd                  ; Push EFLAGS a la pila
	pop eax                 ; Pop a EAX para manipularlo

	
	call pHex_dw            ; Imprime el valor de EFLAGS 
	; Vemos que se activaron 2 banderas, la de paridad P y la de acarreo C
	; Esto se debe a que en la ultima operacino unicamente usamos los 8 bits menos ignificativos de N al sumarselos con AH, y ya que esta suma supero los bits que tenia disponibles, el carry se activo
	; Y el de paridad se activo unicamente por que el resultado de la operacion de decrementar N dio un numero par (E)
	mov al, 10              ; Salto de línea
	call putchar
	mov al,10	; cambio de linea
	call putchar

; INCISO G

	


	



	mov al,10	; cambio de linea
	call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N dw 0x0000 
