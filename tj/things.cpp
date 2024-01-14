/* wa1tnr - Sun 14 Jan 08:44:07 UTC 2024 */

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
  Serial.begin(9600);
}

void setup(void) {
  pinMode(12, OUTPUT); // cheating! no asm
  setup_serial();
  Serial.print(" IN setup();\n");
  Serial.print("  start();  ");
  start();
  delay(1000);
  Serial.print("  vmain();  ");
}

void loop(void) {
  Serial.write('.');
  vmain();
}

// end.
