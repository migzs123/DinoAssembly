;########################################################################
;#                                                                      #
;#                         CODIGO PRINCIPAL                             #
;#                                                                      #
;########################################################################

jmp main

main: 
  loadn r0, #500
Loop:
    call Apaga
    call Desenha
    call Delay
    jmp Loop
halt

Desenha:
    ; Salva registradores antes de modificar
    push r1
    push r3
    push r4

    loadn r1, #'!'
    outchar r1, r0  ; Desenha 1ro char
    loadn r1, #'"'  
    loadn r4, #1
    add r3, r0, r4
    outchar r1, r3  ; Desenha 2ro char
    loadn r1, #'#'
    loadn r4, #40
    add r3, r0, r4
    outchar r1, r3  ; Desenha 3ro char
    loadn r1, #'$'
    loadn r4, #41
    add r3, r0, r4
    outchar r1, r3  ; Desenha 4ro char

    ; Restaura registradores
    pop r4
    pop r3
    pop r1

    rts


Apaga:
    ; Salva registradores antes de modificar
    push r1
    push r3
    push r4

    loadn r1, #' '
    outchar r1, r0  ; Desenha 1ro char
    loadn r4, #1
    add r3, r0, r4
    outchar r1, r3  ; Desenha 2ro char
    loadn r4, #40
    add r3, r0, r4
    outchar r1, r3  ; Desenha 3ro char
    loadn r4, #41
    add r3, r0, r4
    outchar r1, r3  ; Desenha 4ro char

    ; Restaura registradores
    pop r4
    pop r3
    pop r1

    rts



Delay:
    ; Salva registradores antes de modificar
    push r0
    push r1

    loadn r1, #5        ; Loop externo
Delay_volta2:
    loadn r0, #3000     ; Loop interno
Delay_volta: 
    dec r0
    jnz Delay_volta 
    dec r1
    jnz Delay_volta2

    ; Restaura registradores
    pop r1
    pop r0

    rts
