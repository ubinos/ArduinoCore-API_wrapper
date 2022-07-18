/*
 * Copyright (c) 2022 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#include <Arduino.h>

#include "ino.h"
#include "bme280test/bme280test.ino"

void arduino_func(void * arg)
{
    initVariant();
    setup();
    for (unsigned int i = 0; ; i++)
	{
        loop();
    }
}
