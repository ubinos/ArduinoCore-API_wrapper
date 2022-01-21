/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__NRF52_NRF52XXX == 1)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

#include "_variant.h"

static int _readResolution = 10;
static uint8_t _is_nrf_drv_saadc_init = 0;

void analogReadResolution(int res)
{
  _readResolution = res;
}

int analogRead(pin_size_t pinNumber)
{
    ret_code_t err_code;
    arduino_a_pin_t const * a_pin;
    nrf_saadc_value_t value;

    do
    {
        if (pinNumber >= NUM_ANALOG_INPUTS)
        {
            logme("pinNumber is out of range");
            break;
        }

        a_pin = &_g_a_pin_map[pinNumber];

        if (a_pin->enable == 0)
        {
            logme("Not enabled");
            break;
        }

        if (!_is_nrf_drv_saadc_init)
        {
            err_code = nrf_drv_saadc_init(NULL, NULL);
            APP_ERROR_CHECK(err_code);

            if (_readResolution <= 8) {
                nrf_saadc_resolution_set(NRF_SAADC_RESOLUTION_8BIT);
            } else if (_readResolution <= 10) {
                nrf_saadc_resolution_set(NRF_SAADC_RESOLUTION_10BIT);
            } else if (_readResolution <= 12) {
                nrf_saadc_resolution_set(NRF_SAADC_RESOLUTION_12BIT);
            } else {
                nrf_saadc_resolution_set(NRF_SAADC_RESOLUTION_14BIT);
            }

            _is_nrf_drv_saadc_init = 1;
        }

        nrf_saadc_channel_config_t channel_config = NRF_DRV_SAADC_DEFAULT_CHANNEL_CONFIG_SE(a_pin->adc_input);

        err_code = nrf_drv_saadc_channel_init(a_pin->channel, &channel_config);
        APP_ERROR_CHECK(err_code);

        err_code = nrf_drv_saadc_sample_convert(a_pin->channel, &value);
        APP_ERROR_CHECK(err_code);

        break;
    } while(1);

    return (int) value;
}

#endif /* (UBINOS__BSP__NRF52_NRF52XXX == 1) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

