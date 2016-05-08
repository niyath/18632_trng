
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:1.2 [current_project]


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set Dip_switch_0 [ create_bd_port -dir I -from 0 -to 0 Dip_switch_0 ]
  set Dip_switch_output_select [ create_bd_port -dir I Dip_switch_output_select ]
  set LED1 [ create_bd_port -dir O -from 0 -to 0 LED1 ]
  set lfsr_output [ create_bd_port -dir O lfsr_output ]
  set trng_output [ create_bd_port -dir O -from 0 -to 0 -type data trng_output ]

  # Create instance: Dip_switch_TRNG, and set properties
  set Dip_switch_TRNG [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 Dip_switch_TRNG ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $Dip_switch_TRNG

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]
  set_property -dict [ list CONFIG.SINGLE_PORT_BRAM {1}  ] $axi_bram_ctrl_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_DOUT_DEFAULT_2 {0x00000000} CONFIG.C_GPIO2_WIDTH {1} CONFIG.C_GPIO_WIDTH {1} CONFIG.C_INTERRUPT_PRESENT {1} CONFIG.C_IS_DUAL {1}  ] $axi_gpio_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list CONFIG.NUM_MI {3} CONFIG.NUM_SI {2}  ] $axi_mem_intercon

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 blk_mem_gen_0 ]
  set_property -dict [ list CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Use_RSTB_Pin {true}  ] $blk_mem_gen_0

  # Create instance: bram_control_0, and set properties
  set bram_control_0 [ create_bd_cell -type ip -vlnv user.org:user:bram_control:1.0 bram_control_0 ]
  set_property -dict [ list CONFIG.BRAM_DEPTH {2048}  ] $bram_control_0

  # Create instance: bram_reset_or, and set properties
  set bram_reset_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 bram_reset_or ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $bram_reset_or

  # Create instance: fibonacci_ro_0, and set properties
  set fibonacci_ro_0 [ create_bd_cell -type ip -vlnv user.org:user:fibonacci_ro:1.0 fibonacci_ro_0 ]

  # Create instance: galois_ro_0, and set properties
  set galois_ro_0 [ create_bd_cell -type ip -vlnv user.org:user:galois_ro:1.0 galois_ro_0 ]

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:5.0 ila_0 ]
  set_property -dict [ list CONFIG.ALL_PROBE_SAME_MU_CNT {2} \
CONFIG.C_ADV_TRIGGER {true} CONFIG.C_ENABLE_ILA_AXI_MON {false} \
CONFIG.C_EN_STRG_QUAL {1} CONFIG.C_INPUT_PIPE_STAGES {2} \
CONFIG.C_MONITOR_TYPE {Native} CONFIG.C_NUM_OF_PROBES {12} \
CONFIG.C_PROBE0_MU_CNT {2} CONFIG.C_PROBE10_MU_CNT {2} \
CONFIG.C_PROBE11_MU_CNT {2} CONFIG.C_PROBE12_MU_CNT {2} \
CONFIG.C_PROBE12_WIDTH {1} CONFIG.C_PROBE13_MU_CNT {2} \
CONFIG.C_PROBE14_MU_CNT {2} CONFIG.C_PROBE1_MU_CNT {2} \
CONFIG.C_PROBE2_MU_CNT {2} CONFIG.C_PROBE3_MU_CNT {2} \
CONFIG.C_PROBE4_MU_CNT {2} CONFIG.C_PROBE5_MU_CNT {2} \
CONFIG.C_PROBE6_MU_CNT {2} CONFIG.C_PROBE7_MU_CNT {2} \
CONFIG.C_PROBE7_WIDTH {1} CONFIG.C_PROBE8_MU_CNT {2} \
CONFIG.C_PROBE9_MU_CNT {2}  ] $ila_0

  # Create instance: lfsr_filter_0, and set properties
  set lfsr_filter_0 [ create_bd_cell -type ip -vlnv user.org:user:lfsr_filter:1.0 lfsr_filter_0 ]

  # Create instance: mux_or, and set properties
  set mux_or [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 mux_or ]
  set_property -dict [ list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1}  ] $mux_or

  # Create instance: not_gate, and set properties
  set not_gate [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 not_gate ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $not_gate

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100.000000} CONFIG.PCW_IRQ_F2P_INTR {1} CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.preset {ZedBoard*}  ] $processing_system7_0

  # Create instance: raw_trng, and set properties
  set raw_trng [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_shift_ram:12.0 raw_trng ]
  set_property -dict [ list CONFIG.AsyncInitVal {0} CONFIG.DefaultData {0} CONFIG.Depth {1} CONFIG.Width {1}  ] $raw_trng

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: select_LFSR, and set properties
  set select_LFSR [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 select_LFSR ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $select_LFSR

  # Create instance: select_RAW_TRNG, and set properties
  set select_RAW_TRNG [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 select_RAW_TRNG ]
  set_property -dict [ list CONFIG.C_SIZE {1}  ] $select_RAW_TRNG

  # Create instance: trng_control_0, and set properties
  set trng_control_0 [ create_bd_cell -type ip -vlnv user.org:user:trng_control:1.0 trng_control_0 ]

  # Create instance: uart_complete_inv, and set properties
  set uart_complete_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 uart_complete_inv ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $uart_complete_inv

  # Create instance: xor_gate, and set properties
  set xor_gate [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 xor_gate ]
  set_property -dict [ list CONFIG.C_OPERATION {xor} CONFIG.C_SIZE {1}  ] $xor_gate

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M01_AXI]
  connect_bd_intf_net -intf_net bram_control_0_bram [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB] [get_bd_intf_pins bram_control_0/bram]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net Dip_switch_output_select_1 [get_bd_ports Dip_switch_output_select] [get_bd_pins Dip_switch_TRNG/Op1] [get_bd_pins select_RAW_TRNG/Op1]
  connect_bd_net -net Op1_1 [get_bd_ports Dip_switch_0] [get_bd_ports LED1] [get_bd_pins fibonacci_ro_0/enable] [get_bd_pins galois_ro_0/ro_enable] [get_bd_pins ila_0/probe1]
  connect_bd_net -net axi_gpio_0_gpio2_io_o [get_bd_pins axi_gpio_0/gpio2_io_o] [get_bd_pins bram_reset_or/Op1] [get_bd_pins ila_0/probe2] [get_bd_pins uart_complete_inv/Op1]
  connect_bd_net -net axi_gpio_0_ip2intc_irpt [get_bd_pins axi_gpio_0/ip2intc_irpt] [get_bd_pins ila_0/probe8] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net bram_control_0_bram_full [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins bram_control_0/bram_full] [get_bd_pins ila_0/probe4]
  connect_bd_net -net c_shift_ram_0_Q [get_bd_ports trng_output] [get_bd_pins ila_0/probe0] [get_bd_pins raw_trng/Q] [get_bd_pins select_RAW_TRNG/Op2]
  connect_bd_net -net fibonacci_ro_0_fibonacci_ro_out [get_bd_pins fibonacci_ro_0/fibonacci_ro_out] [get_bd_pins xor_gate/Op1]
  connect_bd_net -net galois_ro_0_ro_out [get_bd_pins galois_ro_0/ro_out] [get_bd_pins xor_gate/Op2]
  connect_bd_net -net lfsr_filter_0_s_out [get_bd_ports lfsr_output] [get_bd_pins ila_0/probe3] [get_bd_pins lfsr_filter_0/s_out] [get_bd_pins select_LFSR/Op2]
  connect_bd_net -net not_gate_Res [get_bd_pins bram_reset_or/Op2] [get_bd_pins not_gate/Res]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/M02_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins bram_control_0/clk] [get_bd_pins ila_0/clk] [get_bd_pins lfsr_filter_0/clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins raw_trng/CLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk] [get_bd_pins trng_control_0/clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/M02_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins lfsr_filter_0/rstn] [get_bd_pins not_gate/Op1] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn] [get_bd_pins trng_control_0/rstn]
  connect_bd_net -net trng_control_0_lfsr_load_data [get_bd_pins lfsr_filter_0/p_load] [get_bd_pins trng_control_0/lfsr_load_data]
  connect_bd_net -net trng_control_0_lfsr_load_en [get_bd_pins ila_0/probe6] [get_bd_pins ila_0/probe7] [get_bd_pins lfsr_filter_0/load] [get_bd_pins trng_control_0/lfsr_load_en]
  connect_bd_net -net util_vector_logic_0_Res1 [get_bd_pins Dip_switch_TRNG/Res] [get_bd_pins select_LFSR/Op1]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins ila_0/probe11] [get_bd_pins mux_or/Op2] [get_bd_pins select_LFSR/Res]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins ila_0/probe10] [get_bd_pins mux_or/Op1] [get_bd_pins select_RAW_TRNG/Res]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins bram_control_0/trng_bit_in] [get_bd_pins ila_0/probe9] [get_bd_pins mux_or/Res]
  connect_bd_net -net util_vector_logic_4_Res [get_bd_pins lfsr_filter_0/en] [get_bd_pins uart_complete_inv/Res]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_pins bram_control_0/rst] [get_bd_pins bram_reset_or/Res] [get_bd_pins ila_0/probe5]
  connect_bd_net -net xor_gate_Res [get_bd_pins raw_trng/D] [get_bd_pins trng_control_0/trng_bit_in] [get_bd_pins xor_gate/Res]

  # Create address segments
  create_bd_addr_seg -range 0x2000 -offset 0x40000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


