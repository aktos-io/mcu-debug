### How to prevent GCC from optimize out my variables?

Use `volatile`:

```c
volatile uint16_t timer_value = __HAL_TIM_GET_COUNTER(&htim1); // debugger 
```
