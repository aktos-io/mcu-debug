!!!
!!! BROKEN
!!!

Configuration steps for code::blocks:
-------------------------------------

File -> New -> Empty Project
Compiler: No compiler


1. Project -> Properties
    Project Settings:
        do tick: "This is a custom Makefile"

    Debugger:
        Select Target: "<Project>"
            Remote Connection:
              IP address: localhost
              Port: 4242

            Additional GDB Commands:
              After Connection:
                (copy and paste `./gdb-init` file contents here)

    Build Targets:
        Build targets -> Debug
            Output filename ->

3. Settings -> Debugger -> Default
    SET     : Executable path: $(which arm-none-eabi-gdb)
    SELECT  : Do *not* run the debugee
