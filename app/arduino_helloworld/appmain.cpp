/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>

#if (INCLUDE__APP__arduino_helloworld == 1)

#include <stdio.h>

#include <Arduino.h>

#define MSG_BUF_SIZE 512

static char _g_msg_buf[MSG_BUF_SIZE];

int appmain(int argc, char *argv[])
{
    int r;

    (void) r;

    printf("\n\n\n");
    printf("================================================================================\n");
    printf("arduino_helloworld (build time: %s %s)\n", __TIME__, __DATE__);
    printf("================================================================================\n");
    printf("\n");
    printf("\n");

    for (unsigned int i = 0;; i++)
    {
        bsp_busywaitms(1000);
        snprintf(_g_msg_buf, MSG_BUF_SIZE, "hello world ! (%u)", i);
        Serial.println(_g_msg_buf);
    }

    return 0;
}

#endif /* (INCLUDE__APP__arduino_helloworld == 1) */

