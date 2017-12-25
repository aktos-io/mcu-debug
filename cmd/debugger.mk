debug-cmd: all info
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++++ NOTE: 'reload' when compiled code is changed. ++++"
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	@sleep 2
	arm-none-eabi-gdb -x $(dir)/gdb-init

debug-cmd-help:
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

breakpoint_syntax := // debugger
breakpoint_file := ./breakpoints.txt
gen-breakpoints:
	@echo "Generate breakpoints after '$(breakpoint_syntax)' lines:"
	@grep "$(breakpoint_syntax)" * -Hnos | grep -Eo "^[^:]+:[^:]+" | awk -F: '{x="break "$$1":"($$2 + 1); print x}' > $(breakpoint_file)
	@echo --------------------------------------------------
	@cat $(breakpoint_file)
