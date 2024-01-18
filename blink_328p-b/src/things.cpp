/* wa1tnr Thu 18 Jan 11:12:08 UTC 2024 */

/* Thu 18 Jan 11:12:08 UTC 2024 */

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
    for (volatile long j = 95; j > 0; j--) {
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
    Serial.print(  "  SILVERFOOT BROTHERS, GMBH   Thu 18 Jan 11:12:08 UTC 2024");
    Serial.println("  you tell raphael -- c.f. being there");

    Serial.println("");
    Serial.print("                                           ");
    Serial.print("dot when TX/RX LEDs OFF - equals when they are ON\r\n");
    Serial.print("\r\n  ");
    Serial.println("");
    Serial.print("     ... in setup();");
    Serial.print("  start(); ");
    start();
    delay(700);
    Serial.print("  vmain(); ");
}

void loop(void) {
    end_serial();
    slower();
    vmain();
    slower();
    setup_serial();
    Serial.write('.');
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
