dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# write program to MCU
write: all
	st-flash write build/ch.bin 0x8000000

erase:
	@echo
	@echo
	@echo "------------------      WARNING    --------------------"
	@echo "Make sure you didn't forget to short circuit Boot0 to VDD"
	@echo "------------------------------------------------------"
	@echo
	@echo
	st-flash erase

stop-gdb-server:
	killall st-util 2>/dev/null; true


start-gdb-server: stop-gdb-server
	@while true; do 												\
		st-util; 													\
		echo ""; 													\
		echo "--------- restarting gdb server -------------"; 		\
		echo ""; 													\
		done

info:
	@echo "(Note: start-gdb-server on another terminal if not started yet)"

create-debug-session:
	$(dir)/session.service

include $(dir)/cmd/debugger.mk
include $(dir)/codeblocks/debugger.mk
include $(dir)/gdbgui/debugger.mk
#include $(dir)/qtcreator/debug-qtcreator.mk
