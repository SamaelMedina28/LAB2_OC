%include "../LIB/pc_io.inc"    ; Incluye putchar
section .text
    global _start

_start:
    mov al, 0x33        ; Cargar el valor 0x33 en AL
    call print_nibble   ; Imprime nibble inferior
    
    ; Salto de línea
    mov al, 10         ; ASCII de '\n'
    call putchar
    
    ; Salir
    mov eax, 1
    int 0x80

print_nibble:
    push eax           ; Guarda EAX (para preservar AL)
    and al, 0x0F       ; Aísla nibble inferior (0x3F → 0x0F)
    cmp al, 9
    jbe .digito        ; Si AL <= 9, salta a .digito
    add al, 'A' - 10   ; Convertir 0xA-0xF a 'A'-'F'
    jmp .imprimir
.digito:
    add al, '0'        ; Convertir 0x0-0x9 a '0'-'9'
.imprimir:
    call putchar       ; Imprime el carácter en AL
    pop eax            ; Restaura EAX (y AL)
    ret