Flashing and debugging
---------------------

Basic instructions:

1. Flashing                    : `make write`
2. Debugging:
    1. Start a session         : `make create-debug-session`
    2. Start your debugger     :
        either:
            `make debug-cmd`        for command line gdb client
            `make debug-cmd-help`   for short cheatsheet
        or:
            `make debug-gui-...`
