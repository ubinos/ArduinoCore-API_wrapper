////////


#cmakedefine01 INCLUDE__ARDUINOCORE_API

#if (INCLUDE__ARDUINOCORE_API == 1)

#cmakedefine01 ARDUINOCORE_API__USE_WIRE

#cmakedefine01 ARDUINOCORE_API__USE_SPI

#cmakedefine01 ARDUINOCORE_API__USE_SERVO

#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

