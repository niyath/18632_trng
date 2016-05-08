set_property SRC_FILE_INFO {cfile:/home/srihari/Hardware_securiy/Metastability_RO/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_processing_system7_0_0/metastable_ro_processing_system7_0_0.xdc rfile:../../../metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_processing_system7_0_0/metastable_ro_processing_system7_0_0.xdc id:1 order:EARLY scoped_inst:metastable_ro_i/processing_system7_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/srihari/Hardware_securiy/Metastability_RO/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0.xdc rfile:../../../metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0.xdc id:2 order:EARLY scoped_inst:metastable_ro_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/srihari/Hardware_securiy/Metastability_RO/metastable_ro/metastable_ro.srcs/constrs_1/new/meta.xdc rfile:../../../metastable_ro.srcs/constrs_1/new/meta.xdc id:3} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_1 0.6
set_property src_info {type:SCOPED_XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter clk_fpga_0 0.3
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.20000000000000001
set_property src_info {type:XDC file:3 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_clocks clk_out1_metastable_ro_clk_wiz_0_0] -to [get_clocks clk_fpga_0]
set_property src_info {type:XDC file:3 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:3 line:18 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets clk]
