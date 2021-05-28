#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

set(INCLUDE__ARDUINOCORE_API TRUE)

set_cache_default(ARDUINOCORE_API__BASE_DIR "${PROJECT_LIBRARY_DIR}/arduinocore_api" STRING "arduinocore_api project base dir")

include_directories(${ARDUINOCORE_API__BASE_DIR})
include_directories(${ARDUINOCORE_API__BASE_DIR}/api)

