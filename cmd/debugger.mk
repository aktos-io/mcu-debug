ifeq (,$(USE_TUI))
USE_TUI := 1
endif

__gen_gdb_init: 
	@cat $(dir)/gdb-init \
		| sed "s|{{TARGET_ADDRESS}}|$(GDB_ADDR)|" \
		| sed "s|{{ELF_FILE}}|$(ELF_FILE)|" \
		| sed "s|{{USE_TUI}}|$(USE_TUI)|" \
		> /tmp/gdb-init

cmd-debugger: 
	@if [ "$(PROFILE)" != "Debug" ]; then \
		echo "WARNING: ----------------------------------------------------"; \
		echo "WARNING: Not in 'Debug' mode! Things might behave unpredictable."; \
		echo 'WARNING: Set "Debug" in your Target file'; \
		echo "WARNING: ----------------------------------------------------"; \
	fi
	@echo "------------------------------------------------------------------"
	@echo "GDB server target: $(GDB_ADDR)"
	@echo "------------------------------------------------------------------"
	$(MAKE) __gen_gdb_init
	$(GDB) -x /tmp/gdb-init


help-cmd-debugger:
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

breakpoint_file := ./breakpoints.txt
DEBUG_OUTPUT := false
BRIEF_OUTPUT := true

ifeq (,$(App))
$(error "App is not set.")
endif

gen-breakpoints: SHELL:=/bin/bash   # HERE: this is setting the shell for this target
gen-breakpoints:
	@# $(App) variable is either empty or a valid path with a slash at the end

	@# Header
	@echo "# Generated by mcu-debug/gen-breakpoints" > $(breakpoint_file)
	@echo "# For App: $(App)"						 >> $(breakpoint_file)
	@echo "# --------------------------------------" >> $(breakpoint_file)

	@# This option answers "Y" to 
	@# "Make breakpoint pending on future shared library load? (y or [n])"
	@# question which GDB asks when some code is somehow optimized out 
	@# (although using -Og switch) so the breakpoint is not reachable. 
	@echo "set breakpoint pending on" >> $(breakpoint_file)

	@# Parse application files for "// debugger" or "// debugger: commands..." lines
	@grep --exclude='*' \
		--exclude-dir='.git' \
		--include='*.c' \
		--include='*.h' \
		"^[^/]*.*[^/]//\s*debugger.*" $(App)* -HnosR \
		| sed -r \
 		's|^([^:]+):([^:]+):\s+.*//\s*debugger(:?\s*)(.*)|\1\t\2\t\3\t\4|' \
 		| while read -r file line has_cmd commands; do \
 			$(DEBUG_OUTPUT) && \
 				printf 'file: %s, line: %i, has_cmd: >|%s|<, commands: %s\n' \
 					"$$file" $$line "$$has_cmd" "$$commands"; \
			if [ -z "$$has_cmd" ] || [ -z "$$commands" ] || [[ "$$commands" =~ ^/ ]]; then \
				commands=;	\
			fi; \
			echo "break $${file}:$${line}" >> $(breakpoint_file); \
			if [ -n "$$commands" ]; then \
				echo "commands" >> $(breakpoint_file); \
				echo "silent" 				>> $(breakpoint_file); \
				printf '%s\n' "$$commands"	>> $(breakpoint_file); \
				echo "continue"				>> $(breakpoint_file); \
				echo "end"					>> $(breakpoint_file); \
			fi; \
			$(BRIEF_OUTPUT) && \
 				echo -n "* $${file}:$${line}	$${commands}"; \
 				echo -e "\r"; \
		done; 
	@#echo "Breakpoints written to: $(breakpoint_file)"
