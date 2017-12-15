# General Instructions

In order to add a new GUI debugger tool (code::blocks, qtcreator, eclipse, etc...)
follow these instructions:

Configure your GUI debugger/IDE:

1. Debugger **MUST**:
    1. Debugger MUST use `arm-none-eabi-gdb` (or equivalent) binary to
    connect to the gdb-server
    2. Debugger MUST run the commands (present in `./gdb-init` file)
    after connecting to the remote debugger
    3. Debugger MUST try to compile the code through `make` command

2. Debugger **MUST NOT**:    
    2. Debugger MUST NOT run the compiled code on the current machine

3. If debugger has custom command support:
    1. In order to re-compile and re-flash the code, run `reload` in gdb.
    2. In order to quit debugging session, run `exit` in gdb.

NOTE: You should include all binaries and library files in your PATH environment
variable


# List

To list available GUI debuggers, use the following command:

```
make debug-gui [TAB][TAB]
```
