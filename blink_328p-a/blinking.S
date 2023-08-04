/* wa1tnr 04 Aug 2023 22:25z */
/* Fri Aug  4 22:25:02 UTC 2023 */

/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

/* not much taken from it, just 0x04 vs 0x24 for DDRB &c */

/*
   trying 4 Aug 21:59 UTC 2023:

   http://www.rjhcoding.com/avr-asm-tutorials.php

   "AVRASM2 is the official Atmel assembler"

*/

// .include "m328pdef.inc"
// https://github.com/DarkSector/AVR/blob/master/asm/include/m328Pdef.inc


// #include "avr/io.h"  // uri shaked used this

.equ nDDRB,  0x04 /* 0x24 */
.equ nPORTB, 0x05 /* 0x25 */ /* 13.4.2 */

.equ nPB5, 0x20 // D13  '1 << PORTB5'  or '1 << PB5'
.equ nPB4, 0x10 // D12
.equ nPB3, 0x08 // D11
.equ nPB2, 0x04 // D10
.equ nPB1, 0x02 //  D9
.equ nPB0, 0x01 //  D8

.global start
.global vmain

_delay_ms:
  ; Delay about (r25:r24)*ms. Clobbers r30, and r31.
  ; One millisecond is about 16000 cycles at 16MHz.
  ; The inner loop takes 4 cycles, so we repeat it 3000 times
  ldi   r31, hi8(4000)
  ldi   r30, lo8(4000)
1:
  sbiw    r30, 1
  brne    1b
  sbiw    r24, 1
  brne    _delay_ms
  ret

delay_ms:
  ldi   r25, hi8(450)
  ldi   r24, lo8(450)
  call _delay_ms
  ret

output_mode_select_gpio:
  ldi  r17, 0x0 | nPB5 | nPB4 | nPB3 | nPB2 | nPB1 | nPB0
	out  nDDRB, r17
	ret

xall_leds_OFF:
  ldi  r17, 0x00
	out  nPORTB, r17
	ret

/*
light_LED:
  pop  r18
  pop  r19
  out  nPORTB, r19
  ret
*/
// .equ dorf, nPB5

led_13_ON:
  ldi r17, nPB5
  out  nPORTB, r17
	ret

led_13_OFF:
  ldi r17, ! (0xff ^ nPB5)
  out  nPORTB, r17
	ret

led_D12_PB4_ON:
  ldi  r17, nPB4
	out  nPORTB, r17
	ret

led_D12_PB4_OFF:
  ldi  r17, ! (0xff ^ nPB4)
  out  nPORTB, r17
  ret

led_11_ON:
  ldi  r17, nPB3
  out  nPORTB, r17
  ret

led_11_OFF:
  ldi  r17, ! (0xff ^ nPB3)
	out  nPORTB, r17
  ret

led_10_ON:
  ldi  r17, nPB2
	out  nPORTB, r17
  ret

led_10_OFF:
  ldi  r17, ! (0xff ^ nPB2)
	out  nPORTB, r17
  ret

led_09_ON:
  ldi  r17, nPB1
	out  nPORTB, r17
  ret

led_09_OFF:
  ldi  r17, ! (0xff ^ nPB1)
	out  nPORTB, r17
  ret

led_08_ON:
  ldi  r17, nPB0
	out  nPORTB, r17
  ret

led_08_OFF:
  ldi  r17, ! (0xff ^ nPB0)
	out  nPORTB, r17
  ret

sp_ini:
  // ldi	r16,LOW(RAMEND)
	// out	SPL,r16
	// ldi	r16,HIGH(RAMEND)
	// out	SPH,r16
  ret

start:
  call sp_ini
  call output_mode_select_gpio
	call delay_ms
	ret

vmain:
  call  led_13_ON
  call  delay_ms
  call  led_13_OFF
  call  delay_ms

  call  delay_ms
  call  delay_ms
  call  delay_ms

  call  led_D12_PB4_ON
  call  delay_ms
  call  led_D12_PB4_OFF
  call  delay_ms

  call  led_11_ON
  call  delay_ms
  call  led_11_OFF
  call  delay_ms

  call  led_10_ON
  call  delay_ms
  call  led_10_OFF
  call  delay_ms

  call  led_09_ON
  call  delay_ms
  call  led_09_OFF
  call  delay_ms

  call  led_08_ON
  call  delay_ms
  call  led_08_OFF
  call  delay_ms

  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms

	ret

/* end */
