# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7z020clg484-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.cache/wt [current_project]
set_property parent.project_path /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.2 [current_project]
set_property ip_repo_paths /home/srihari/Hardware_securiy/Ips [current_project]
add_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro.bd
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_processing_system7_0_0/metastable_ro_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_xbar_0/metastable_ro_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_blk_mem_gen_0_0/metastable_ro_blk_mem_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_bram_ctrl_0_0/metastable_ro_axi_bram_ctrl_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_auto_pc_0/metastable_ro_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_auto_pc_1/metastable_ro_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_auto_pc_2/metastable_ro_auto_pc_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_auto_pc_3/metastable_ro_auto_pc_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_auto_pc_4/metastable_ro_auto_pc_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro_ooc.xdc]
set_property is_locked true [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro.bd]

read_verilog -library xil_defaultlib /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/imports/hdl/metastable_ro_wrapper.v
read_xdc /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/constrs_1/new/meta.xdc
set_property used_in_implementation false [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/constrs_1/new/meta.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file metastable_ro_wrapper.hwdef }
synth_design -top metastable_ro_wrapper -part xc7z020clg484-1
write_checkpoint -noxdef metastable_ro_wrapper.dcp
catch { report_utilization -file metastable_ro_wrapper_utilization_synth.rpt -pb metastable_ro_wrapper_utilization_synth.pb }
