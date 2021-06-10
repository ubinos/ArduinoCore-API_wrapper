/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef VARIANT_H_
#define VARIANT_H_

#define NUM_DIGITAL_PINS            2

#define NUM_ANALOG_INPUTS           0

#define ADC_RESOLUTION              10

#define PWM_FREQUENCY               1000
#define PWM_MAX_DUTY_CYCLE          255

_Static_assert((ADC_RESOLUTION > 0) &&(ADC_RESOLUTION <= 32), "ADC_RESOLUTION must be 0 < x <= 32!");

#endif /* VARIANT_H_ */

