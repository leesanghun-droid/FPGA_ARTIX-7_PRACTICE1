# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\lsh\Desktop\FPGA_ARTIX-7_PRACTICE1\VITIS_PROJECT\UART_TEST_FW_system\_ide\scripts\systemdebugger_uart_test_fw_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\lsh\Desktop\FPGA_ARTIX-7_PRACTICE1\VITIS_PROJECT\UART_TEST_FW_system\_ide\scripts\systemdebugger_uart_test_fw_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty 210319756250A" && level==0 && jtag_device_ctx=="jsn-Arty-210319756250A-0362d093-0"}
fpga -file C:/Users/lsh/Desktop/FPGA_ARTIX-7_PRACTICE1/VITIS_PROJECT/UART_TEST_FW/_ide/bitstream/uart_test_hw.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/Users/lsh/Desktop/FPGA_ARTIX-7_PRACTICE1/VITIS_PROJECT/uart_test_hw/export/uart_test_hw/hw/uart_test_hw.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/lsh/Desktop/FPGA_ARTIX-7_PRACTICE1/VITIS_PROJECT/UART_TEST_FW/Debug/UART_TEST_FW.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
