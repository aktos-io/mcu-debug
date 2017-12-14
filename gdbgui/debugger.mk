debug-gui-gdbgui: info
	gdbgui -g arm-none-eabi-gdb -x $(dir)/gdb-init
