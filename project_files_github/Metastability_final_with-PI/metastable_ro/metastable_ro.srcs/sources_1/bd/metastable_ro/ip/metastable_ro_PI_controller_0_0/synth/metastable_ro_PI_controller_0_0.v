// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:PI_controller:1.0
// IP Revision: 2

(* X_CORE_INFO = "PI_controller,Vivado 2014.4" *)
(* CHECK_LICENSE_TYPE = "metastable_ro_PI_controller_0_0,PI_controller,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module metastable_ro_PI_controller_0_0 (
  clk,
  rstn,
  data_in,
  clk_coarse_delay_ctrl,
  data_coarse_delay_ctrl,
  delay_update,
  locked
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 signal_clock CLK" *)
input wire clk;
input wire rstn;
input wire data_in;
output wire [5 : 0] clk_coarse_delay_ctrl;
output wire [5 : 0] data_coarse_delay_ctrl;
output wire delay_update;
output wire locked;

  PI_controller #(
    .DL_LENGTH(64),
    .DL_CODE_WIDTH(6),
    .PD_SR_WIDTH(8),
    .PD_COUNT_W(4),
    .AVG_WIDTH(5)
  ) inst (
    .clk(clk),
    .rstn(rstn),
    .data_in(data_in),
    .clk_coarse_delay_ctrl(clk_coarse_delay_ctrl),
    .data_coarse_delay_ctrl(data_coarse_delay_ctrl),
    .delay_update(delay_update),
    .locked(locked)
  );
endmodule
