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

#define TIMER_TONE                  TIM3
#define TIMER_TONE_CLOCK            (120000000 / 2)
#define TIMER_TONE_CLK_ENABLE()     __HAL_RCC_TIM3_CLK_ENABLE()
#define TIMER_TONE_IRQn             TIM3_IRQn
#define TIMER_TONE_IRQHandler       TIM3_IRQHandler
#define TIMER_TONE_CHANNEL          TIM_CHANNEL_1
#define TIMER_TONE_CHANNEL_IT       TIM_IT_CC1
#define TIMER_TONE_COUNT_MAX        0xFFFF
#define TIMER_TONE_BASE_CLOCK       0x9C40 /* 40 kHz */

typedef struct _arduino_tone_t
{
    TIM_HandleTypeDef timer_handle;
    uint8_t pin;
    PinStatus pin_status;
    uint32_t frequency_steps;
    uint32_t duration_steps;
    uint8_t zero_duration;
} arduino_tone_t;

extern arduino_tone_t _arduino_tone;

#endif /* _VARIANT_H_ */

