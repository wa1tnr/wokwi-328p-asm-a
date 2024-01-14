/* wa1tnr - Sun 14 Jan 18:54:48 UTC 2024 */

#include <Arduino.h>

#ifdef __cplusplus
extern "C" {
#endif
void start();
void vmain();
#ifdef __cplusplus
}
#endif

void setup_serial(void) {
    Serial.begin(115200);
}

void setup(void) {
    setup_serial();
    Serial.print(" IN setup();\n");
    Serial.print("  start();  ");
    start();
    delay(700);
    Serial.print("  vmain();  ");
}

void loop(void) {
    Serial.write('.');
    vmain();
}

// end.
