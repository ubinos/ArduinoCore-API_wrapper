/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__ARDUINONANO33BLE)

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
    {NRF_GPIO_PIN_MAP(0, 13)}, // LED_BUILTIN
    {NRF_GPIO_PIN_MAP(1,  9)}, // LED_POWER
    {NRF_GPIO_PIN_MAP(0, 24)}, // LED_RED
    {NRF_GPIO_PIN_MAP(0, 16)}, // LED_GREEN
    {NRF_GPIO_PIN_MAP(0,  6)}, // LED_BLUE
};

void initVariant(void)
{
    uint32_t on_led_pin = NRF_GPIO_PIN_MAP(1, 9);
    nrf_gpio_cfg_output(on_led_pin);
    nrf_gpio_pin_write(on_led_pin, 1);

    uint32_t i2c_pull_pin = NRF_GPIO_PIN_MAP(1, 0);
    nrf_gpio_cfg_output(i2c_pull_pin);
    nrf_gpio_pin_write(i2c_pull_pin, 1);

    uint32_t vdd_env_enable_pin = NRF_GPIO_PIN_MAP(0, 22);
    nrf_gpio_cfg_output(vdd_env_enable_pin);
    nrf_gpio_pin_write(vdd_env_enable_pin, 1);

    delay(100);
}

#endif /* (UBINOS__BSP__BOARD_MODEL == UBINOS__BSP__BOARD_MODEL__ARDUINONANO33BLE) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

