/*
 * Copyright (c) 2020 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__STM32_STM32XXXX == 1)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

#include "_variant.h"

int init_wiring_analog(void)
{
    GPIO_TypeDef * GPIO_Port;
	GPIO_InitTypeDef GPIO_InitStruct;
    arduino_a_pin_t const * a_pin;

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

    return 0;
}

int analogRead(pin_size_t pinNumber)
{
    ADC_HandleTypeDef AdcHandle;
    ADC_ChannelConfTypeDef sConfig;
    arduino_a_pin_t const * a_pin;
    uint16_t uhADCxConvertedValue = 0;

    do
    {
        if (pinNumber >= NUM_ANALOG_INPUTS)
        {
            logme("pinNumber is out of range");
            break;
        }
        a_pin = &_g_a_pin_map[pinNumber];

        AdcHandle.Instance = a_pin->adc_instance;
        AdcHandle.Init.ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV2;
        AdcHandle.Init.Resolution = ADC_RESOLUTION_10B;
        AdcHandle.Init.ScanConvMode = DISABLE;
        AdcHandle.Init.ContinuousConvMode = DISABLE;
        AdcHandle.Init.DiscontinuousConvMode = DISABLE;
        AdcHandle.Init.NbrOfDiscConversion = 0;
        AdcHandle.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
        AdcHandle.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T1_CC1;
        AdcHandle.Init.DataAlign = ADC_DATAALIGN_RIGHT;
        AdcHandle.Init.NbrOfConversion = 1;
        AdcHandle.Init.DMAContinuousRequests = DISABLE;
        AdcHandle.Init.EOCSelection = DISABLE;

        if (HAL_ADC_Init(&AdcHandle) != HAL_OK)
        {
            logme("fail at HAL_ADC_Init");
        }

        sConfig.Channel = a_pin->adc_channel;
        sConfig.Rank = 1;
        sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
        sConfig.Offset = 0;

        if (HAL_ADC_ConfigChannel(&AdcHandle, &sConfig) != HAL_OK)
        {
            logme("fail at HAL_ADC_ConfigChannel");
        }

        if (HAL_ADC_Start(&AdcHandle) != HAL_OK)
        {
            logme("fail at HAL_ADC_Start");
            break;
        }

        HAL_ADC_PollForConversion(&AdcHandle, 10);

        if ((HAL_ADC_GetState(&AdcHandle) & HAL_ADC_STATE_EOC_REG) != HAL_ADC_STATE_EOC_REG)
        {
            logme("fail at HAL_ADC_GetState");
            break;
        }

        uhADCxConvertedValue = HAL_ADC_GetValue(&AdcHandle);

        break;
    } while(1);

    return (int) uhADCxConvertedValue;
}

#endif /* (UBINOS__BSP__STM32_STM32XXXX == 1) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

