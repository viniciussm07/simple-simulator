loadn r0, #0
loadn r1, #'O'

Loop:
outchar r1, r0  ; Desenha
inc r0          ; Recalcula
inc r0          ; Recalcula
call Delay


jmp Loop        ;


halt

;----------------------------------
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