
# Usage

## Setup your environment (for the first time)
[Setup your environment](./setup-environment.md) if you didn't already.


## Add `mcu-debug` to your project 

```
git submodule add https://github.com/aktos-io/mcu-debug
git submodule update --init --recursive 
```

## Add debugging info

Add the following instructions to your project's `README`:

```
Flashing and debugging
---------------------

A. Flashing (without debugging)     : `make write`
B. Debugging with `debug-cmd`       : `make create-debug-session`
```

