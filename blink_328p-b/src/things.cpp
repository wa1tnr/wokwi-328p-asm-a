/* wa1tnr 04 Aug 2023 06:15z */
/*i Fri  4 Aug 12:06:52 UTC 2023 */

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
  for (volatile long count = 1233445; count > 1; count--) {
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

// end.
