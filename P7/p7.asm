%include "../LIB/pc_iox.inc"  	; incluir declaraciones de procedimientos externos
                                ; que estan en la biblioteca libpc_io.a
section	.text
    global _start       ; referencia para inicio del programa
    
_start: ; Direccionamiento directo
.inicio:
; INCISO A
    call getche	; espera a que el usuario presione una tecla
    cmp al, '0'
    jb .inicio ; Si al es menor que 0, regresa a .inicio
    cmp al, '9'
    ja .inicio ; Si al es mayor que 9, regresa a .inicio

    cmp al, '5'
    jnb .incisoB ; Si al no es menor que 5, brinca a .incisoB

    mov al, 10
    call putchar ; salto de linea

    mov edx, msg		; edx = direccion de la cadena msg
    call puts			; imprime la cadena msg (terminada en 0)
    
; INCISO B
.incisoB:
    mov al, 10
    call putchar ; salto de linea
    call getche	; espera a que el usuario presione una tecla
    cmp al, '0'
    jb .letra ; Si al es menor que 0, brinca a .letra
    cmp al, '9'
    ja .letra ; Si al es mayor que 9, brinca a .letra
    mov edx, msN ; Mensaje de que es un numero
    call puts			
    jmp .incisoC ; Brinca a .incisoC
.letra:  
    cmp al, 'A'
    jb .fin ; Si al es menor que A, brinca a .fin
    cmp al, 'Z'
    ja .fin ; Si al es mayor que Z, brinca a .fin
    mov edx, msL ; Mensaje de que es una letra
    call puts			
    jmp .incisoC ; Brinca a .incisoC

    mov al, 10
    call putchar ; salto de linea

    mov edx, msg		; edx = direccion de la cadena msg
    call puts			; imprime la cadena msg (terminada en 0)
    
    mov al, 10
    call putchar ; salto de linea
    ;biblibioteca de c: apt-get install libc6-dev-i386
    ;sudo
; INCISO C
.incisoC:
    mov cx, 0x05 
.bucle:
    mov al, '*'		; imprime un asterisco
    call putchar			
    loop .bucle ; decrementa cx y regresa a .bucle si cx no es cero
;INCISO D
    mov ecx, 0  
    mov al, 10
    call putchar ; salto de linea
.captura:
    call getche          ; lee un caracter del teclado
    mov [buffer + ecx], al ; guarda el caracter en el arreglo
    inc ecx              ; incrementa el indice
    cmp ecx, 10          ; checa si ya se capturaron 10 caracteres
    jb .captura          ; si no, repite el bucle
    mov al, 10
    call putchar         ; imprime salto de linea
    ; Mensaje de confirmacion
    mov edx, msC  ; carga la direccion del mensaje
    call puts            ; imprime el mensaje
    ; Imprime los caracteres guardados en el arreglo
    mov ecx, 0           ; reinicia el indice en 0
.imprimir:
    mov al, [buffer + ecx] ; carga el caracter desde el arreglo
    call putchar         ; imprime el caracter
    mov al, 10           ; salto de linea
    call putchar         ; imprime salto de linea
    inc ecx              ; incrementa el indice
    cmp ecx, 10          ; checa si ya se imprimieron 10 caracteres
    jb .imprimir  
.fin:
    mov al, 10
    call putchar ; salto de linea
    mov	eax, 1	    	; llamada al sistema para terminar el programa
    int	0x80        	; llamada al sistema - fin del programa

section	.data
msg	db  'Es menor',0xa,0 
msN	db  ' <- Es numero',0xa,0 
msL	db  ' <- Es letra',0xa,0 
msC db 'Caracteres capturados',0xa,0
section .bss
buffer resb 10
