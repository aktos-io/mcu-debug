GDB commands by function - simple guide
---------------------------------------
More important commands have a `*`, `** `, ... by them.

** <ENTER>              repeat the last command
** exit                 quit current session

### Breakpoints

** b, break ...         set a breakpoint:
**          basic.c:101     on line 101 of file basic.c
**          main            on a function
**          101             on line 101
** i b                  show breakpoints
** d, delete 1          delete a breakpoint by number
delete                  delete all breakpoints (prompted)
** clear                delete breakpoints at current line
clear function          delete breakpoints at function
clear line              delete breakpoints at line
disable 2               turn a breakpoint off, but don't remove it
enable 2                turn disabled breakpoint back on
** watch data           set software watchpoint on variable
** i watchpoints        show current watchpoints


### Browsing data

** p, print VAR         print `VAR`'s contents


### Running the program

** c, cont              continue the program
** reload               reload the program

...usual startup:
    # should stop at main(), see ../gdb-init
    (gdb) c

...soft reset the board:
    (gdb) Ctrl+C
    (gdb) reset

** n, next              step but step over functions
** s, step              single step the program; step into functions
step count              singlestep \fIcount\fR times
next count              next \fIcount\fR times
CTRL-C                  actually SIGINT, stop execution of current program

### Stack backtrace

** bt        	        print stack backtrace
** f, frame             show current execution position

...show code around current breakpoint:
    (gdb) f
    (gdb) l

### Browsing source

list 101        	list 10 lines around line 101
list 1,10        list lines 1 to 10
list main  	list lines around function
list basic.c:main        list from another file basic.c
list -        	list previous 10 lines


### History Display

show commands        	print command history (>= gdb 4.0)
info editing       	print command history (gdb 3.5)
ESC-CTRL-J        	switch to vi edit mode from emacs edit mode
set history expansion on       turn on c-shell like history
break class::member       set breakpoint on class member. may get menu
list class::member        list member in class
ptype class               print class members
print *this        	print contents of this pointer
rbreak regexpr     	useful for breakpoint on overloaded member name

### Miscellaneous

define command ... end        define user command
shell command args       execute shell command
source file        	load gdb commands from file
quit        		quit gdb
