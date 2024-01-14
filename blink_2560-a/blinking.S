/* wa1tnr  Sun 14 Jan 03:41:38 UTC 2024 */

/* clumsy use of OR - but feels comfortable now to work with the */
/* declared CALLs. */

/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

/* https://www.avrfreaks.net/s/topic/a5C3l000000Ua5lEAC/t152531 */

.equ PINB,  0x03  /* 0x23 */
.equ DDRB,  0x04  /* 0x24 */
.equ PORTB, 0x05  /* 0x25 */ /* 13.4.2 */

.equ PB7, 0x80 // D13
.equ PB5, 0x20 // D11


.global start
.global vmain

output_mode_gpio:
  ldi r17, (PB7)|(PB5)
  out DDRB, r17
  ldi r17, (PB7)|(PB5)
  out PORTB, r17
  ret


// tutorial:

// http://www.rjhcoding.com/avr-asm-registers.php

led_D13_ON:
  ldi r17, PB7
  in  r16, PINB
  or  r17, r16
  out PORTB, r17
  ret

led_D13_OFF:
  ldi r17, PB7
  com r17
  in  r16, PINB
  and r17, r16
  out PORTB, r17
  ret

led_D11_ON:  
  ldi r17, PB5
  in  r16, PINB
  or  r17, r16
  out PORTB, r17
  ret

led_D11_OFF:
  ldi r17, PB5
  com r17
  in  r16, PINB
  and r17, r16
  out PORTB, r17
  ret

led_D13_PB7_ON_led_D11_PB5_OFF:
  ldi r17, PB7
  out PORTB, r17
  ret

led_D13_PB7_OFF_led_D11_PB5_ON:
  ldi r17, PB5
  out PORTB, r17
  ret

selected_LEDS_off:
  ret

led_D13_PB7_ON_D11_PB5_ON:
  ldi r17, PB7|PB5
	out PORTB, r17
	ret

led_D13_PB7_OFF_D11_PB5_OFF:
  ldi r17, !PB7|!PB5
	out PORTB, r17
	ret
  
led_D13_PB7_OFF:
  ldi r17, (!PB7|!PB5)
  out PORTB, r17
  ret

led_D11_PB5_OFF:
  ldi r17, (!PB7|!PB5)
  out PORTB, r17
  ret

led_D13_PB7_ON:
  ldi r17, PB7
  out PORTB, r17
	ret

led_D11_PB5_ON:
  ldi r17, PB5
	out PORTB, r17
	ret

start:
  call output_mode_gpio
// call selected_LEDS_off
  nop
  call led_D13_ON
  nop
  call led_D13_OFF
  nop
  call led_D11_ON
  nop
  call led_D11_OFF
  nop
  call bDelay
	ret

all_leds_ON:
  call led_D13_ON
  call led_D11_ON
  ret

vmain:
  call led_D13_ON
  call bDelay
  call bDelay
  call led_D13_OFF
  call bDelay
  call bDelay

  call led_D11_ON
  call bDelay
  call bDelay
  call led_D11_OFF
  call bDelay
  call bDelay
  ret

bDelay:
  call cDelay
	call cDelay
  call cDelay
	call cDelay
	ret

cDelay:
  call dDelay
  call dDelay
  call dDelay
	call dDelay

  call dDelay
  call dDelay
  call dDelay
	call dDelay
	ret

dDelay:
  call eDelay
  call eDelay
  call eDelay
  call eDelay

  call eDelay
  call eDelay
  call eDelay
  call eDelay
  ret

eDelay:
  call uDelay
	call uDelay
  call uDelay
	call uDelay

  call uDelay
	call uDelay
  call uDelay
	call uDelay
  ret

uDelay:
  call vDelay
  call vDelay
  call vDelay
  call vDelay

  call vDelay
  call vDelay
  call vDelay
  call vDelay
	ret

vDelay:
  call wDelay
  call wDelay
  call wDelay
  call wDelay

  call wDelay
  call wDelay
  call wDelay
  call wDelay
	ret

wDelay:
  call xDelay
	call xDelay
  call xDelay
	call xDelay

  call xDelay
	call xDelay
  call xDelay
	call xDelay
	ret

xDelay:

  nop
  nop
  nop
  nop

  nop
  nop
  nop
  nop

	ret

/* end */
