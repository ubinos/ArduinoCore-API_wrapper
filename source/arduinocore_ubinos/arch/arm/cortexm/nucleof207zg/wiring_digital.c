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

int init_wiring_digital(void)
{
    __HAL_RCC_GPIOG_CLK_ENABLE();
    __HAL_RCC_GPIOF_CLK_ENABLE();
    __HAL_RCC_GPIOE_CLK_ENABLE();
    __HAL_RCC_GPIOD_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    __HAL_RCC_TIM3_CLK_ENABLE();
    __HAL_RCC_TIM4_CLK_ENABLE();

    return 0;
}

void pinMode(pin_size_t pinNumber, PinMode pinMode)
{
    GPIO_TypeDef * GPIO_Port;
    GPIO_InitTypeDef GPIO_InitStruct;
    arduino_d_pin_t const * d_pin;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            break;
        }
        d_pin = &_g_d_pin_map[pinNumber];

        GPIO_Port = d_pin->port;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
        GPIO_InitStruct.Pin = d_pin->no;
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
    arduino_d_pin_t const * d_pin;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            logme("pinNumber is out of range\r\n");
            break;
        }
        d_pin = &_g_d_pin_map[pinNumber];

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

        GPIO_Pin = d_pin->no;
        GPIO_Port = d_pin->port;

        HAL_GPIO_WritePin(GPIO_Port, GPIO_Pin, PIN_State);

        break;
    } while(1);
}

PinStatus digitalRead(pin_size_t pinNumber)
{
    uint32_t GPIO_Pin;
    GPIO_TypeDef * GPIO_Port;
    GPIO_PinState PIN_State;
    PinStatus status = LOW;
    arduino_d_pin_t const * d_pin;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            logme("pinNumber is out of range\r\n");
            break;
        }
        d_pin = &_g_d_pin_map[pinNumber];

        GPIO_Pin = d_pin->no;
        GPIO_Port = d_pin->port;

        PIN_State = HAL_GPIO_ReadPin(GPIO_Port, GPIO_Pin);
        if (PIN_State == GPIO_PIN_RESET)
        {
            status = LOW;
        }
        else if (PIN_State == GPIO_PIN_SET)
        {
            status = HIGH;
        }
        else
        {
            logme("PIN_State is unknown\r\n");
            break;
        }

        break;
    } while(1);

    return status;
}

void analogWrite(pin_size_t pinNumber, int value)
{
    GPIO_TypeDef * GPIO_Port;
    GPIO_InitTypeDef GPIO_InitStruct;
    TIM_HandleTypeDef TimHandle;
    TIM_OC_InitTypeDef sConfig;
    uint32_t channel;
    arduino_d_pin_t const * d_pin;
    uint32_t uhPrescalerValue;

    do
    {
        if (pinNumber >= NUM_DIGITAL_PINS)
        {
            logme("pinNumber is out of range\r\n");
            break;
        }
        d_pin = &_g_d_pin_map[pinNumber];

        if (!d_pin->support_pwm)
        {
            logme("not support pwm\r\n");
            break;
        }
        if (d_pin->tim_instance != TIM3 && d_pin->tim_instance != TIM4)
        {
            logme("not support TIM\r\n");
            break;
        }
        /* Compute the prescaler value to have TIM3, TIM4 counter clock equal to 30 MHz */
        uhPrescalerValue = (uint32_t) ((SystemCoreClock / 2) / (PWM_FREQUENCY * PWM_MAX_DUTY_CYCLE)) - 1;

        GPIO_Port = d_pin->port;
        GPIO_InitStruct.Pin = d_pin->no;
        GPIO_InitStruct.Alternate = d_pin->alternate;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Pull = GPIO_PULLUP;
        GPIO_InitStruct.Speed = GPIO_SPEED_HIGH;

        HAL_GPIO_Init(GPIO_Port, &GPIO_InitStruct);

        TimHandle.Instance = d_pin->tim_instance;
        TimHandle.Init.Prescaler = uhPrescalerValue;
        TimHandle.Init.Period = PWM_MAX_DUTY_CYCLE - 1;
        TimHandle.Init.ClockDivision = 0;
        TimHandle.Init.CounterMode = TIM_COUNTERMODE_UP;
        TimHandle.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
        if(HAL_TIM_PWM_Init(&TimHandle) != HAL_OK)
        {
            logme("fail at HAL_TIM_PWM_Init");
            break;
        }

        sConfig.OCMode = TIM_OCMODE_PWM1;
        sConfig.OCPolarity = TIM_OCPOLARITY_HIGH;
        sConfig.OCFastMode = TIM_OCFAST_DISABLE;
        sConfig.Pulse = value;

        channel = d_pin->tim_channel;

        if(HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, channel) != HAL_OK)
        {
            logme("fail at HAL_TIM_PWM_ConfigChannel");
            break;
        }

        if(HAL_TIM_PWM_Start(&TimHandle, channel) != HAL_OK)
        {
            logme("fail at HAL_TIM_PWM_Start");
            break;
        }

        break;
    } while(1);
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__NUCLEOF207ZG) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

