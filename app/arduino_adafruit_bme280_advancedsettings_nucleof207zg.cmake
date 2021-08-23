#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set(INCLUDE__APP TRUE)
set(APP__NAME "arduino_adafruit_bme280_advancedsettings")

set_cache(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR TRUE BOOL)
set_cache(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY TRUE BOOL)

include(${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/config/arduinocore_api_nucleof207zg.cmake)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)
file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

