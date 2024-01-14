/* wa1tnr 04 Aug 2023 12:06z */
/* Fri  4 Aug 15:02:12 UTC 2023 */

/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

/* not much taken from it, just 0x04 vs 0x24 for DDRB &c */

.equ DDRB,  0x04 /* 0x24 */
.equ PORTB, 0x05 /* 0x25 */ /* 13.4.2 */

.equ PB5, 0x20 // D13
.equ PB4, 0x10 // D12
.equ PB3, 0x08 // D11
.equ PB2, 0x04 // D10
.equ PB1, 0x02 //  D9
.equ PB0, 0x01 //  D8

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
  ldi  r17, 0x0 | PB5 | PB4 | PB3 | PB2 | PB1 | PB0
	out  DDRB, r17
	ret

xall_leds_OFF:
  ldi  r17, 0x00
	out  PORTB, r17
	ret

led_13_ON:
  ldi  r17, PB5
	out  PORTB, r17
	ret

led_13_OFF:
  ldi r17, ! (0xff ^ PB5)
  out  PORTB, r17
	ret

led_D12_PB4_ON:
  ldi  r17, PB4
	out  PORTB, r17
	ret

led_D12_PB4_OFF:
  ldi  r17, ! (0xff ^ PB4)
  out  PORTB, r17
  ret

led_11_ON:
  ldi  r17, PB3
  out  PORTB, r17
  ret

led_11_OFF:
  ldi  r17, ! (0xff ^ PB3)
	out  PORTB, r17
  ret

led_10_ON:
  ldi  r17, PB2
	out  PORTB, r17
  ret

led_10_OFF:
  ldi  r17, ! (0xff ^ PB2)
	out  PORTB, r17
  ret

led_09_ON:
  ldi  r17, PB1
	out  PORTB, r17
  ret

led_09_OFF:
  ldi  r17, ! (0xff ^ PB1)
	out  PORTB, r17
  ret

led_08_ON:
  ldi  r17, PB0
	out  PORTB, r17
  ret

led_08_OFF:
  ldi  r17, ! (0xff ^ PB0)
	out  PORTB, r17
  ret

start:
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