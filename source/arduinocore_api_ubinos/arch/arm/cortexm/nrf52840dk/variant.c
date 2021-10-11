/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NRF52840DK)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

#include "_variant.h"

arduino_d_pin_t const _g_d_pin_map[NUM_DIGITAL_PINS] =
{
    {NRF_GPIO_PIN_MAP(1,  1)}, // D0
    {NRF_GPIO_PIN_MAP(1,  2)}, // D1
    {NRF_GPIO_PIN_MAP(1,  3)}, // D2
    {NRF_GPIO_PIN_MAP(1,  4)}, // D3
    {NRF_GPIO_PIN_MAP(1,  5)}, // D4
    {NRF_GPIO_PIN_MAP(1,  6)}, // D5
    {NRF_GPIO_PIN_MAP(1,  7)}, // D6
    {NRF_GPIO_PIN_MAP(1,  8)}, // D7
    {NRF_GPIO_PIN_MAP(1, 10)}, // D8
    {NRF_GPIO_PIN_MAP(1, 11)}, // D9
    {NRF_GPIO_PIN_MAP(1, 12)}, // D10
    {NRF_GPIO_PIN_MAP(1, 13)}, // D11
    {NRF_GPIO_PIN_MAP(1, 14)}, // D12
    {NRF_GPIO_PIN_MAP(1, 15)}, // D13
};

void initVariant(void)
{
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NRF52840DK) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

