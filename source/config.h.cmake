////////


#cmakedefine01 INCLUDE__ARDUINOCORE_API

#if (INCLUDE__ARDUINOCORE_API == 1)

#cmakedefine01 ARDUINOCORE_API__USE_WIRE

#cmakedefine01 ARDUINOCORE_API__INCLUDE_ADAFRUIT_BUSIO

#cmakedefine01 ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR

#cmakedefine01 ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY

#cmakedefine01 ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE

#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

