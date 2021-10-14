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
project_add_library(CMSIS_5_wrapper)
project_add_library(seggerrtt_wrapper)
project_add_library(stm32cubef2_wrapper)
project_add_library(stm32cubef2_extension)
project_add_library(nrf5sdk_wrapper)
project_add_library(nrf5sdk_extension)
project_add_library(tflite-micro_wrapper)
project_add_library(Adafruit_BusIO_wrapper)
project_add_library(Adafruit_Sensor_wrapper)
project_add_library(Adafruit_BME280_Library_wrapper)
project_add_library(Arduino_LSM9DS1_wrapper)
project_end()

###############################################################################

