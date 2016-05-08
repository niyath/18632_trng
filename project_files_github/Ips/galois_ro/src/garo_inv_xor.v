`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMU
// Engineer: Abhijith Kashyap
// 
// Create Date:    17:44:46 04/08/2016 
// Design Name:    trng
// Module Name:    garo_inv_xor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: building block of Galois ring oscillator
//          |-----|    |-----|    |-----|    |-----|
// inv_in-->| inv |----| inv |----| inv |----| xor |--> out
//          |_____|    |_____|    |_____|    |_____|
//                                              ^
//                                              |
//                                          feedback_in
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module garo_inv_xor(
    input inv_in,
    input feedback_in,
    output out
    );

    wire    inv_stg1_out;
    wire    inv_stg2_out;
    wire    inv_stg3_out;

    INV  inv1(.I(inv_in), .O(inv_stg1_out));
    INV  inv2(.I(inv_stg1_out), .O(inv_stg2_out));
    INV  inv3(.I(inv_stg2_out), .O(inv_stg3_out));


    assign out = inv_stg3_out ^ feedback_in;


endmodule
