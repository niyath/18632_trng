//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (lin64) Build 1071353 Tue Nov 18 16:47:07 MST 2014
//Date        : Sun May  1 18:40:55 2016
//Host        : srihari running 64-bit Ubuntu 14.04.4 LTS
//Command     : generate_target metastable_ro_wrapper.bd
//Design      : metastable_ro_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module metastable_ro_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    DIP_CLOCKS_TO_LOAD,
    Data_output_select,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    LED0_T22,
    PI_orARM_Core,
    enable_bram_interrupt,
    registered_data_LED2_u21,
    registered_negedge_U14,
    uart_complete_led_G22);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  input [4:0]DIP_CLOCKS_TO_LOAD;
  input [0:0]Data_output_select;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [0:0]LED0_T22;
  input [0:0]PI_orARM_Core;
  input [0:0]enable_bram_interrupt;
  output registered_data_LED2_u21;
  output registered_negedge_U14;
  output [0:0]uart_complete_led_G22;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire [4:0]DIP_CLOCKS_TO_LOAD;
  wire [0:0]Data_output_select;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [0:0]LED0_T22;
  wire [0:0]PI_orARM_Core;
  wire [0:0]enable_bram_interrupt;
  wire registered_data_LED2_u21;
  wire registered_negedge_U14;
  wire [0:0]uart_complete_led_G22;

metastable_ro metastable_ro_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .DIP_CLOCKS_TO_LOAD(DIP_CLOCKS_TO_LOAD),
        .Data_output_select(Data_output_select),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .LED0_T22(LED0_T22),
        .PI_orARM_Core(PI_orARM_Core),
        .enable_bram_interrupt(enable_bram_interrupt),
        .registered_data_LED2_u21(registered_data_LED2_u21),
        .registered_negedge_U14(registered_negedge_U14),
        .uart_complete_led_G22(uart_complete_led_G22));
endmodule
