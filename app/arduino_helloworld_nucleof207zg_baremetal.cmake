#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

# {ubinos_config_type: [buildable, cmake, app]}

set_cache(PROJECT_TOOLCHAIN_C_STD "GNU11" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_STD "GNU++14" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_W_NO_CXX14_COMPAT FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nucleof207zg_baremetal.cmake)
include(${PROJECT_LIBRARY_DIR}/stm32cubef2_wrapper/config/stm32cubef2.cmake)
include(${PROJECT_LIBRARY_DIR}/stm32cubef2_extension/config/stm32cubef2_extension.cmake)
include(${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/config/arduinocore_api.cmake)
include(${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/app/arduino_helloworld.cmake)

####

get_filename_component(_tmp_source_dir "${PROJECT_LIBRARY_DIR}/arduinocore_api_wrapper/source/arduinocore_ubinos/arch/arm/cortexm/nucleof207zg" ABSOLUTE)

include_directories(${_tmp_source_dir}/Inc)

