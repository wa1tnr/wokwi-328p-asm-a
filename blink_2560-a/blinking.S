/* wa1tnr  Sun 14 Jan 03:41:38 UTC 2024 */

/* clumsy use of OR - but feels comfortable now to work with the */
/* declared CALLs. */

/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

.equ DDRB, 0x04  /* 0x24 */
.equ PORTB, 0x05 /* 0x25 */ /* 13.4.2 */

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
  call selected_LEDS_off
  call bDelay
	ret

vmain:
  call led_D13_PB7_ON_D11_PB5_ON
  call bDelay
  call bDelay
  call bDelay
  call bDelay

  call led_D13_PB7_OFF_led_D11_PB5_ON
  call bDelay
	call bDelay
	call bDelay

  call led_D13_PB7_ON_led_D11_PB5_OFF
  call bDelay
	call bDelay
  call bDelay
  call bDelay
  call bDelay
  call bDelay

  call led_D13_PB7_OFF_D11_PB5_OFF

  call bDelay
  call bDelay
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
