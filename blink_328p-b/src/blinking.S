/* Tue 16 Jan 19:45:11 UTC 2024 */

/* wa1tnr 16 Jan 2024 12:34z */

/* Tue 16 Jan 12:34:05 UTC 2024 */
/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

/* not much taken from it, just 0x04 vs 0x24 for DDRB &c */

.equ DDRB,  0x04 /* 0x24 */
.equ PORTB, 0x05 /* 0x25 */ /* 13.4.2 */

.equ DDRD,  0x0A /* 0x2A */ /* 13.4.9 */
.equ PORTD, 0x0b /* 0x2b */ /* 13.4.8 */


.equ PB5, 0x20 // D13
.equ PB4, 0x10 // D12
.equ PB3, 0x08 // D11
.equ PB2, 0x04 // D10
.equ PB1, 0x02 //  D9
.equ PB0, 0x01 //  D8

.equ PD7, 0x80
.equ PD6, 0x40
.equ PD5, 0x20
.equ PD4, 0x10
.equ PD3, 0x08
.equ PD2, 0x04
.equ PD1, 0x02
.equ PD0, 0x01

.global start
.global vmain

_delay_ms:
  ; Delay about (r25:r24)*ms. Clobbers r30, and r31.
  ; One millisecond is about 16000 cycles at 16MHz.
  ; The inner loop takes 4 cycles, so we repeat it 3000 times
  ldi   r31, hi8(400)
  ldi   r30, lo8(400)
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
  ldi  r17, 0x0 | PD7 | PD6 | PD5 | PD4 | PD3 | PD2 | PD1 | PD0
	out  DDRD, r17
	ret

xall_leds_OFF:
  ldi  r17, 0x00
	out  PORTD, r17
	ret

led_13_ON:
  ldi  r17, PD5
	out  PORTD, r17
	ret

led_13_OFF:
  ldi r17, ! (0xff ^ PD5)
  out  PORTD, r17
	ret

pd0_ON:
  ldi  r17, PD0
	out  PORTD, r17
	ret

pd0_OFF:
  ldi r17, ! (0xff ^ PD0)
  out  PORTD, r17
	ret

pd1_ON:
  ldi  r17, PD1
	out  PORTD, r17
	ret

pd1_OFF:
  ldi r17, ! (0xff ^ PD1)
  out  PORTD, r17
	ret

pd2_ON:
  ldi  r17, PD2
	out  PORTD, r17
	ret

pd2_OFF:
  ldi r17, ! (0xff ^ PD2)
  out  PORTD, r17
	ret

pd3_ON:
  ldi  r17, PD3
	out  PORTD, r17
	ret

pd3_OFF:
  ldi r17, ! (0xff ^ PD3)
  out  PORTD, r17
	ret

pd4_ON:
  ldi  r17, PD4
	out  PORTD, r17
	ret

pd4_OFF:
  ldi r17, ! (0xff ^ PD4)
  out  PORTD, r17
	ret

pd5_ON:
  ldi  r17, PD5
	out  PORTD, r17
	ret

pd5_OFF:
  ldi r17, ! (0xff ^ PD5)
  out  PORTD, r17
	ret

pd6_ON:
  ldi  r17, PD6
	out  PORTD, r17
	ret

pd6_OFF:
  ldi r17, ! (0xff ^ PD6)
  out  PORTD, r17
	ret

pd7_ON:
  ldi  r17, PD7
	out  PORTD, r17
	ret

pd7_OFF:
  ldi r17, ! (0xff ^ PD7)
  out  PORTD, r17
	ret


led_D12_PB4_ON:
  ldi  r17, PD4
	out  PORTD, r17
	ret

led_D12_PB4_OFF:
  ldi  r17, ! (0xff ^ PD4)
  out  PORTD, r17
  ret

led_11_ON:
  ldi  r17, PD3
  out  PORTD, r17
  ret

led_11_OFF:
  ldi  r17, ! (0xff ^ PD3)
	out  PORTD, r17
  ret

led_10_ON:
  ldi  r17, PD2
	out  PORTD, r17
  ret

led_10_OFF:
  ldi  r17, ! (0xff ^ PD2)
	out  PORTD, r17
  ret

led_09_ON:
  ldi  r17, PD1
	out  PORTD, r17
  ret

led_09_OFF:
  ldi  r17, ! (0xff ^ PD1)
	out  PORTD, r17
  ret

led_08_ON:
  ldi  r17, PD0
	out  PORTD, r17
  ret

led_08_OFF:
  ldi  r17, ! (0xff ^ PD0)
	out  PORTD, r17
  ret

start:
  call output_mode_select_gpio
  call delay_ms
  ret

blvmain:
  call  pd0_ON
  call  delay_ms
  call  pd0_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms

  call  pd0_ON
  call  delay_ms
  call  pd0_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms

  call  pd0_ON
  call  delay_ms
  call  pd0_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms




  call  pd1_ON
  call  delay_ms
  call  pd1_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd2_ON
  call  delay_ms
  call  pd2_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd3_ON
  call  delay_ms
  call  pd3_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd4_ON
  call  delay_ms
  call  pd4_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd5_ON
  call  delay_ms
  call  pd5_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd6_ON
  call  delay_ms
  call  pd6_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms


  call  pd7_ON
  call  delay_ms
  call  pd7_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms

  call  pd7_ON
  call  delay_ms
  call  pd7_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms

  call  pd7_ON
  call  delay_ms
  call  pd7_OFF
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  call  delay_ms
  ret

_delay_pms:
  ldi   r31, hi8(5000)
  ldi   r30, lo8(5000)
1:
  sbiw    r30, 1
  brne    1b
  sbiw    r24, 1
  brne    _delay_pms
  ret

delay_pms:
  ldi   r25, hi8(2900)
  ldi   r24, lo8(5900)
  call _delay_pms
  ret

guadar:
  ldi  r24, 0x03
1:
  push r24
  call  blvmain
  call  delay_pms
  pop r24
  sbiw  r24, 1
  brne  1b
  ret

# call   delay_pms

vmain:
  call  guadar
  ret
/* end */