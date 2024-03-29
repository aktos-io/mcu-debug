GDB commands by function - simple guide
---------------------------------------
> More important commands have a `*`, `** ` or `...` prefix.

```
** <ENTER>              repeat the last command
** exit                 quit current session
** shell [cmd [args]]   run shell commands (type "exit" to return to gdb)
** --------------------------------------------------
```

### Breakpoints

```
** break file.c:101 on  set a breakpoint on line 101 of file file.c
** watch my_variable    set software watchpoint on my_variable
** i b                  show breakpoints
** i watchpoints        show current watchpoints
** d, delete 1          delete a breakpoint by number
** commands N           run set of commands when breakpoint #N is reached
delete                  delete all breakpoints (prompted)
** clear                delete breakpoints at current line
clear function          delete breakpoints at function
clear line              delete breakpoints at line
disable 2               turn a breakpoint off, but don't remove it
enable 2                turn disabled breakpoint back on
** update-breakpoints, ub      generates and uses breakpoints from source code
```

### Browsing data

```
** p, print VAR         print `VAR`'s contents
** p/x VAR              display `VAR` as Hex
** set myvar = 5        set `myvar` to 5
```

### Running the program

```
** c, cont              continue the program
** reload 				compile and upload code to the target 
** reload-without-compile

...basic usage:
    # should stop at main()
    (gdb) update-breakpoints  ## optional
    (gdb) c
    #... inspect code
    #... when you changed your source code, simply reload with:
    (gdb) reload

soft and hard reset (through NRST pin) the board:
    (gdb) Ctrl+C
    (gdb) reset-mcu

** n, next              step but step over functions
** s, step              single step the program; step into functions
** fin, finish          step out the current function
step count              singlestep \fIcount\fR times
next count              next \fIcount\fR times
CTRL-C                  actually SIGINT, stop execution of current program
```

### Stack backtrace

```
** bt        	         print stack backtrace
** f, frame              show current execution position
** where                show where this function is called from
** tui-open (tui-close)    show/hide TUI mode

...show code around current breakpoint:
    (gdb) tui-open
    ...
    (gdb) tui-close
    (gdb) focus cmd    # <- focus to cmd

```
### Browsing source

```
list 101        	    list 10 lines around line 101
list 1,10               list lines 1 to 10
list main  	            list lines around function
list basic.c:main       list from another file basic.c
list -        	        list previous 10 lines
```

### History Display

```
show commands        	    print command history (>= gdb 4.0)
info editing       	        print command history (gdb 3.5)
ESC-CTRL-J        	        switch to vi edit mode from emacs edit mode
set history expansion on    turn on c-shell like history
break class::member         set breakpoint on class member. may get menu
list class::member          list member in class
ptype class                 print class members
print *this        	        print contents of this pointer
rbreak regexpr     	        useful for breakpoint on overloaded member name
```

### Miscellaneous

```
define command ... end        define user command
source file        	load gdb commands from file
quit        		quit gdb
```
