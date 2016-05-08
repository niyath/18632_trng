#set_property IOSTANDARD LVCMOS25 [get_ports {Dip_switch_0[0]}]
#set_property DIFF_TERM FALSE [get_ports {Dip_switch_0[0]}]
#set_property PACKAGE_PIN F22 [get_ports {Dip_switch_0[0]}]



#set_false_path -from [get_pins {design_1_i/axi_gpio_0/U0/gpio_core_1/Dual.gpio2_Data_Out_reg[0]/C}] -to [get_pins {design_1_i/trng_control_0/inst/shift_reg_reg[127]/D}]
#set_false_path -from [get_pins {design_1_i/axi_gpio_0/U0/gpio_core_1/Dual.gpio2_Data_Out_reg[0]/C}] -to [get_pins {design_1_i/c_shift_ram_0/U0/i_synth/i_bb_inst/gen_output_regs.output_regs/i_no_async_controls.output_reg[1]/D}]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk]


set_property IOSTANDARD LVCMOS25 [get_ports {Dip_switch_0[0]}]
set_property DIFF_TERM FALSE [get_ports {Dip_switch_0[0]}]
set_property PACKAGE_PIN F22 [get_ports {Dip_switch_0[0]}]

set_property IOSTANDARD LVCMOS25 [get_ports Dip_switch_output_select]
set_property DIFF_TERM FALSE [get_ports Dip_switch_output_select]
set_property PACKAGE_PIN G22 [get_ports Dip_switch_output_select]

set_property IOSTANDARD LVCMOS25 [get_ports LED1]
set_property DIFF_TERM FALSE [get_ports LED1]
set_property PACKAGE_PIN T21 [get_ports LED1]

set_property IOSTANDARD LVCMOS25 [get_ports trng_output[0]]
set_property DIFF_TERM FALSE [get_ports trng_output[0]]
set_property PACKAGE_PIN V22 [get_ports trng_output[0]] 

set_property IOSTANDARD LVCMOS25 [get_ports lfsr_output]
set_property DIFF_TERM FALSE [get_ports lfsr_output]
set_property PACKAGE_PIN W22 [get_ports lfsr_output]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[0]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[0]]
set_property PACKAGE_PIN M15 [get_ports DIP_CLOCKS_TO_LOAD[0]]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[1]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[1]]
set_property PACKAGE_PIN H17 [get_ports DIP_CLOCKS_TO_LOAD[1]]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[2]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[2]]
set_property PACKAGE_PIN H18 [get_ports DIP_CLOCKS_TO_LOAD[2]]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[3]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[3]]
set_property PACKAGE_PIN H19 [get_ports DIP_CLOCKS_TO_LOAD[3]]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[4]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[4]]
set_property PACKAGE_PIN F21 [get_ports DIP_CLOCKS_TO_LOAD[4]]

set_property IOSTANDARD LVCMOS25 [get_ports DIP_CLOCKS_TO_LOAD[5]]
set_property DIFF_TERM FALSE [get_ports DIP_CLOCKS_TO_LOAD[5]]
set_property PACKAGE_PIN H22 [get_ports DIP_CLOCKS_TO_LOAD[5]]





set_false_path -from [get_pins {design_1_i/axi_gpio_0/U0/gpio_core_1/Dual.gpio2_Data_Out_reg[0]/C}] -to [get_pins {design_1_i/trng_control_1/inst/*/D}]
#set_false_path -from [get_pins {design_1_i/axi_gpio_0/U0/gpio_core_1/Dual.gpio2_Data_Out_reg[0]/C}] -to [get_pins {design_1_i/c_shift_ram_0/U0/i_synth/i_bb_inst/gen_output_regs.output_regs/i_no_async_controls.output_reg[1]/D}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]




########BD  interface properties #################

#set_property CONFIG.MASTER_TYPE BRAM_CTRL [get_bd_intf_pins bram]



########BD  interface properties #################