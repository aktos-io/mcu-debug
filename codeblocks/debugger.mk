debug-gui-codeblocks: info
	@echo "------------------------------------------------------"
	@echo "currently broken..."
	@echo "------------------------------------------------------"
	exit 1
	@echo
	@echo
	@echo
	@echo "------------------------------------------------------"
	@echo "------------------      DİKKAT    --------------------"
	@echo " 'debugger executable' kısmında 'arm-none-eabi-gdb' "
	@echo " belirtildiğinden emin ol!"
	@echo "------------------------------------------------------"
	@echo
	@echo
	@echo
	sleep 5

	codeblocks *.cbp > /dev/null

# Code::Blocks specific
Debug: all

cleanDebug: clean
