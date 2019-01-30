dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# write program to MCU
write: all
	st-flash write build/ch.bin 0x8000000

erase:
	@echo
	@echo
	@echo "------------------      WARNING    --------------------"
	@echo "In order to erase a buggy code, you need to:"
	@echo "1. either: tie Boot0 to VDD before power up."
	@echo "2. or	: Connect the NRST pin to the SWD to let debugger load"
	@echo "     	  the code under RESET."
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
		sleep 1s; 													\
		done

info:
	@echo "(Note: start-gdb-server on another terminal if not started yet)"

start-debugging:
	$(dir)/session.service

include $(dir)/cmd/debugger.mk
