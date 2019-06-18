
# Usage

### Setup your environment (for the first time)
[Setup your environment](./setup-environment.md) if you didn't already.


### Add `mcu-debug` to your project

```
git submodule add https://github.com/aktos-io/mcu-debug
git submodule update --init --recursive
```

### Include in your `Makefile`

Include mcu-debug makefiles in your main Makefile:

```mk
include ./mcu-debug/main.mk
```

### Add debugging info to your documentation

Add the following instructions to your project's `README`:

```
A. Flashing (without debugging)                   : `make write`
B. Debugging with command line (`debug-with-cmd`) : `make debug`
```

# Requirements 

* st-link: https://github.com/texane/stlink/blob/master/doc/compiling.md
* `apt-get install gdb-arm-none-eabi`
