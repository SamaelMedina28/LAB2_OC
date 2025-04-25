
%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a
section	.text
	global _start       ;referencia para inicio de programa
	
_start: ; Direccionamiento directo
.inicio:
; INCISO A
    call getche	; espera a que el usuario presione una tecla
    cmp al, '0'
    jb .inicio ; Si el valor de al es menor que 0, salta a la etiqueta .inicio
    cmp al, '9'
    ja .inicio ; Si el valor de al es mayor que 9, salta a la etiqueta .inicio

    cmp al, '5'
    jnb .incisoB ; Si el valor de al no es menor que 0, salta a la etiqueta .fin

    mov al, 10
    call putchar ; cambio de linea

	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)
    
    mov al, 10
    call putchar ; cambio de linea
; INCISO B
.incisoB:
    mov al, 10
    call putchar ; cambio de linea
    call getche	; espera a que el usuario presione una tecla
    cmp al, '0'
    jb .letra ; Si el valor de al es menor que 0, salta a la etiqueta .inicio
    cmp al, '9'
    ja .letra ; Si el valor de al es mayor que 9, salta a la etiqueta .fin
    mov edx, msN ; Se imprime el mensaje de que es un número
    call puts			
    jmp .fin ; Salta a la etiqueta .fin
.letra:  
    cmp al, 'A'
    jb .fin ; Si el valor de al es menor que A, salta a la etiqueta .fin
    cmp al, 'Z'
    ja .fin ; Si el valor de al es mayor que Z, salta a la etiqueta .fin
    mov edx, msL ; Se imprime el mensaje de que es un número
    call puts			
    jmp .incisoC ; Salta a la etiqueta .incisoC

    mov al, 10
    call putchar ; cambio de linea

	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)
    
    mov al, 10
    call putchar ; cambio de linea
; INCISO C
.incisoC:
    mov cx, 0x05 
.inicioC:
    mov edx, puntito		; edx = dirección de la cadena msg
    call puts			; imprime cadena msg terminada en valor nulo (0)
    loop .inicioC ; decrementa cx y salta a la etiqueta .inicioC si cx no es cero
    


.fin:
    mov al, 10
    call putchar ; cambio de linea
	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'Es menor',0xa,0 
msN	db  ' <- Es numero',0xa,0 
msL	db  ' <- Es letra',0xa,0 
puntito db '*',0xa,0
