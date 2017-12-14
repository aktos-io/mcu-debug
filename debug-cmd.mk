debug-cmd: all info
	@echo
	@echo
	@echo
	@echo "------------------------------------------------------"
	@echo "------------------      DİKKAT    --------------------"
	@echo "kodu her değiştirdiğinde bu programı tekrar çalıştır "
	@echo "------------------------------------------------------"
	@echo
	@echo
	@echo
	sleep 1
	arm-none-eabi-gdb -x $(dir)/gdb-init
