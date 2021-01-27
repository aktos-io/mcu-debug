# write program to MCU
write: all
	@st-flash --reset write build/ch.bin 0x8000000 || { \
		echo "----------------------------------------------------------------"; \
		echo "HINT: Try resetting MCU (NRST->GND, then VDD) then retry loading."; \
		echo "----------------------------------------------------------------"; \
		exit 5; \
	}

erase:
	@st-flash erase || { \
		echo ; \
		echo ; \
		echo "------------------      TIP    --------------------"; \
		echo "In order to erase a buggy code, you need to:"; \
		echo "1. either: Connect Boot0 to VDD before power up, power up, then erase."; \
		echo "2. or	: Connect the NRST pin to the SWD to let the debugger load"; \
		echo "  the code under RESET. (Original \"STM32 ST-LINK utility\" has this feature)"; \
		echo "------------------------------------------------------"; \
		echo ; \
		echo ; \
	}

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

mcu-info:
	@st-info --probe

