	; uncomment following two lines if using 16f627 or 16f628. config uses internal oscillator
	LIST	p=16F628		;tell assembler what chip we are using
	include "P16F628.inc"		;include the defaults for the chip
	__config 0x3D18			;sets the configuration settings (oscillator type etc.)

	cblock 	0x20 			;start of general purpose registers
		count1 			;used in delay routine
		counta 			;used in delay routine 
		countb 			;used in delay routine
		
		countc
		countd
		counte
	endc

; Turn on an LED on pin B8 (or any PORTB pin)

; un-comment the following two lines if using 16f627 or 16f628
	movlw	0x07
	movwf	CMCON			;turn comparators off (make it like a 16F84)
	
; set b port for output, a port for input
	bsf	STATUS,RP0
	movlw	0x00
	movwf	TRISB			; portb is output
	movlw	0x00			; porta is output
	movwf	TRISA			; porta is input
	bcf	STATUS,RP0		; return to bank 0

top_o_loop
; PortB Left-Wheel
; Start with led off. off for 20ms
	movlw	0x00
	movwf	PORTB
	call	delay_100_milli
	
; turn led on ON should be equal to 1.7ms
	movlw	0xff
	movwf	PORTB
	call	delay_100_milli
	
; PortA Right-Wheel 
; Start with led on. ON should be equal to 1.3ms
	movlw	0x00 ; this is where we could designate an exact pin to tramit to
	movwf	PORTA
	call	delay_short
	
; turn led off for 20ms
	movlw	0xff
	movwf	PORTA
	call	delay_100_milli
	
; loop again
	goto top_o_loop
	
delay_short
	movlw	0x01		; 0x1 in decimal is 1
	movwf	countd		; don't use counta here
	
delay_100_loop_short
	call	delay_1_milli
	decfsz	countd
	goto	delay_100_loop_short
	return			; this takes 2microseconds	
	
; Left-Wheel
delay_100_milli
	movlw	0x14		; 0x14 in decimal is 20
	movwf	countb		; don't use counta here
	
delay_100_loop
	decfsz	countb
	goto	delay_100_loop
	return			; this takes 2 microseconds
	
delay_1_milli
	movlw 	0xf9		; 0xf9 is decimal 249
	movwf	counta
	
delay_1_loop
	nop
	decfsz	counta		; 4x249=996 microseconds
	goto	delay_1_loop	; 4 microseconds taken by this loop
	return

	end
