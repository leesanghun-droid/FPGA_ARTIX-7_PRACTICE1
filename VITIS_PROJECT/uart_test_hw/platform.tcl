# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\lsh\Desktop\FPGA_ARTIX-7_PRACTICE1\VITIS_PROJECT\uart_test_hw\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\lsh\Desktop\FPGA_ARTIX-7_PRACTICE1\VITIS_PROJECT\uart_test_hw\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {uart_test_hw}\
-hw {C:\Users\lsh\Desktop\FPGA_ARTIX-7_PRACTICE1\ARTY-A7_TEST\uart_test_hw.xsa}\
-out {C:/Users/lsh/Desktop/FPGA_ARTIX-7_PRACTICE1/VITIS_PROJECT}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {uart_test_hw}
platform generate -quick
platform generate
