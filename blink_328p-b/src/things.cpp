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

void setup_serial(void) {
  Serial.begin(9600);
}

void slower(void) {
  for (volatile long count = 123; count > 1; count--) {
    ; // no operation
  }
}
void end_serial(void) {
  Serial.end();
}

void setup(void) {
  setup_serial();
  Serial.print(" IN setup();\n");
  Serial.print("  start();  ");
  start();
  delay(1000);
  Serial.print("  vmain();  ");
}

void loop(void) {
  end_serial();
  slower();
  vmain();
  slower();
  setup_serial();
  Serial.write('.');
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -                               - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -     crufty von cruftheimer    - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - -                               - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// void slower(void) {
// count = 1233445;

// end.
