/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>


#if (INCLUDE__APP__arduino_helloworld_mt == 1)


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <Arduino.h>

static void helloworld_mt_task1func(void * arg);
static void helloworld_mt_task2func(void * arg);

#define MSG_BUF_SIZE 512

static char _g_msg_buf_1[MSG_BUF_SIZE];
static char _g_msg_buf_2[MSG_BUF_SIZE];

int appmain(int argc, char * argv[]) {
	int r;

	printf("\n\n\n");
	printf("================================================================================\n");
	printf("arduino_helloworld_mt (build time: %s %s)\n", __TIME__, __DATE__);
	printf("================================================================================\n");
    printf("\n");

    srand(time(NULL));

	r = task_create(NULL, helloworld_mt_task1func, NULL, task_getmiddlepriority(), 0, "task1");
	if (0 != r) {
		logme("fail at task_create");
	}

	r = task_create(NULL, helloworld_mt_task2func, NULL, task_getmiddlepriority(), 0, "task2");
    if (0 != r) {
        logme("fail at task_create");
    }

	ubik_comp_start();

	return 0;
}

static void helloworld_mt_task1func(void * arg) {
	int r;
	unsigned int delayms;

	(void) r;

    printf("\n");

	for (unsigned int i = 0; ; i++) {
	    delayms = (rand() % 10 + 1) * 200;
		task_sleepms(delayms);
	    snprintf(_g_msg_buf_1, MSG_BUF_SIZE, "1: hello world ! (%u) (delay = %4d ms)", i, delayms);
	    Serial.println(_g_msg_buf_1);
	}
}

static void helloworld_mt_task2func(void * arg) {
    int r;
    unsigned int delayms;

    (void) r;

    printf("\n");

    for (unsigned int i = 0; ; i++) {
        delayms = (rand() % 10 + 1) * 200;
        task_sleepms(delayms);
        snprintf(_g_msg_buf_2, MSG_BUF_SIZE, "2: hello world ! (%u) (delay = %4d ms)", i, delayms);
        Serial.println(_g_msg_buf_2);
    }
}


#endif /* (INCLUDE__APP__arduino_helloworld_mt == 1) */


