dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ifeq (,$(GDB_ADDR))
ifeq (openocd,$(FLASHER))
GDB_ADDR := localhost:3333
else
GDB_ADDR := localhost:4242
endif
endif

ifneq (,$(GCC_PATH))
	# add a path separator at the end
	GCC_PATH := $(GCC_PATH)/
endif

ifneq (, $(shell which $(GCC_PATH)arm-none-eabi-gdb))
GDB := $(GCC_PATH)arm-none-eabi-gdb
else
ifneq (, $(shell which $(GCC_PATH)gdb-multiarch))
GDB := $(GCC_PATH)gdb-multiarch
else
$(error "mcu-debug: No GDB executable found")
endif
endif

ifeq (openocd,$(FLASHER))
include $(dir)/openocd.mk
else
include $(dir)/stlink.mk
endif

help-debug:
	echo "* Run \"make start-gdb-server\" in a terminal window"; \
	echo "* Run \"make cmd-debugger\" in a separate terminal window"; \
	echo ; \

include $(dir)/cmd/debugger.mk

gui-debugger:
	@$(MAKE) __gen_gdb_init USE_TUI=0 --no-print-directory
	gdbgui -g "$(GDB) -x /tmp/gdb-init"

# Empty the default goal
.DEFAULT_GOAL :=
