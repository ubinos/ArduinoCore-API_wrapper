/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
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
    {GPIOG, GPIO_PIN_8 , 0, 0            , 0   , 0            , 0            }, // D9
};

arduino_a_pin_t const _g_a_pin_map[NUM_ANALOG_INPUTS] =
{
};

arduino_tone_t _arduino_tone;

void initVariant(void)
{
    // for digital io
    __HAL_RCC_GPIOG_CLK_ENABLE();

    // for analog in

    // for analog out (pwm)

    // for tone
    __HAL_RCC_TIM3_CLK_ENABLE();

    _arduino_tone.timer_initiated = 0;
    _arduino_tone.pin_initiated = 0;
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__STM3221GEVAL) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

