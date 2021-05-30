/*
 * Copyright (c) 2020 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

#include "_variant.h"

arduino_d_pin_t const _g_d_pin_map[NUM_DIGITAL_PINS] =
{
    {GPIOG, GPIO_PIN_9 , 0, 0            , 0   , 0            }, // D0
    {GPIOG, GPIO_PIN_14, 0, 0            , 0   , 0            }, // D1
    {GPIOF, GPIO_PIN_15, 0, 0            , 0   , 0            }, // D2
    {GPIOE, GPIO_PIN_13, 0, 0            , 0   , 0            }, // D3
    {GPIOF, GPIO_PIN_14, 0, 0            , 0   , 0            }, // D4
    {GPIOE, GPIO_PIN_11, 0, 0            , 0   , 0            }, // D5
    {GPIOE, GPIO_PIN_9 , 0, 0            , 0   , 0            }, // D6
    {GPIOF, GPIO_PIN_13, 0, 0            , 0   , 0            }, // D7
    {GPIOF, GPIO_PIN_12, 0, 0            , 0   , 0            }, // D8
    {GPIOD, GPIO_PIN_15, 1, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_4}, // D9
    {GPIOD, GPIO_PIN_14, 1, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_3}, // D10
    {GPIOA, GPIO_PIN_7 , 1, GPIO_AF2_TIM3, TIM3, TIM_CHANNEL_2}, // D11
    {GPIOA, GPIO_PIN_6 , 1, GPIO_AF2_TIM3, TIM3, TIM_CHANNEL_1}, // D12
    {GPIOA, GPIO_PIN_5 , 0, 0            , 0   , 0            }, // D13
    {GPIOB, GPIO_PIN_9 , 0, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_4}, // D14
    {GPIOB, GPIO_PIN_8 , 0, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_3}, // D15
};

arduino_a_pin_t const _g_a_pin_map[NUM_ANALOG_INPUTS] =
{
    {GPIOA, GPIO_PIN_3 , ADC3, ADC_CHANNEL_3 }, // A0
    {GPIOC, GPIO_PIN_0 , ADC3, ADC_CHANNEL_10}, // A1
    {GPIOC, GPIO_PIN_3 , ADC3, ADC_CHANNEL_13}, // A2
    {GPIOF, GPIO_PIN_3 , ADC3, ADC_CHANNEL_9 }, // A3
    {GPIOF, GPIO_PIN_5 , ADC3, ADC_CHANNEL_15}, // A4
    {GPIOF, GPIO_PIN_10, ADC3, ADC_CHANNEL_8 }, // A5
};

void initVariant(void)
{
    // Digital IO
    init_wiring_digital();

    // Analog IO
    init_wiring_analog();
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

