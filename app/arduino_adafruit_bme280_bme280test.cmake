#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__APP TRUE)
set(APP__NAME "arduino_adafruit_bme280_bme280test")

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/arduino_adafruit_bme280_bme280test" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})
