#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set(INCLUDE__APP TRUE)
set(APP__NAME "arduino_tensorflowlite_magic_wand3")

set_cache(PROJECT_BUILD_TYPE "Release" STRING)
set_cache(ARDUINOCORE_API__INCLUDE_LSM9DS1 TRUE BOOL)
set_cache(UBINOS__BSP__CMSIS_INCLUDE_DIR "${PROJECT_LIBRARY_DIR}/CMSIS_5/CMSIS/Core/Include" PATH)

include(${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper/config/arduinocore_api_arduinonano33ble_softdevice.cmake)
include(${PROJECT_LIBRARY_DIR}/CMSIS_5_wrapper/config/cmsis_5.cmake)
include(${PROJECT_LIBRARY_DIR}/tflite-micro_wrapper/config/tflite_micro.cmake)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)
file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

