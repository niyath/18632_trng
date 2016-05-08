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


// IP VLNV: user.org:user:bram_control:1.0
// IP Revision: 2

(* X_CORE_INFO = "bram_control,Vivado 2014.4" *)
(* CHECK_LICENSE_TYPE = "metastable_ro_bram_control_0_0,bram_control,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module metastable_ro_bram_control_0_0 (
  clk,
  rst,
  trng_bit_in,
  bram_full,
  bram_rst,
  bram_clk,
  bram_din,
  bram_dout,
  bram_en,
  bram_we,
  bram_addr
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 signal_clock CLK" *)
input wire clk;
input wire rst;
input wire trng_bit_in;
output wire bram_full;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram RST" *)
output wire bram_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram CLK" *)
output wire bram_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram DIN" *)
output wire [31 : 0] bram_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram DOUT" *)
input wire [31 : 0] bram_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram EN" *)
output wire bram_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram WE" *)
output wire [3 : 0] bram_we;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 bram ADDR" *)
output wire [31 : 0] bram_addr;

  bram_control #(
    .DW(32),
    .AW(32),
    .BRAM_DEPTH(2048)
  ) inst (
    .clk(clk),
    .rst(rst),
    .trng_bit_in(trng_bit_in),
    .bram_full(bram_full),
    .bram_rst(bram_rst),
    .bram_clk(bram_clk),
    .bram_din(bram_din),
    .bram_dout(bram_dout),
    .bram_en(bram_en),
    .bram_we(bram_we),
    .bram_addr(bram_addr)
  );
endmodule
