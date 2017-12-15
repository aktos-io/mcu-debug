debug-cmd: all info
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++++ NOTE: 'reload' when compiled code is changed. ++++"
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
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
