loadn r0, #1000
loadn r1, #1158

Loop:
call Apaga

inc r0          ; Recalcula

call Desenha

call Delay

cmp r0, r1
jne Loop

loadn r0, #0
jmp Loop



halt
;----------------------------------
; ----------- Apaga
Apaga:
; Mantem registradores depois da função
push r1
push r3
push r4

loadn r1, #' '
outchar r1, r0  ; Desenha 1ro char
loadn r4 #1
add r3, r0, r4
outchar r1, r3  ; Desenha 2ro char
loadn r4, #40
add r3, r0, r4
outchar r1, r3 ; Desenha 3ro char
loadn r4, #41
add r3, r0, r4
outchar r1, r3  ;  Desenha 4ro char

; Mantem registradores depois da função
pop r4
pop r3
pop r1

rts
; ----------- Apaga

; ----------- Desenha
Desenha:
; Mantem registradores depois da função
push r1
push r3
push r4

loadn r1, #'<'
outchar r1, r0  ; Desenha 1ro char
loadn r1, #'>'
loadn r4 #1
add r3, r0, r4
outchar r1, r3  ; Desenha 2ro char
loadn r1, #'='
loadn r4, #40
add r3, r0, r4
outchar r1, r3 ; Desenha 3ro char
loadn r1, #'?'
loadn r4, #41
add r3, r0, r4
outchar r1, r3  ;  Desenha 4ro char

; Mantem registradores depois da função
pop r4
pop r3
pop r1

rts
; ----------- Desenha

Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #5  ; a
   Delay_volta2:				; contador de tempo quebrado em duas partes (dois loops de decremento)
	Loadn R0, #3000	; b
   Delay_volta: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return

;-------------------------------