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

static uint32_t const _d_pin_no_map[NUM_DIGITAL_PINS] =
{
  GPIO_PIN_9,  GPIO_PIN_14, GPIO_PIN_15, GPIO_PIN_13, GPIO_PIN_14, GPIO_PIN_11, GPIO_PIN_9, GPIO_PIN_13,
  GPIO_PIN_12, GPIO_PIN_15, GPIO_PIN_14, GPIO_PIN_7,  GPIO_PIN_6,  GPIO_PIN_5,  GPIO_PIN_9, GPIO_PIN_8,
};

static GPIO_TypeDef * const _d_pin_port_map[NUM_DIGITAL_PINS] =
{
  GPIOG, GPIOG, GPIOF, GPIOE, GPIOF, GPIOE, GPIOE, GPIOF,
  GPIOF, GPIOD, GPIOD, GPIOA, GPIOA, GPIOA, GPIOB, GPIOB,
};

void pinMode(pin_size_t pinNumber, PinMode pinMode)
{
    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_TypeDef *GPIO_Port;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            break;
        }

        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
        GPIO_InitStruct.Pin = _d_pin_no_map[pinNumber];
        GPIO_Port = _d_pin_port_map[pinNumber];

        switch (pinMode) {
        case INPUT:
            GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
            GPIO_InitStruct.Pull = GPIO_NOPULL;
            break;
        case OUTPUT:
            GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
            GPIO_InitStruct.Pull = GPIO_NOPULL;
            break;
        case INPUT_PULLUP:
            GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
            GPIO_InitStruct.Pull = GPIO_PULLUP;
            break;
        case INPUT_PULLDOWN:
        default:
            GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
            GPIO_InitStruct.Pull = GPIO_PULLDOWN;
            break;
        }

        HAL_GPIO_Init(GPIO_Port, &GPIO_InitStruct);

        break;
    } while(1);
}

void digitalWrite(pin_size_t pinNumber, PinStatus status)
{
    uint32_t GPIO_Pin;
    GPIO_TypeDef *GPIO_Port;
    GPIO_PinState PIN_State;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            break;
        }

        if (status == LOW)
        {
            PIN_State = GPIO_PIN_RESET;
        }
        else if (status == HIGH)
        {
            PIN_State = GPIO_PIN_SET;
        }
        else
        {
            break;
        }

        GPIO_Pin = _d_pin_no_map[pinNumber];
        GPIO_Port = _d_pin_port_map[pinNumber];

        HAL_GPIO_WritePin(GPIO_Port, GPIO_Pin, PIN_State);

        break;
    } while(1);
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

