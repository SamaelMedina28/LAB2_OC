%include "../LIB/pc_iox.inc"


section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
	; LLamando a funciones externas
	extern pBin_dw 
;INCISO A
	mov eax, 0x22446688
	call pBin_dw ; Imprime el valor original en binario
	mov al,10	
	call putchar; cambio de linea
	mov eax, 0x22446688
	call pHex_dw ; Imprime el valor original en hexadecimal
	mov al,10	
	call putchar ; cambio de linea

	mov eax, 0x22446688
    ror eax, 4 ; Son cuatro por que es el tamaño de un valor hexadecimal
	call pBin_dw ; Imprime el valor modificado en binario
	mov al,10	
	call putchar; cambio de linea
	mov eax, 0x22446688
	ror eax, 4
	call pHex_dw ; Imprime el valor original en hexadecimal
	mov al,10	
	call putchar ; cambio de linea
	call putchar ; cambio de linea

; INCISO B
	mov cx, 0x3F48
	shr cx, 3
	sal cx, 8
	mov ax, cx
	call pHex_w ; Imprimo lo que hay en ax, que en este caso fueron los 16 bits que metimos






	mov al,10	; cambio de linea
	call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N dw 0x000 ,0xa,0 
