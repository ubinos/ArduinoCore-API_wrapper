/*
 * Copyright (c) 2020 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__STM3221GEVAL)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

#include "_variant.h"

arduino_d_pin_t const _g_d_pin_map[NUM_DIGITAL_PINS] =
{
    {GPIOG, GPIO_PIN_6 , 0, 0            , 0   , 0            , 0            }, // D8
};

arduino_a_pin_t const _g_a_pin_map[NUM_ANALOG_INPUTS] =
{
};

void initVariant(void)
{
    // Init Digital IO
    init_wiring_digital();

    // Init Analog IO
    init_wiring_analog();
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__STM3221GEVAL) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

