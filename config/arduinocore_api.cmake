#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__ARDUINOCORE_API TRUE)

set_cache_default(ARDUINOCORE_API__BASE_DIR "${PROJECT_LIBRARY_DIR}/arduinocore_api" STRING "arduinocore_api project base dir")

set_cache_default(ARDUINOCORE_API__ADAFRUIT_SENSOR_DIR "${PROJECT_LIBRARY_DIR}/arduino_adafruit_sensor" STRING "arduino_adafruit_sensor project base dir")
set_cache_default(ARDUINOCORE_API__ADAFRUIT_BME280_LIBRARY_DIR "${PROJECT_LIBRARY_DIR}/arduino_adafruit_bme280_library" STRING "arduino_adafruit_bme280_library project base dir")
set_cache_default(ARDUINOCORE_API__TENSORFLOWLITE_DIR "${PROJECT_LIBRARY_DIR}/arduino_tensorflowlite" STRING "arduino_tensorflowlite project base dir")

set_cache_default(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR FALSE BOOL "Include arduino_adafruit_sensor")
set_cache_default(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY FALSE BOOL "Include arduino_adafruit_bme280_library")
set_cache_default(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE FALSE BOOL "Include arduino_tensorflowlite")

set_cache_default(ARDUINOCORE_API__VERSION "10813" STRING "Arduino version")

####

add_definitions("-DARDUINO=${ARDUINOCORE_API__VERSION}")

get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)
get_filename_component(_tmp_wrapper_dir "${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper" ABSOLUTE)

include_directories(${_tmp_api_dir})
include_directories(${_tmp_api_dir}/api)
include_directories("${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/include")
include_directories("${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/include/Wire")
include_directories("${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/include/SPI")

if(UBINOS__BSP__BOARD_MODEL STREQUAL "NUCLEOF207ZG")
    include_directories(${_tmp_wrapper_dir}/include/arch/arm/cortexm/nucleof207zg)
elseif(UBINOS__BSP__BOARD_MODEL STREQUAL "STM3221GEVAL")
    include_directories(${_tmp_wrapper_dir}/include/arch/arm/cortexm/stm3221geval)
elseif(UBINOS__BSP__BOARD_MODEL STREQUAL "NRF52840DK")
    include_directories(${_tmp_wrapper_dir}/include/arch/arm/cortexm/nrf52840dk)
else()
    message(FATAL_ERROR "Unsupported UBINOS__BSP__BOARD_MODEL")
endif()

