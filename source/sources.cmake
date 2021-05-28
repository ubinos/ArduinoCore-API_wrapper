#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

if(INCLUDE__ARDUINOCORE_API)

    get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/arduinocore_ubinos" ABSOLUTE)
    get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_source_dir}/cores/arduino/DttySerial.cpp)

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Stream.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Print.cpp)

endif(INCLUDE__ARDUINOCORE_API)

