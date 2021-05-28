#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set_cache(PROJECT_TOOLCHAIN_C_STD "GNU11" STRING)

set_cache(PROJECT_TOOLCHAIN_CXX_STD "GNU++14" STRING)
set_cache(PROJECT_TOOLCHAIN_CXX_W_NO_CXX14_COMPAT FALSE BOOL)

include(${PROJECT_UBINOS_DIR}/config/ubinos_nucleof207zg_baremetal.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/arduinocore_api.cmake)

