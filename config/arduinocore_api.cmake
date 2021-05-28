#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__ARDUINOCORE_API TRUE)

set_cache_default(ARDUINOCORE_API__BASE_DIR "${PROJECT_LIBRARY_DIR}/arduinocore_api" STRING "arduinocore_api project base dir")

get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)
get_filename_component(_tmp_wrapper_dir "${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper" ABSOLUTE)

include_directories(${_tmp_api_dir})
include_directories(${_tmp_api_dir}/api)

if(UBINOS__BSP__BOARD_MODEL STREQUAL "NUCLEOF207ZG")
    include_directories(${_tmp_wrapper_dir}/include/arch/arm/cortexm/nucleof207zg)
else()
    message(FATAL_ERROR "Unsupported UBINOS__BSP__BOARD_MODEL")
endif()
