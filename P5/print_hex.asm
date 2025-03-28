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

	mov al,15
	call pHex_b	; muestra en pantalla 64

	mov al,10	; cambio de linea
	call putchar

	mov ax,0x12ab 	; presenta en pantalla 12AB
	call pHex_w

	mov al,10 	; cambio de linea
	call putchar

	mov eax,1234ABCDh ; presenta en pantalla 1234ABCD
	call pHex_dw

	mov al,0x0a	  ; cambio de lines 10 decimal o bien 0A hex
	call putchar

	mov eax,0x76543210 ; presenta en pantalla 76543210
    call pHex_dw



	mov al,10       ; cambio de linea
	call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

