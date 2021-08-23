/*
 * Copyright (c) 2021 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos.h>


#if (INCLUDE__APP__arduino_ex02_digital_DigitalInputPullup == 1)


#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <Arduino.h>

#include "ino/DigitalInputPullup.ino"

static void arduino_func(void * arg);

int appmain(int argc, char * argv[]) {
	int r;
	(void) r;

	r = task_create(NULL, arduino_func, NULL, task_getlowestpriority(), 0, "arduino");
	assert(r == 0);

	ubik_comp_start();

	return 0;
}

static void arduino_func(void * arg) {
	printf("\n\n\n");
	printf("================================================================================\n");
	printf("arduino_ex02_digital_DigitalInputPullup (build time: %s %s)\n", __TIME__, __DATE__);
	printf("================================================================================\n");
    printf("\n");

    initVariant();
    setup();
    for (unsigned int i = 0; ; i++) {
        loop();
    }
}


#endif /* (INCLUDE__APP__arduino_ex02_digital_DigitalInputPullup == 1) */

