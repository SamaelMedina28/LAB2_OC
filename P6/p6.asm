%include "../LIB/pc_iox.inc"


section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
	; LLamando a funciones externas
	extern pBin_dw 
	extern pBin_w 

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
	mov ax, cx
	call pBin_w ; Imprime el valor original en binario
	mov al,10
	call putchar ; cambio de linea

	mov cx, 0x3F48
	mov ax, cx
	call pHex_w ; Imprime el valor original en hexadecimal
	mov al,10
	call putchar ; cambio de linea

	mov cx, 0x3F48
	sal cx, 3
	mov ax, cx
	call pBin_w ; Imprime el valor modificado en binario
	mov al,10
	call putchar ; cambio de linea

	mov cx, 0x3F48
	sal cx, 3
	mov ax, cx
	call pHex_w ; Imprime el valor modificado en hexadecimal
mov al,10	
	call putchar; cambio de linea
	call putchar; cambio de linea


; INCISO C
	mov esi, 0x20D685F3
	mov eax, esi
	call pBin_dw ; Imprime el valor original en binario
	mov al,10	
	call putchar; cambio de linea
	mov esi, 0x20D685F3
	xor esi, 0x84042002;1000 0100 0000 0100 0010 0000 0000 0010
	mov eax, esi
	call pBin_dw ; Imprime el valor modificado en binario
mov al,10	
	call putchar; cambio de linea
	call putchar; cambio de linea
; INCISO D
	push esi
	pop eax
	call pBin_dw ; Imprime el valor modificado en binario




	mov al,10	
	call putchar; cambio de linea
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

section	.data
N dw 0x000 ,0xa,0 
