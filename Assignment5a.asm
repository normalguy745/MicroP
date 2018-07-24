.INCLUDE "M32DEF.INC"

;SETTING THE INPUTS
CBI DDRA, 0 ;PINA.0 CLEARED

;SETTING OUTPUTS
LDI R16, 0xFF
OUT DDRC, R16
OUT DDRD, R16
OUT PORTC, R16  ;LED OFF
OUT PORTD, R16  ; LED OFF

;SETTING ADC
LDI R16, 0xE0   ;LEFT JUST, 2.56, ADC0
OUT ADMUX, R16
LDI R16, 0x85
OUT ADCSRA, R16 ;ADCSRA SET, CK/32

START:
SBI ADCSRA, ADSC ;START THE CONVERSION
LOOP:
SBIS ADCSRA,ADIF    ;CHECK IF CONVERSION DONE
RJMP LOOP   ;LOOP IF NOT DONE
SBI ADCSRA, ADIF    ;CLEAR DONE FLAG BY SETTING HIGH

IN R16, ADCH  ;READ HIGH FIRST
IN R17, ADCL  ;READ LOW NEXT

;COMPLEMENT BECAUSE LEDS ON-LOW
COM R16
COM R17

OUT PORTD, R16
OUT PORTC, R17

RJMP START
