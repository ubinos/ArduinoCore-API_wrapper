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

typedef struct _arduino_a_pin_t
{
    GPIO_TypeDef * port;
    uint32_t no;
    ADC_TypeDef * instance;
    uint32_t channel;
} arduino_a_pin_t;

static arduino_a_pin_t const _a_pin_map[NUM_ANALOG_INPUTS] =
{
    {GPIOA, GPIO_PIN_3 , ADC3, ADC_CHANNEL_3 },
    {GPIOC, GPIO_PIN_0 , ADC3, ADC_CHANNEL_10},
    {GPIOC, GPIO_PIN_3 , ADC3, ADC_CHANNEL_13},
    {GPIOF, GPIO_PIN_3 , ADC3, ADC_CHANNEL_9 },
    {GPIOF, GPIO_PIN_5 , ADC3, ADC_CHANNEL_15},
    {GPIOF, GPIO_PIN_10, ADC3, ADC_CHANNEL_8 },
};

int init_wiring_analog(void)
{
    GPIO_TypeDef * GPIO_Port;
	GPIO_InitTypeDef GPIO_InitStruct;

	__HAL_RCC_ADC3_CLK_ENABLE();
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOF_CLK_ENABLE();

    for (int i = 0; i < NUM_ANALOG_INPUTS; i++)
    {
        GPIO_Port = _a_pin_map[i].port;
        GPIO_InitStruct.Pin = _a_pin_map[i].no;
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
    uint16_t uhADCxConvertedValue = 0;

    do
    {
        if (pinNumber >= NUM_ANALOG_INPUTS)
        {
            logme("pinNumber is out of range\r\n");
            break;
        }

        AdcHandle.Instance = _a_pin_map[pinNumber].instance;
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

        if (HAL_ADC_Init(&AdcHandle) != HAL_OK) {
            logme("fail at HAL_ADC_Init");
        }

        sConfig.Channel = _a_pin_map[pinNumber].channel;
        sConfig.Rank = 1;
        sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
        sConfig.Offset = 0;

        if (HAL_ADC_ConfigChannel(&AdcHandle, &sConfig) != HAL_OK) {
            logme("fail at HAL_ADC_ConfigChannel");
        }

        if (HAL_ADC_Start(&AdcHandle) != HAL_OK) {
            logme("fail at HAL_ADC_Start\r\n");
            break;
        }

        HAL_ADC_PollForConversion(&AdcHandle, 10);

        if ((HAL_ADC_GetState(&AdcHandle) & HAL_ADC_STATE_EOC_REG) != HAL_ADC_STATE_EOC_REG) {
            logme("fail at HAL_ADC_GetState\r\n");
            break;
        }

        uhADCxConvertedValue = HAL_ADC_GetValue(&AdcHandle);

        break;
    } while(1);

    return (int) uhADCxConvertedValue;
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

