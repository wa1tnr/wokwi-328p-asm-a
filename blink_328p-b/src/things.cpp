/* wa1tnr 16 Jan 01:04:48 UTC 2024 */

/* Tue 16 Jan 01:04:48 UTC 2024 */

#include <Arduino.h>

#ifdef __cplusplus
extern "C" {
#endif
void start();
void vmain();
#ifdef __cplusplus
}
#endif

void setup_serial(void) { Serial.begin(9600); }

void as_slowest(void) {
    for (volatile long i = 544; i > 0; i--) {
        for (volatile long count = 88; count > 1; count--) {
            ; // no operation
        }
    }
}
void slowest(void) { // 25, 744, 88 not terrible - six slow counts
    for (volatile long j = 35; j > 0; j--) {
        as_slowest();
    }
}

void slower(void) {
    for (volatile long count = 123; count > 1; count--) {
        ; // no operation
    }
}

void end_serial(void) { Serial.end(); }

void setup(void) {
    setup_serial();
    Serial.println("  CARTUHN CAYVERS, GMBH   Tue 16 Jan 14:41:33 UTC 2024");

/*
    Serial.println("\n\n  The time interval between dot ('.') and equals ('=') is poorly understood.  Two calls to 'slowest();' are *required* for an inexplicable reason.  Tried and tried to get it down to as single call to 'slowest()' .. could not do so.");
*/

    Serial.print("\r\n\r\n  The time interval between dot ('.') and equals ('=') is");

    Serial.print(" poorly understood.\r\n\r\n  Two calls to 'slowest()' are *required* for");
    Serial.print(" an inexplicable reason.\r\n  Tried to get it down to a");
    Serial.println(" single call to 'slowest()' .. could not do so.\r\n\r\n  Baffled.\r\n");
    Serial.print("  dot ('.') and equals ('=') are 'bookends' bracketing the timing\r\n");
    Serial.print("  under inquiry.  That's the mystery: why this time interval is\r\n");
    Serial.println("  'wrong' .. unless two subsequent calls to 'slowest()' are made.\r\n");

    Serial.print("     IN setup();");
    Serial.print("  start();  ");
    start();
    delay(700);
    Serial.print("  vmain();  ");
}

void loop(void) {
    end_serial();
    slower();
    vmain();
    slower();
    setup_serial();
    Serial.write('.');
    slowest();
    slowest();
    Serial.write('=');
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -                               - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -     crufty von cruftheimer    - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -                               - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -
// - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - -

// void slower(void) {
// count = 1233445;

// end.
