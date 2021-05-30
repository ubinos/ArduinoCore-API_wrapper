#ifndef _VARIANT_H_
#define _VARIANT_H_

#include <ubinos.h>

#include <ubinos/bsp/arch.h>

typedef struct _arduino_d_pin_t
{
    GPIO_TypeDef * port;
    uint32_t no;
    uint8_t support_pwm;
    uint32_t alternate;
    TIM_TypeDef * tim_instance;
    uint32_t tim_channel;
} arduino_d_pin_t;

extern arduino_d_pin_t const _g_d_pin_map[NUM_DIGITAL_PINS];

int init_wiring_digital(void);

typedef struct _arduino_a_pin_t
{
    GPIO_TypeDef * port;
    uint32_t no;
    ADC_TypeDef * adc_instance;
    uint32_t adc_channel;
} arduino_a_pin_t;

extern arduino_a_pin_t const _g_a_pin_map[NUM_ANALOG_INPUTS];

int init_wiring_analog(void);

#endif /* _VARIANT_H_ */

