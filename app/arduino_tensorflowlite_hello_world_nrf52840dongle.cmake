#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set(INCLUDE__APP TRUE)
set(APP__NAME "arduino_tensorflowlite_hello_world")

set_cache(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE TRUE BOOL)

include(${PROJECT_LIBRARY_DIR}/ArduinoCore-API_wrapper/config/arduinocore_api_nrf52840dongle.cmake)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/${APP__NAME}" ABSOLUTE)
file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.cc"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

