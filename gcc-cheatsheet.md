### How to prevent GCC from optimize out my variables?

Use a `static volatile` variable:

```c
static volatile _d;

...

void myfunction(){
  if(some_condition){
    _d; // debugger 
  }
}
```

### How to pause hardware timers when a breakpoint is hit?

Hardware timers (on STM32) is already paused when a breakpoint is hit. See: https://github.com/aktos-io/mcu-debug/issues/8

### Examining the memory 

https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

```c
x addr
```

```
x/10x &dmabuf
```

### Examining the call stack

Use `up` when a breakpoint is hit. (See: https://www.cse.unsw.edu.au/~learn/debugging/modules/gdb_call_stack/)
