set_property IOSTANDARD LVCMOS25 [get_ports {LED0_T22[0]}]
set_property DIFF_TERM FALSE [get_ports {LED0_T22[0]}]
set_property PACKAGE_PIN T22 [get_ports {LED0_T22[0]}]


set_property IOSTANDARD LVCMOS25 [get_ports registered_data_LED2_u21]
set_property DIFF_TERM FALSE [get_ports registered_data_LED2_u21]
set_property PACKAGE_PIN U21 [get_ports registered_data_LED2_u21]




#set_false_path -from [get_clocks clk_out1_metastable_ro_clk_wiz_0_0] -to [get_clocks clk_fpga_0]
#set_false_path -from [get_pins metastable_ro_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0] -to [get_pins metastable_ro_i/delay_top_0/inst/registered_out_reg/D]

