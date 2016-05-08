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
set_msg_config -id {HDL-1065} -limit 10000

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  open_checkpoint design_1_wrapper_routed.dcp
  set_property webtalk.parent_dir /home/srihari/Hardware_securiy/UART_arm_core/Fiagaro_data_collect/Fiagaro_data_collect.cache/wt [current_project]
  set src_rc [catch { 
    puts "source /home/srihari/Hardware_securiy/UART_arm_core/bit_allow_loops.tcl"
    source /home/srihari/Hardware_securiy/UART_arm_core/bit_allow_loops.tcl
  } _RESULT] 
  if {$src_rc} { 
    send_msg_id runtcl-1 error "$_RESULT"
    send_msg_id runtcl-2 error "sourcing script /home/srihari/Hardware_securiy/UART_arm_core/bit_allow_loops.tcl failed"
    return -code error
  }
  catch { write_mem_info -force design_1_wrapper.mmi }
  catch { write_bmm -force design_1_wrapper_bd.bmm }
  write_bitstream -force design_1_wrapper.bit 
  if { [file exists /home/srihari/Hardware_securiy/UART_arm_core/Fiagaro_data_collect/Fiagaro_data_collect.runs/de_bias_synth/design_1_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /home/srihari/Hardware_securiy/UART_arm_core/Fiagaro_data_collect/Fiagaro_data_collect.runs/de_bias_synth/design_1_wrapper.hwdef -bitfile design_1_wrapper.bit -meminfo design_1_wrapper.mmi -file design_1_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

