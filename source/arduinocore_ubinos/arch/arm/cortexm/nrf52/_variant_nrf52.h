/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef _VARIANT_NRF52_H_
#define _VARIANT_NRF52_H_

#include <ubinos.h>

#include <ubinos/bsp/arch.h>

#include <variant.h>

#include "nrf_gpio.h"

typedef struct _arduino_d_pin_t
{
    uint32_t no;
} arduino_d_pin_t;

extern arduino_d_pin_t const _g_d_pin_map[NUM_DIGITAL_PINS];

#endif /* _VARIANT_NRF52_H_ */

