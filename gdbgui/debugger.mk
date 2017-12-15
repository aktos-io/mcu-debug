debug-gui-gdbgui: info
	@echo "------------------------------------------------------"
	@echo "currently incomplete..."
	@echo "------------------------------------------------------"
	exit 1 
	gdbgui -g arm-none-eabi-gdb -x $(dir)/gdb-init
