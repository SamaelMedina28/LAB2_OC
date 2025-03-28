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
	mul bl, 8
	mov N,bl
	mov ax,N
	call pHex_w
	



	mov al,10	; cambio de linea
	call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N dw 0x000 ,0xa,0 
