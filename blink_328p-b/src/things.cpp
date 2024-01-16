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

void slowest(void) {
  for (volatile long count = 133445; count > 1; count--) {
    ; // no operation
  }
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

  Serial.println("  GROOVINBOTHAM CITY  TESTING and .tar.gz source Tue 16 Jan 04:54:14 UTC 2024");

  Serial.print("     IN setup();");
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
  slowest();
  slowest();
  slowest();
  slowest();
  slowest();
  slowest();
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
