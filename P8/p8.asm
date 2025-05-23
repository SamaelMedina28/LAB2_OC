%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimientos externos para imprimir en hexadecimal
%include "../LIB/pc_iox.inc"  
section	.text
    global _start       ; referencia para inicio del programa
    
_start:
    extern pBin_dw

; INCISO A (pedir datos al usuario y guardarlos en un array)
    mov ecx, 10 ; define el tamaño del buffer
    mov esi, 0 ; edx = 0
    mov ebx, buffer ; ebx almacena el lugar de memoria donde se guardara el caracter

    cmp ecx, 10
    ja .fin ; Si ecx no es menor que 10, brinca a .fin
    cmp ecx, 1
    jb .fin ; Si ecx es menor que 1, brinca a .fin

.pedir_num:
    call getch	; espera a que el usuario presione una tecla y lo guarda en al
    sub al, 0x30 ; convierte el caracter a su valor numerico
    cmp al, 9
    ja .fin ; Si al es mayor que 9, brinca a .fin
    mov [ebx + esi], al ; guarda el caracter en el arreglo buffer
    inc esi ; incrementa el contador de caracteres
; INCISO B (imprimir en hexadecimal el vector)
    add al , 0x30 ; convierte el valor numerico a su caracter
    call pHex_b ; imprime el caracter en hexadecimal (considerece que lo imprimira como 0030+al ya que lo pasamos a caracter)
    mov al, 10
    call putchar ; salto de linea
    loop .pedir_num ; decrementa ecx y regresa a .pedr_num si ecx no es cero

; INCISO C Suma de dos vectores




  
    mov al, 10
    call putchar ; salto de linea

    mov edx, msg		; edx = direccion de la cadena msg
    call puts			; imprime la cadena msg (terminada en 0)



.fin:
    mov al, 10
    call putchar ; salto de linea
    mov	eax, 1	    	; llamada al sistema para terminar el programa
    int	0x80        	; llamada al sistema - fin del programa

section	.data
msg	db  'Fin del programa...',0xa,0 


section .bss
buffer resb 10
