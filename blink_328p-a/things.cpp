/* wa1tnr 04 Aug 2023 22:25z */
/* Fri Aug  4 22:25:02 UTC 2023 */

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
  int p = 1 << PORTB5;
  Serial.print(p, HEX);

  Serial.write(' ');

  p = 1 << PB5;
  Serial.print(p, HEX);

  Serial.write(' ');
  Serial.write('D'); Serial.write(' ');
  Serial.print(DDRB, HEX);
}

int jjj = 0xa5;

void setup(void) {
  setup_serial();
  Serial.print(" IN setup();\n");
  Serial.print("  start();  ");
  
  jjj = 0x5a;

  start();
  delay(1000);
  Serial.print("  vmain();  ");
}

void loop(void) {
  vmain();
  Serial.write('.');
}

// end.
