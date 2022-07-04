### How to prevent GCC from optimize out my variables?

Use `volatile`:

```c
volatile uint16_t timer_value = __HAL_TIM_GET_COUNTER(&htim1); // debugger 
```

### How to pause hardware timers when a breakpoint is hit?

Hardware timers (on STM32) is already paused when a breakpoint is hit. See: https://github.com/aktos-io/mcu-debug/issues/8
