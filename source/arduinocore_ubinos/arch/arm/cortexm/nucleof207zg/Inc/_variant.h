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
    uint32_t tim_clock;
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

// #define TIMER_TONE                  TIM6
// #define TIMER_TONE_CLOCK            (120000000 / 2)
// #define TIMER_TONE_CLK_ENABLE()     __HAL_RCC_TIM6_CLK_ENABLE()
// #define TIMER_TONE_IRQn             TIM6_DAC_IRQn
// #define TIMER_TONE_IRQHandler       TIM6_DAC_IRQHandler
// #define TIMER_TONE_COUNT_MAX        0xFFFF
// //#define TIMER_TONE_PULSE            1024
// #define TIMER_TONE_CHANNEL          TIM_CHANNEL_1

#define TIMER_TONE                  TIM3
#define TIMER_TONE_CLOCK            (120000000 / 2)
#define TIMER_TONE_CLK_ENABLE()     __HAL_RCC_TIM3_CLK_ENABLE()
#define TIMER_TONE_IRQn             TIM3_IRQn
#define TIMER_TONE_IRQHandler       TIM3_IRQHandler
#define TIMER_TONE_COUNT_MAX        0xFFFF
// #define TIMER_TONE_PULSE            1000
#define TIMER_TONE_CHANNEL          TIM_CHANNEL_1

#endif /* _VARIANT_H_ */

