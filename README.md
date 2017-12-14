Flashing and debugging
---------------------

(see [brief-instructions](./brief-instructions.md))

Setup Debugger
---------------------

Whether Windows, Linux or any other OS, you need the followings:

1. Debugger server:
  an application that will forward requests to/from STM32 and
  a local TCP port with GDB protocol

      eg. st-util, openocd

2. Debugger executable: specifically `arm-none-eabi-gdb`
3. Compiler: specifically `arm-none-eabi-gcc`
4. Your libraries, RTOS source code, etc (if any)
5. OPTIONAL: A GUI debugger (see add-gui-debugger.md)

## Setup on Linux

(see setup-linux.md)
