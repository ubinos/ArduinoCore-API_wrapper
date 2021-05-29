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

typedef struct _arduino_d_pin_t
{
    GPIO_TypeDef * port;
    uint32_t no;
} arduino_d_pin_t;

static arduino_d_pin_t const _d_pin_map[NUM_DIGITAL_PINS] =
{
    {GPIOG, GPIO_PIN_9 }, {GPIOG, GPIO_PIN_14}, {GPIOF, GPIO_PIN_15}, {GPIOE, GPIO_PIN_13},
    {GPIOF, GPIO_PIN_14}, {GPIOE, GPIO_PIN_11}, {GPIOE, GPIO_PIN_9 }, {GPIOF, GPIO_PIN_13},
    {GPIOF, GPIO_PIN_12}, {GPIOD, GPIO_PIN_15}, {GPIOD, GPIO_PIN_14}, {GPIOA, GPIO_PIN_7 },
    {GPIOA, GPIO_PIN_6 }, {GPIOA, GPIO_PIN_5 }, {GPIOB, GPIO_PIN_9 }, {GPIOB, GPIO_PIN_8 },
};

int init_wiring_digital(void)
{
    __HAL_RCC_GPIOG_CLK_ENABLE();
    __HAL_RCC_GPIOF_CLK_ENABLE();
    __HAL_RCC_GPIOE_CLK_ENABLE();
    __HAL_RCC_GPIOD_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    return 0;
}

void pinMode(pin_size_t pinNumber, PinMode pinMode)
{
    GPIO_TypeDef * GPIO_Port;
    GPIO_InitTypeDef GPIO_InitStruct;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            break;
        }

        GPIO_Port = _d_pin_map[pinNumber].port;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
        GPIO_InitStruct.Pin = _d_pin_map[pinNumber].no;
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
    GPIO_TypeDef * GPIO_Port;
    GPIO_PinState PIN_State;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            logme("pinNumber is out of range\r\n");
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
            logme("status is unknown\r\n");
            break;
        }

        GPIO_Pin = _d_pin_map[pinNumber].no;
        GPIO_Port = _d_pin_map[pinNumber].port;

        HAL_GPIO_WritePin(GPIO_Port, GPIO_Pin, PIN_State);

        break;
    } while(1);
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

