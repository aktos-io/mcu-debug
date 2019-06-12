debug-with-cmd:
	@if [ "$(BUILD_TARGET)" != "Debug" ]; then \
		echo ----------------------------------------------------; \
		echo "Not in 'Debug' mode! Things might not act as you expected."; \
		echo 'Set "Debug" in your Target file'; \
		echo ----------------------------------------------------; \
		sleep 5; \
	fi
	$(MAKE) all
	@echo "------------------------------------------------------------------"
	@echo "Start GDB server with 'make start-gdb-server' on another terminal."
	@echo "------------------------------------------------------------------"
	$(GCC_Path)arm-none-eabi-gdb -x $(dir)/gdb-init

debug-with-cmd-help:
	@clear
	@echo
	@echo "Important commands"
	@echo "------------------"
	@# show only lines beginning with double stars ('**')
	@cat $(dir)/cmd/gdb-cheatsheet.md | grep -e "^\*\*.*"

	@echo
	@echo "Examples"
	@echo "-----------------"
	@# show important snippets, like:
	@#
	@#     ...this is an example:
	@#         do that
	@#         do this
	@# (note: $$ is for escaping $ in Makefile)
	@cat $(dir)/cmd/gdb-cheatsheet.md | sed -n '/^\.\.\./,/^$$/p'

breakpoint_file := ./_breakpoints.txt
gen-breakpoints:
	@echo --------------------------------------------------
	@echo "# Generated by mcu-debug/gen-breakpoints" > $(breakpoint_file)
	@echo "# --------------------------------------" >> $(breakpoint_file)
	@grep --exclude='*' \
		--exclude-dir='.git' \
		--include='*.c' \
		--include='*.h' \
		"^[^/]*[a-zA-Z].*[^/]//\s*debugger" * -HnosR \
		| grep -Eo "^[^:]+:[^:]+" \
		| awk -F: '{x="break "$$1":"($$2 + 0); print x}' >> $(breakpoint_file)
	@echo
	@cat $(breakpoint_file)
	@echo --------------------------------------------------
