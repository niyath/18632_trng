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
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  debug::add_scope template.lib 1
  open_checkpoint metastable_ro_wrapper_routed.dcp
  set_property webtalk.parent_dir /home/srihari/Hardware_securiy/Metastability_final_with-PI/metastable_ro/metastable_ro.cache/wt [current_project]
  catch { write_mem_info -force metastable_ro_wrapper.mmi }
  catch { write_bmm -force metastable_ro_wrapper_bd.bmm }
  write_bitstream -force metastable_ro_wrapper.bit 
  if { [file exists /home/srihari/Hardware_securiy/Metastability_final_with-PI/metastable_ro/metastable_ro.runs/no_false_path/metastable_ro_wrapper.hwdef] } {
    catch { write_sysdef -hwdef /home/srihari/Hardware_securiy/Metastability_final_with-PI/metastable_ro/metastable_ro.runs/no_false_path/metastable_ro_wrapper.hwdef -bitfile metastable_ro_wrapper.bit -meminfo metastable_ro_wrapper.mmi -file metastable_ro_wrapper.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

