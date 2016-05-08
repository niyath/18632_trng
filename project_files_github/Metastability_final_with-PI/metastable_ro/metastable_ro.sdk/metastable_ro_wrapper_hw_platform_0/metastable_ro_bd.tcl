
################################################################
# This is a generated script based on design: metastable_ro
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
# source metastable_ro_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:1.2 [current_project]


# CHANGE DESIGN NAME HERE
set design_name metastable_ro

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
  set LED0_T22 [ create_bd_port -dir O -from 0 -to 0 LED0_T22 ]
  set registered_data_LED2_u21 [ create_bd_port -dir O registered_data_LED2_u21 ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list CONFIG.C_GPIO_WIDTH {1} CONFIG.GPIO_BOARD_INTERFACE {Custom} CONFIG.USE_BOARD_FLOW {true}  ] $axi_gpio_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKIN1_JITTER_PS {200.0} CONFIG.CLKOUT1_JITTER {279.437} CONFIG.CLKOUT1_PHASE_ERROR {163.327} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10} CONFIG.JITTER_SEL {Min_O_Jitter} CONFIG.PRIM_IN_FREQ {50} CONFIG.RESET_TYPE {ACTIVE_LOW}  ] $clk_wiz_0

  # Create instance: coarse_delay_ctrl, and set properties
  set coarse_delay_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 coarse_delay_ctrl ]
  set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1}  ] $coarse_delay_ctrl

  # Create instance: delay_top_0, and set properties
  set delay_top_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:delay_top:1.0 delay_top_0 ]

  # Create instance: fine_delay_ctrl, and set properties
  set fine_delay_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 fine_delay_ctrl ]
  set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1}  ] $fine_delay_ctrl

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {50} CONFIG.preset {ZedBoard*}  ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {3}  ] $processing_system7_0_axi_periph

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create interface connections
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins fine_delay_ctrl/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins coarse_delay_ctrl/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI]

  # Create port connections
  connect_bd_net -net axi_gpio_0_gpio2_io_o [get_bd_pins delay_top_0/data_fine_delay_control_bits] [get_bd_pins fine_delay_ctrl/gpio2_io_o]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins delay_top_0/clk_fine_delay_control_bits] [get_bd_pins fine_delay_ctrl/gpio_io_o]
  connect_bd_net -net axi_gpio_0_gpio_io_o1 [get_bd_ports LED0_T22] [get_bd_pins axi_gpio_0/gpio_io_o]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins delay_top_0/input_data]
  connect_bd_net -net coarse_delay_ctrl_gpio2_io_o [get_bd_pins coarse_delay_ctrl/gpio2_io_o] [get_bd_pins delay_top_0/data_coarse_delay_control_bits]
  connect_bd_net -net coarse_delay_ctrl_gpio_io_o [get_bd_pins coarse_delay_ctrl/gpio_io_o] [get_bd_pins delay_top_0/clk_coarse_delay_control_bits]
  connect_bd_net -net delay_top_0_registered_data [get_bd_ports registered_data_LED2_u21] [get_bd_pins delay_top_0/registered_data]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins coarse_delay_ctrl/s_axi_aclk] [get_bd_pins fine_delay_ctrl/s_axi_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins processing_system7_0/FCLK_CLK1]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins clk_wiz_0/resetn] [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins coarse_delay_ctrl/s_axi_aresetn] [get_bd_pins fine_delay_ctrl/s_axi_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs fine_delay_ctrl/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41220000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg1
  create_bd_addr_seg -range 0x10000 -offset 0x41210000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs coarse_delay_ctrl/S_AXI/Reg] SEG_coarse_delay_ctrl_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


