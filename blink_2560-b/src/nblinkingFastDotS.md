/* wa1tnr  Sun 14 Jan 18:54:48 UTC 2024 */

/* blinking.S - modified for fast LED blinking */

/* all eight port pins of PORTB (PB0 thru PB7) now in use! */

/* clumsy use of OR - but feels comfortable now to work with the */
/* declared CALLs. */

/* https://arduino.stackexchange.com/questions/23146/make-led-blink-using-avr-assembly */

/* https://www.avrfreaks.net/s/topic/a5C3l000000Ua5lEAC/t152531 */

.equ PINB,  0x03  /* 0x23 */
.equ DDRB,  0x04  /* 0x24 */
.equ PORTB, 0x05  /* 0x25 */ /* 13.4.2 */

/* four contiguous port pins D13..D10: */
.equ PB7, 0x80 // D13
.equ PB6, 0x40 // D12
.equ PB5, 0x20 // D11
.equ PB4, 0x10 // D10

/* four contiguous port pins D50..D53: */
.equ PB3, 0x08 // D50
.equ PB2, 0x04 // D51
.equ PB1, 0x02 // D52
.equ PB0, 0x01 // D53

.global start
.global vmain

output_mode_gpio:
/*
    ldi r17, (PB7)|(PB6)|(PB5)|(PB4)|(PB3)|(PB2)|(PB1)|(PB0)
*/
    ldi r17, 0xFF
    out DDRB, r17
    ret

/* supplemental to above: */
/* 0x80 | 0x40 | 0x20 | 0x10 | 0x08 | 0x04 | 0x02 | 0x01 */
/* 0xFF */

/*  setb - set them HIGH: */
/*  ldi r17, (PB7)|(PB6)|(PB5)|(PB4)|(PB3)|(PB2)|(PB1)|(PB0) */

/*
    UNUSED - was for setting the the port pins HIGH initially - not wanted:

    ldi r17, 0xFF
    out PORTB, r17
    ret
*/

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

led_D12_ON:
    ldi r17, PB6
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D12_OFF:
    ldi r17, PB6
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

led_D10_ON:
    ldi r17, PB4
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D10_OFF:
    ldi r17, PB4
    com r17
    in  r16, PINB
    and r17, r16
    out PORTB, r17
    ret

led_D50_ON:
    ldi r17, PB3
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D50_OFF:
    ldi r17, PB3
    com r17
    in  r16, PINB
    and r17, r16
    out PORTB, r17
    ret

led_D51_ON:
    ldi r17, PB2
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D51_OFF:
    ldi r17, PB2
    com r17
    in  r16, PINB
    and r17, r16
    out PORTB, r17
    ret

led_D52_ON:
    ldi r17, PB1
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D52_OFF:
    ldi r17, PB1
    com r17
    in  r16, PINB
    and r17, r16
    out PORTB, r17
    ret

led_D53_ON:
    ldi r17, PB0
    in  r16, PINB
    or  r17, r16
    out PORTB, r17
    ret

led_D53_OFF:
    ldi r17, PB0
    com r17
    in  r16, PINB
    and r17, r16
    out PORTB, r17
    ret

start:
    call output_mode_gpio
    call bDelay
    call bDelay
    call bDelay
    call bDelay
    call bDelay

    ret

vmain:
    call led_D13_ON
    call bDelay
    call bDelay
    call led_D13_OFF
    call bDelay
    call bDelay

    call led_D12_ON
    call bDelay
    call bDelay
    call led_D12_OFF
    call bDelay
    call bDelay

    call led_D11_ON
    call bDelay
    call bDelay
    call led_D11_OFF
    call bDelay
    call bDelay

    call led_D10_ON
    call bDelay
    call bDelay
    call led_D10_OFF
    call bDelay
    call bDelay

    call led_D50_ON
    call bDelay
    call bDelay
    call led_D50_OFF
    call bDelay
    call bDelay

    call led_D51_ON
    call bDelay
    call bDelay
    call led_D51_OFF
    call bDelay
    call bDelay

    call led_D52_ON
    call bDelay
    call bDelay
    call led_D52_OFF
    call bDelay
    call bDelay

    call led_D53_ON
    call bDelay
    call bDelay
    call led_D53_OFF
    call bDelay
    call bDelay
    call bDelay
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
/*
    call wDelay
    call wDelay
    call wDelay

    call wDelay
    call wDelay
    call wDelay
    call wDelay */
    ret

wDelay:
    call xDelay
    /*
    call xDelay
    call xDelay
    call xDelay

    call xDelay
    call xDelay
    call xDelay
    call xDelay */
    ret

xDelay:
    nop
    /*
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    */
    ret

/* end */
