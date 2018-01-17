## Adding to your project 

```
git submodule add https://github.com/aktos-io/mcu-debug
git submodule update --init --recursive 
```

## Document your project to point how to debug

Add the following instructions to your README:

```
Flashing and debugging
---------------------

A. Flashing (without debugging)     : `make write`
B. Debugging with `debug-cmd`       : `make create-debug-session`
```

# Setup your environment

See [setup-environment.md](./setup-environment.md)
