#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__ARDUINOCORE_API TRUE)
set(PROJECT_UBINOS_LIBRARIES ${PROJECT_UBINOS_LIBRARIES} ArduinoCore-API_wrapper)

set_cache_default(ARDUINOCORE_API__BASE_DIR "${PROJECT_LIBRARY_DIR}/ArduinoCore-API" STRING "ArduinoCore-API project base dir")

set_cache_default(ARDUINOCORE_API__USE_WIRE TRUE BOOL "Use Wire(I2C) API")
set_cache_default(ARDUINOCORE_API__USE_SPI TRUE BOOL "Use SPI API")

set_cache_default(ARDUINOCORE_API__TENSORFLOWLITE_DIR "${PROJECT_LIBRARY_DIR}/Arduino_TensorFlowLite" STRING "Arduino_TensorFlowLite project base dir")

set_cache_default(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE FALSE BOOL "Include Arduino_TensorFlowLite")

set_cache_default(ARDUINOCORE_API__VERSION "10813" STRING "Arduino version")

####

add_definitions("-DARDUINO=${ARDUINOCORE_API__VERSION}")
add_definitions("-DADAFRUIT_BUSIO_NOT_USE_FAST_PINIO")

get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)
get_filename_component(_tmp_wrapper_dir "${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper" ABSOLUTE)

include_directories(${_tmp_api_dir})
include_directories(${_tmp_api_dir}/api)
include_directories("${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper/include")
include_directories("${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper/include/Wire")
include_directories("${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper/include/SPI")

string(TOLOWER ${UBINOS__BSP__BOARD_MODEL} _tmp_board_model)

include_directories(${_tmp_wrapper_dir}/include/arch/arm/cortexm/${_tmp_board_model})

