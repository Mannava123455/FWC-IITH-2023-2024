.include "/home/mannava/Desktop/assembly/m328Pdef.inc"


ldi r17,0b11000011  ;declaring 2,3,4,5 pins as input pins
out DDRD,r17
ldi r17,0b11111111  ;  activating pull ups
out PORTD,r17

ldi r16,0b00100000    ;Declaring 13th pin as output pin
out DDRB,r16

main:

in r17,PIND          ; taking inputs from 2,3,4,5 pins of arduino

mov r18,r17        ;r18 is x0
mov r19,r17        ;r19 is x1
mov r22,r17        ; r22 is x2
mov r23,r17        ;r23 is x3

ldi r31,0b00000100
and r18,r31
ldi r20,0b00000010  ; counter=2
rcall loopw          ; shifting 2 bits right side
ldi r30,0b00001000
and r19,r30
ldi r21,0b00000011  ;counter=3
rcall loopx          ; shifting 3 bits right side
ldi r29,0b00010000
and r22,r29
ldi r16,0b00000100   ;counter=4
rcall loopy             ;shifting 4 bits right side
ldi r28,0b00100000
and r23,r28
ldi r17,0b00000101   ;counter =5 
rcall loopz         ; shifting 5 bits right side
mov r24,r18           
ldi r27,0b00000001
eor r24,r27           ;r24=!x0
ldi r26,0b00000001
eor r23,r26           ;r23=!x3
or r23,r22            ;r23=!x3+x2
and r23,r19           ;r23=(!x3+x2)*x1
or r23,r24            ;r23=((!x3+x2)*x1)+!x0

ldi r27,0b00000101    ;counter =5
rcall loopv           ;shift 5 bits to words left i.e 13 th pin
out PORTB,r23         ; The output is taken at 13 th pin of arduino and it is given to seven segmment display.`

rjmp main


Start:
rjmp Start

loopw:	lsr r18			;right shift
	    dec r20			;counter --
	    brne	loopw	;if counter != 0
	    ret
	
loopx:	lsr r19			;right shift
	    dec r21			;counter --
	    brne	loopx	;if counter != 0
	    ret
loopy:	lsr r22			;right shift
	    dec r16			;counter --
	    brne	loopy	;if counter != 0
	    ret
loopz:	lsr r23			;right shift
	    dec r17			;counter --
	    brne	loopz	;if counter != 0
	    ret
loopv:	lsl r23			;leftshift shift
	    dec r27		;counter --
	    brne	loopv	;if counter != 0
	    ret
