ifeq (,$(OPENOCD_TARGET))
$(error "OPENOCD_TARGET should be set (see /usr/share/openocd/scripts/target/*)")
endif

ifeq (,$(OPENOCD_INTERFACE))
$(error "OPENOCD_INTERFACE should be set (see /usr/share/openocd/scripts/interface/*)")
endif

start-gdb-server:
	cd /usr/share/openocd/scripts && \
	openocd -f interface/$(OPENOCD_INTERFACE) -c "transport select hla_swd" -f target/$(OPENOCD_TARGET)
