#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(PROJECT_TOOLCHAIN_C_STD "GNU11" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_STD "GNU++14" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_W_NO_CXX14_COMPAT FALSE BOOL)

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(SEGGERRTT__DTTY_ENABLE TRUE BOOL)

# set_cache(UBINOS__BSP__DEBUG_SERVER_SERIAL "59300655" STRING) # arduino nano
# set_cache(UBINOS__BSP__DEBUG_SERVER_PORT "2341" STRING)

set_cache(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE TRUE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk.cmake)
include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)
include(${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/config/arduinocore_api.cmake)

####

set(INCLUDE__APP TRUE)
set(APP__NAME "arduino_tensorflowlite_hello_world")

get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/source/arduinocore_ubinos/arch/arm/cortexm/nrf52840dk" ABSOLUTE)

include_directories(${_tmp_source_dir})
include_directories(${_tmp_source_dir}/blank/config)

get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/arduino_tensorflowlite_hello_world" ABSOLUTE)

file(GLOB_RECURSE _tmp_sources
    "${_tmp_source_dir}/*.c"
    "${_tmp_source_dir}/*.cpp"
    "${_tmp_source_dir}/*.S"
    "${_tmp_source_dir}/*.s")
set(PROJECT_APP_SOURCES ${PROJECT_APP_SOURCES} ${_tmp_sources})

