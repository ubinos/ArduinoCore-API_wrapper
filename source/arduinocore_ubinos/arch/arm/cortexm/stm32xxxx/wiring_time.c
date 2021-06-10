/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__ARDUINOCORE_API == 1)
#if (UBINOS__BSP__STM32_STM32XXXX == 1)

#include <Arduino.h>

#include <ubinos/bsp/arch.h>

void delay(unsigned long ms)
{
    if (_bsp_kernel_active && !bsp_isintr())
    {
        task_sleepms(ms);
    }
    else{
        bsp_busywaitms(ms);
    }
}

unsigned long millis(void)
{
  return (unsigned long) ubik_tickcouttotimems(ubik_gettickcount());
}

#endif /* (UBINOS__BSP__STM32_STM32XXXX == 1) */
#endif /* (INCLUDE__ARDUINOCORE_API == 1) */

