#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

if(INCLUDE__ARDUINOCORE_API)

    get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/arduinocore_ubinos" ABSOLUTE)
    get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)

    get_filename_component(_tmp_asensor_dir "${ARDUINOCORE_API__ADAFRUIT_SENSOR_DIR}" ABSOLUTE)
    get_filename_component(_tmp_abme280_dir "${ARDUINOCORE_API__ADAFRUIT_BME280_LIBRARY_DIR}" ABSOLUTE)
    get_filename_component(_tmp_tflite_dir "${ARDUINOCORE_API__TENSORFLOWLITE_DIR}" ABSOLUTE)

    file(GLOB_RECURSE _tmp_sources
        "${_tmp_source_dir}/*.c"
        "${_tmp_source_dir}/*.cpp"
        "${_tmp_source_dir}/*.S"
        "${_tmp_source_dir}/*.s")
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_sources})

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Common.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Stream.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Print.cpp)

    if(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR)
        include_directories(${_tmp_asensor_dir})
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_asensor_dir}/Adafruit_Sensor.cpp)
    endif(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR)

    if(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY)
        include_directories(${_tmp_abme280_dir})
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_abme280_dir}/Adafruit_BME280.cpp)
    endif(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY)

    if(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE)
    endif(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE)

endif(INCLUDE__ARDUINOCORE_API)

