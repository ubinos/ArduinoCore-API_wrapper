#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

cmake_minimum_required(VERSION 3.3)

###############################################################################

include("${CMAKE_CURRENT_LIST_DIR}/../../ubinos/config/common.cmake")

project(arduino_wrapper)

project_begin()
project_add_library(ubinos)
project_end()

###############################################################################

