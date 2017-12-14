# General Instructions

In order to add a new GUI debugger tool (code::blocks, qtcreator, eclipse, etc...)
follow these instructions:

1. Find a GUI debugger with remote debug capabilities.

2. Configure your GUI debugger/IDE:

  1. Debugger SHOULD use project's Makefile at the compile step before debugging
  2. Debugger MUST use `arm-none-eabi-gdb` binary to connect to the debugger
  3. Debugger MUST connect to remote debugger at "localhost:4242"
     when debugging
  4. Debugger MUST run the commands (present in `./gdb-init` file)
     after connecting to the remote debugger
  5. Debugger MUST NOT run the compiled code in the current machine


NOTE: You should include all binaries in your PATH environment variable. Your RTOS
and any other libraries should be in your search path as well.

# List

Codeblocks  : ./codeblocks
QtCreator   : ./qtcreator
gdbgui      : ./gdbgui
