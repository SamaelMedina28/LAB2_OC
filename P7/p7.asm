
%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a
section	.text
	global _start       ;referencia para inicio de programa
	
_start: ; Direccionamiento directo
.inicio:
    call getche	; espera a que el usuario presione una tecla
    cmp al, 0x30
    jb .inicio ; Si el valor de al es menor que 0x32, salta a la etiqueta .inicio
    cmp al, 0x39
    ja .inicio ; Si el valor de al es mayor que 0x39, salta a la etiqueta .fin

    cmp al, 0x35
    jnb .fin ; Si el valor de al es menor que 0x35, salta a la etiqueta .menor

    mov al, 10
    call putchar ; cambio de linea

	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

.fin:
    mov al, 10
    call putchar ; cambio de linea
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'Es menor',0xa,0 
