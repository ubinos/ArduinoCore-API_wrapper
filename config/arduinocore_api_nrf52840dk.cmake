#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, lib]}

set_cache(PROJECT_TOOLCHAIN_C_STD "GNU11" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_STD "GNU++14" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_W_NO_CXX14_COMPAT FALSE BOOL)

set_cache(UBINOS__UBIK__TICK_TYPE "RTC" STRING)
set_cache(UBINOS__UBIK__TICK_PER_SEC 1024 STRING)

set_cache(NRF5SDK__BSP_DEFINES_ONLY TRUE BOOL)
set_cache(NRF5SDK__NRFX_POWER_ENABLED FALSE BOOL)

set_cache(UBINOS__BSP__DTTY_TYPE "EXTERNAL" STRING)
set_cache(NRF5SDK__DTTY_NRF_UART_ENABLE TRUE BOOL)
set_cache(NRF5SDK__UART_ENABLED TRUE BOOL)
set_cache(NRF5SDK__NRFX_UARTE0_ENABLED TRUE BOOL)

set_cache(NRF5SDK__TWI_ENABLED TRUE BOOL)

####

include(${PROJECT_UBINOS_DIR}/config/ubinos_nrf52840dk.cmake)
include(${PROJECT_LIBRARY_DIR}/seggerrtt_wrapper/config/seggerrtt.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_wrapper/config/nrf5sdk.cmake)
include(${PROJECT_LIBRARY_DIR}/nrf5sdk_extension/config/nrf5sdk_extension.cmake)
include(${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/config/arduinocore_api.cmake)

string(TOLOWER ${UBINOS__BSP__BOARD_MODEL} _tmp_board_model)
get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/source/arduinocore_ubinos/arch/arm/cortexm/${_tmp_board_model}" ABSOLUTE)
include_directories(${_tmp_source_dir})
include_directories(${_tmp_source_dir}/blank/config)

