proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  debug::add_scope template.lib 1
  create_project -in_memory -part xc7z020clg484-1
  set_property board_part em.avnet.com:zed:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.cache/wt [current_project]
  set_property parent.project_path /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.xpr [current_project]
  set_property ip_repo_paths {
  /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.cache/ip
  /home/srihari/Hardware_securiy/Ips
} [current_project]
  set_property ip_output_repo /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.cache/ip [current_project]
  add_files -quiet /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.runs/no_false_path/metastable_ro_wrapper.dcp
  add_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro.bmm
  set_property SCOPED_TO_REF metastable_ro [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/metastable_ro.bmm]
  read_xdc -ref metastable_ro_processing_system7_0_0 -cells inst /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_processing_system7_0_0/metastable_ro_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_processing_system7_0_0/metastable_ro_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_rst_processing_system7_0_100M_0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0_board.xdc]
  read_xdc -ref metastable_ro_rst_processing_system7_0_100M_0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_rst_processing_system7_0_100M_0/metastable_ro_rst_processing_system7_0_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_clk_wiz_0_0 -cells inst /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0_board.xdc]
  read_xdc -ref metastable_ro_clk_wiz_0_0 -cells inst /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_clk_wiz_0_0/metastable_ro_clk_wiz_0_0.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_axi_gpio_1_0 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0_board.xdc]
  read_xdc -ref metastable_ro_axi_gpio_1_0 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_0/metastable_ro_axi_gpio_1_0.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_axi_gpio_0_0 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0_board.xdc]
  read_xdc -ref metastable_ro_axi_gpio_0_0 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_0/metastable_ro_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_axi_gpio_0_2 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2_board.xdc]
  read_xdc -ref metastable_ro_axi_gpio_0_2 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_0_2/metastable_ro_axi_gpio_0_2.xdc]
  read_xdc -prop_thru_buffers -ref metastable_ro_axi_gpio_1_1 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1_board.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1_board.xdc]
  read_xdc -ref metastable_ro_axi_gpio_1_1 -cells U0 /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1.xdc
  set_property processing_order EARLY [get_files /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/sources_1/bd/metastable_ro/ip/metastable_ro_axi_gpio_1_1/metastable_ro_axi_gpio_1_1.xdc]
  read_xdc /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.srcs/constrs_1/new/meta.xdc
  link_design -top metastable_ro_wrapper -part xc7z020clg484-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force metastable_ro_wrapper_opt.dcp
  catch {report_drc -file metastable_ro_wrapper_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force metastable_ro_wrapper_placed.dcp
  catch { report_io -file metastable_ro_wrapper_io_placed.rpt }
  catch { report_clock_utilization -file metastable_ro_wrapper_clock_utilization_placed.rpt }
  catch { report_utilization -file metastable_ro_wrapper_utilization_placed.rpt -pb metastable_ro_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file metastable_ro_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force metastable_ro_wrapper_routed.dcp
  catch { report_drc -file metastable_ro_wrapper_drc_routed.rpt -pb metastable_ro_wrapper_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file metastable_ro_wrapper_timing_summary_routed.rpt -rpx metastable_ro_wrapper_timing_summary_routed.rpx }
  catch { report_power -file metastable_ro_wrapper_power_routed.rpt -pb metastable_ro_wrapper_power_summary_routed.pb }
  catch { report_route_status -file metastable_ro_wrapper_route_status.rpt -pb metastable_ro_wrapper_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force metastable_ro_wrapper.mmi }
  catch { write_bmm -force metastable_ro_wrapper_bd.bmm }
  write_bitstream -force metastable_ro_wrapper.bit 
  if { [file exists /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.runs/no_false_path/metastable_ro_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /home/srihari/Hardware_securiy/Metastability_only_coarse_data_collect/metastable_ro/metastable_ro.runs/no_false_path/metastable_ro_wrapper.hwdef -bitfile metastable_ro_wrapper.bit -meminfo metastable_ro_wrapper.mmi -file metastable_ro_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

