/* MIT License

// Copyright (c) 2022 Enrico Sanino

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

*/


#ifndef GPIO_UHAL_H
#define	GPIO_UHAL_H


#include <xc.h>

typedef enum { 
    gpio_uhal_false_bool = 0, 
    gpio_uhal_true_bool = 1 
    } gpio_uhal_bool_t;

#define GPIO_uHAL_PIN0 0x01
#define GPIO_uHAL_PIN1 0x02
#define GPIO_uHAL_PIN2 0x04
#define GPIO_uHAL_PIN3 0x08
#define GPIO_uHAL_PIN4 0x10
#define GPIO_uHAL_PIN5 0x20

#define GPIO_uHAL_MODE_OUT 0x00 // check values
#define GPIO_uHAL_MODE_IN 0x7F  // check

#define GPIO_uHAL_VAL_LOW  0x00 // check values
#define GPIO_uHAL_VAL_HIGH 0x7F  // check

#define GPIO_uHAL_CONF( mode_pin0, mode_pin1, mode_pin2, mode_pin3, mode_pin4, mode_pin5, \
                        val_pin0,  val_pin1,  val_pin2, val_pin3, val_pin4, val_pin5) \
                     TRISIO = ((mode_pin0 & GPIO_uHAL_PIN0) | (mode_pin1 & GPIO_uHAL_PIN1) | (mode_pin2 & GPIO_uHAL_PIN2) | (mode_pin3 & GPIO_uHAL_PIN3) | (mode_pin4 & GPIO_uHAL_PIN4)| (mode_pin5 & GPIO_uHAL_PIN5));\
                     GPIO   = ((val_pin0 & GPIO_uHAL_PIN0) | (val_pin1 & GPIO_uHAL_PIN1) | (val_pin2 & GPIO_uHAL_PIN2)| (val_pin3 & GPIO_uHAL_PIN3)| (val_pin4 & GPIO_uHAL_PIN4)| (val_pin5 & GPIO_uHAL_PIN5));

#define GPIO_uHAL_SET(pin_group) GPIO |= (GPIO_uHAL_VAL_HIGH & pin_group)
#define GPIO_uHAL_RESET(pin_group) GPIO &= ~(GPIO_uHAL_VAL_HIGH & pin_group)
#define GPIO_uHAL_TOGGLE(pin_group) GPIO ^= (GPIO_uHAL_VAL_HIGH & pin_group)
#define GPIO_uHAL_READ_BOOL(pin_group)  ((gpio_uhal_bool_t)!!(GPIO & pin_group))
#define GPIO_uHAL_READ(pin_group)  (GPIO & pin_group)

#endif