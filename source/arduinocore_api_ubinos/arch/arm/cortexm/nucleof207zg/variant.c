/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
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
    {GPIOG, GPIO_PIN_9 , 0, 0            , 0   , 0            , 0            }, // D0
    {GPIOG, GPIO_PIN_14, 0, 0            , 0   , 0            , 0            }, // D1
    {GPIOF, GPIO_PIN_15, 0, 0            , 0   , 0            , 0            }, // D2
    {GPIOE, GPIO_PIN_13, 1, GPIO_AF1_TIM1, TIM1, TIM_CHANNEL_3, 120000000    }, // D3  ,SystemCoreClock    , o
    {GPIOF, GPIO_PIN_14, 0, 0            , 0   , 0            , 0            }, // D4
    {GPIOE, GPIO_PIN_11, 1, GPIO_AF1_TIM1, TIM1, TIM_CHANNEL_2, 120000000    }, // D5  ,SystemCoreClock    , o
    {GPIOE, GPIO_PIN_9 , 1, GPIO_AF1_TIM1, TIM1, TIM_CHANNEL_1, 120000000    }, // D6  ,SystemCoreClock    , o
    {GPIOF, GPIO_PIN_13, 0, 0            , 0   , 0            , 0            }, // D7
    {GPIOF, GPIO_PIN_12, 0, 0            , 0   , 0            , 0            }, // D8
    {GPIOD, GPIO_PIN_15, 1, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_4, 120000000 / 2}, // D9  ,SystemCoreClock / 2, o
    {GPIOD, GPIO_PIN_14, 1, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_3, 120000000 / 2}, // D10 ,SystemCoreClock / 2, o
    {GPIOA, GPIO_PIN_7 , 0, GPIO_AF2_TIM3, TIM3, TIM_CHANNEL_2, 120000000 / 2}, // D11 ,SystemCoreClock / 2
    {GPIOA, GPIO_PIN_6 , 0, GPIO_AF2_TIM3, TIM3, TIM_CHANNEL_1, 120000000 / 2}, // D12 ,SystemCoreClock / 2
    {GPIOA, GPIO_PIN_5 , 0, 0            , 0   , 0            , 0            }, // D13
    {GPIOB, GPIO_PIN_9 , 0, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_4, 120000000 / 2}, // D14 ,SystemCoreClock / 2
    {GPIOB, GPIO_PIN_8 , 0, GPIO_AF2_TIM4, TIM4, TIM_CHANNEL_3, 120000000 / 2}, // D15 ,SystemCoreClock / 2
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

arduino_tone_t _arduino_tone;

void initVariant(void)
{
    GPIO_TypeDef * GPIO_Port;
	GPIO_InitTypeDef GPIO_InitStruct;
    arduino_a_pin_t const * a_pin;

    ////////////////////////////////////////
    // for digital io
    __HAL_RCC_GPIOG_CLK_ENABLE();
    __HAL_RCC_GPIOF_CLK_ENABLE();
    __HAL_RCC_GPIOE_CLK_ENABLE();
    __HAL_RCC_GPIOD_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    ////////////////////////////////////////
    // for analog in
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOF_CLK_ENABLE();

	__HAL_RCC_ADC3_CLK_ENABLE();

    for (int i = 0; i < NUM_ANALOG_INPUTS; i++)
    {
        a_pin = &_g_a_pin_map[i];

        GPIO_Port = a_pin->port;
        GPIO_InitStruct.Pin = a_pin->no;
        GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(GPIO_Port, &GPIO_InitStruct);
    }

    ////////////////////////////////////////
    // for analog out (pwm)
    __HAL_RCC_TIM1_CLK_ENABLE();
    __HAL_RCC_TIM4_CLK_ENABLE();

    ////////////////////////////////////////
    // for tone
    __HAL_RCC_TIM3_CLK_ENABLE();

    _arduino_tone.timer_initiated = 0;
    _arduino_tone.pin_initiated = 0;
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */
