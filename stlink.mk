# write program to MCU
__check_bin_file__:
ifeq (,$(BIN_FILE))
	$(error "BIN_FILE is not set. What do we write?")
endif
ifeq ("$(wildcard $(BIN_FILE))","")
	$(error "Specified BIN_FILE can not be found: $(BIN_FILE)")
endif

write: __check_bin_file__ all
	@st-flash --reset write $(BIN_FILE) 0x8000000 || { \
		echo "----------------------------------------------------------------"; \
		echo "HINT: Try resetting MCU (NRST->GND, then VDD) then retry loading."; \
		echo "----------------------------------------------------------------"; \
		exit 5; \
	}

# See https://github.com/stlink-org/stlink/blob/develop/doc/tutorial.md#running-programs-from-sram
write-to-ram: __check_bin_file__ all
	@st-flash --reset write $(BIN_FILE) 0x20000000 || { \
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
    echo "(Note: We do not reset the target)"; \
		st-util --no-reset; 													\
		echo ""; 													\
		echo "--------- restarting gdb server -------------"; 		\
		echo ""; 													\
		sleep 1s; 													\
		done

mcu-info:
	@st-info --probe

