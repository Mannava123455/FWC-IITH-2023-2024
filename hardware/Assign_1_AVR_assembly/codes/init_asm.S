#define __SFR_OFFSET 0
#include <avr/io.h>

.global init

.section .text

init:
	LDI R16,0b00100000
	OUT DDRB,R16
        ldi r17,0b11000011  ;declaring 2,3,4,5 pins as input pins
        out DDRD,r17
        ldi r17,0b11111111  ;  activating pull ups
        out PORTD,r17
        ret
