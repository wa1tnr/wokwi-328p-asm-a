/* Thu 18 Jan 15:12:50 UTC 2024   COINTREAU */
/* wa1tnr 18 Jan 2024 15:12z */

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

; I am a comment
/*
i am a comment
*/

/* ab */

/* r31, r30, r25, 24 _delay_ms */
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

_delay_8ms:
  ldi   r24, 0x08
1:
  push  r24
  call  delay_ms
  pop   r24
  sbiw  r24, 1
  brne  1b
  ret

delay_8ms:
  push  r24
  push  r25
  push  r30
  push  r31
  call  _delay_8ms
  pop   r31
  pop   r30
  pop   r25
  pop   r24
  ret

output_mode_select_gpio:
  ldi  r17, 0x0 | PD7 | PD6 | PD5 | PD4 | PD3 | PD2 | PD1 | PD0
	out  DDRD, r17
	ret

.WARNING "This is a typed warning at ralph label"

ralph: .BYTE 0x22, 0x23, 0x24, 0x25, 0x26, 0x27

.WARNING "This is a typed warning at pd0_OFFasm label"

pd0_ONb:  .BYTE 0x11, 0xe0, 0x1b, 0xb9, 0x08, 0x95
pd1_ONb:  .BYTE 0x12, 0xe0, 0x1b, 0xb9, 0x08, 0x95
pd2_ONb:  .BYTE 0x14, 0xe0, 0x1b, 0xb9, 0x08, 0x95
pd3_ONb:  .BYTE 0x18, 0xe0, 0x1b, 0xb9, 0x08, 0x95
pd4_ONb:  .BYTE 0x10, 0xe1, 0x1b, 0xb9, 0x08, 0x95
pd5_ONb:  .BYTE 0x10, 0xe2, 0x1b, 0xb9, 0x08, 0x95
pd6_ONb:  .BYTE 0x10, 0xe4, 0x1b, 0xb9, 0x08, 0x95
pd7_ONb:  .BYTE 0x10, 0xe8, 0x1b, 0xb9, 0x08, 0x95
pd0_OFFb: .BYTE 0x10, 0xe0, 0x1b, 0xb9, 0x08, 0x95

start:
  call output_mode_select_gpio
  call delay_ms
  ret

blvmain:

/* blink D0, the hard way */

  push  r24  /* previously unnecessary but now changing r24 immediately */
  push  r25
  ldi   r24, 0x3 /* PURPLE/BLACK right side - n blinks - subloop counter, D0 LED (led8) */
1:
  push  r24
  call  pd0_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_8ms

  pop   r24
  sbiw  r24, 1
  brne  1b
  pop   r25
  pop   r24

  call  pd1_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  pd2_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  pd3_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  pd4_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  pd5_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  pd6_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_ms

  call  delay_8ms

  push  r24  /* previously unnecessary but now changing r24 immediately */
  push  r25
  ldi   r24, 0x3 /* VIOLET (L) last LED to iterate */
1:
  push  r24
  call  pd7_ONb
  call  delay_ms
  call  pd0_OFFb
  call  delay_8ms

  pop   r24
  sbiw  r24, 1
  brne  1b
  pop   r25
  pop   r24

  call  delay_8ms
  call  delay_ms
  ret


/* r31 r30 r25 r24 */

_delay_pms:
  ldi   r31, hi8(5000)
  ldi   r30, lo8(5000)

1:
  sbiw    r30, 1
  brne    1b
  sbiw    r24, 1
  brne    _delay_pms
  ret


/* no push or pop in delay_pms since it is half a call as it where */

delay_pms:
  ldi   r25, hi8(2900)
  ldi   r24, lo8(5900)
1:
  call _delay_pms
  ret

guadar:
  ldi  r24, 0x3 /* loop count initializer */
1:
  push  r24 /* retain value of loop counter after it decrements */
  call  blvmain /* main program payload */
  pop   r24
  sbiw  r24, 1
  brne  1b
  ret

vmain:
  push  r24
  push  r25
  push  r30
  push  r31

  call  guadar

  pop   r31
  pop   r30
  pop   r25
  pop   r24  /* TODO  rule:  pop r24 always the last pop */
  ret


// lines 114 162 counts that are apparent early

/* end */
