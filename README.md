
# Usage

### 1. Setup your environment (Requirements)

Regardless of your operating system, you need to handle the following pieces:

1. Debugger server:
   An application that will forward requests to/from STM32 and a local TCP port via GDB protocol.

    * Install st-util or openocd

2. Debugger executable: specifically `arm-none-eabi-gdb`
3. Probably a compiler: `arm-none-eabi-gcc`
4. Add your libraries if there are any (RTOS source code, drivers, etc)

> OPTIONAL: Setting up GUI debugger: 
>    * https://www.gdbgui.com/
>    * [add-gui-debugger.md](./add-gui-debugger.md)


### 2. Add `mcu-debug` to your project

```
git submodule add https://github.com/aktos-io/mcu-debug
```

### 3. Include in your `Makefile`

Include mcu-debug makefiles in your main Makefile:

```mk
include ./mcu-debug/main.mk
```

### 4. Add debugging info to your documentation

Add the following instructions to your project's `README`:

```md
A. Flashing (without debugging): `make write`

B. Debugging with command line:
    * In terminal 1: `make start-gdb-server`
    * In terminal 2: `make cmd-debugger` (or `make gui-debugger`)
```

# Requirements 

* texane/STLink or OpenOCD
* gdb-arm-none-eabi

# Configuration variables

#### MCU_DEBUG_MAJOR

This variable is used to avoid users from blindly using this tool if any major change has been made. 

```
MCU_DEBUG_MAJOR 	:= 2
```

#### App
```
App                 := Src/* my_lib/*
```
This is the variable that we use to identify the files which are to be used generate the breakpoints from `// debugger` lines. Use the `/*` wildcard postfix and use a space character to point multiple directories. Required.

#### Compiled File
```
ELF_FILE            := path/to/app.elf  # make sure this is built with debug symbols
BIN_FILE 			:= path/to/app.bin
```
This is the compiled application files.

#### GCC Path
```
GCC_PATH            := $(HOME)/embedded/gcc/gcc-arm-none-eabi-5_3-2016q1/bin
```
Optional, you may omit if you won't compile your application. 

#### GDB Address
```
GDB_ADDR            := 192.168.56.103:4242
```
GDB Server `address:port`.

#### Flasher Definition
If you use OpenOCD as your debugger, use the following settings:
```
FLASHER             := openocd
OPENOCD_INTERFACE   := stlink-v2.cfg
OPENOCD_TARGET      := stm32f0x.cfg
```

If you use Stlink as your debugger, use the following settings:
```
FLASHER							:= stlink
```

#### Terminal UI

If you want to use terminal UI, use the following setting:

```
USE_TUI    := 1
```


