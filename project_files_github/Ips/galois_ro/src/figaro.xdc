set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#100Mhz
#create_clock -period 10 -name clk -add [get_ports clk]
#create_clock -period 20.833 -name channel_y_clk_p -add [get_ports channel_y_clk_p]
#create_clock -period 20.833 -name channel_z_clk_p -add [get_ports channel_z_clk_p]


create_clock -period 5.00000000000000000 -name diff_clk_p -add [get_ports diff_clk_p]
set_property IOSTANDARD LVDS [get_ports diff_clk_p]
set_property DIFF_TERM TRUE [get_ports diff_clk_p]
set_property PACKAGE_PIN L4 [get_ports diff_clk_n]
set_property IOSTANDARD LVDS [get_ports diff_clk_n]
set_property DIFF_TERM TRUE [get_ports diff_clk_n]


#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#set_property PACKAGE_PIN Y10 [get_ports clk]


set_property PACKAGE_PIN AE26 [get_ports enable]
set_property IOSTANDARD LVCMOS25 [get_ports enable]



set_property IOSTANDARD LVCMOS18 [get_ports sampled_output]
set_property PACKAGE_PIN E6 [get_ports sampled_output]