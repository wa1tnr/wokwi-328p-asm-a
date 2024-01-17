/* new work Wed 17th 12:02z */
/* wa1tnr 17 Jan 2024  12:02z */

/* Wed 17 Jan 12:02:32 UTC 2024 */

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













pd0_ON:
  ldi  r17, PD0
	out  PORTD, r17
	ret

pd0_OFF:
  ldi r17, ! (0xff ^ PD0)
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
  ldi  r24, 0x03


1:
  push  r24 /* first pass: keep initial value.  second++ passes: keep decremented from previous iteration */



  push  r24 /* protect against one call only */

  call  blvmain

  pop   r24 /* restore to what it was before call to blvmain */


  push  r24 /* protect from delay_pms call */
  call  delay_pms
  pop   r24 /* restore r24 after delay_pms */


  pop   r24 /* restore r24 after anything that happened outside this function */


  /* imo  the redundant push and pop pairs to r24 */
  /*      can have nothing odd == so can be factored */
  /*      to a singleton */

  /*      failure to do so - to factor - is a mistake, */
  /*      as stack space is limited, and 'we' do not know */
  /*      just how, when and why that space is allocated. */

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
  pop   r24
  ret

/* end */
