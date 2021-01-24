# write program to MCU
write: all
	@st-flash --reset write build/ch.bin 0x8000000 || { \
		echo "----------------------------------------------------------------"; \
		echo "HINT: Try resetting MCU (NRST->GND, then VDD) then retry loading."; \
		echo "----------------------------------------------------------------"; \
		exit 5; \
	}

erase:
	@echo
	@echo
	@echo "------------------	  WARNING	--------------------"
	@echo "In order to erase a buggy code, you need to:"
	@echo "1. either: tie Boot0 to VDD before power up."
	@echo "2. or	: Connect the NRST pin to the SWD to let debugger load"
	@echo "		   the code under RESET. (Use \"STM32 ST-LINK utility\"
	@echo "		   from st.com)"
	@echo "------------------------------------------------------"
	@echo
	@echo
	st-flash erase

stop-gdb-server:
	killall st-util 2>/dev/null; true


start-gdb-server: stop-gdb-server
	@while true; do												 \
		st-util;													\
		echo "";													\
		echo "--------- restarting gdb server -------------";	   \
		echo "";													\
		sleep 1s;												   \
		done

mcu-info:
	@st-info --probe