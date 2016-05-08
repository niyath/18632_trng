`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMU
// Engineer: Abhijith Kashyap
// 
// Create Date:    22:53:14 04/03/2016 
// Design Name: 
// Module Name:    lfsr_filter 
// Project Name: 	 trng
// Target Devices: 
// Tool versions: 
// Description: 128 bit Maximal length LFSR used as a filter for the RNG
//              Use Galois LFSR with polynomial (128,127,126,121)
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lfsr_filter(
    input clk,
    input rstn,
    input [127:0] p_load,
    input load,
    input en,
    output s_out
    );

    genvar i;

    wire    [127:0] d_wire;
    wire    [127:0] q_wire;


    generate
    for (i=0; i<128; i=i+1) 
    begin : lfsr_reg
        if (i==126 || i==125 || i==120) //lfsr taps - 1
            assign d_wire[i] = q_wire[i+1] ^ q_wire[0];
        else
            assign d_wire[i] = q_wire[(i+1)%128]; //d_wire[127] = q_wire[0];

        load_en_dff U(
            .clk(clk),
            .rstn(rstn),
            .load(load),
            .en(en),
            .load_d(p_load[i]),
            .d(d_wire[i]),
            .q(q_wire[i])
        );
    end
    endgenerate

    assign s_out = q_wire[0];


endmodule
