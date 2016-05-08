`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMU
// Engineer: Abhijith Kashyap
// 
// Create Date:    17:56:25 04/08/2016 
// Design Name: 
// Module Name:    galois_ro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Galois ring Oscillator
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module galois_ro(
	 input  ro_enable,
    output ro_out
    );


    genvar i;


 (* DONT_TOUCH = "TRUE" *)     wire    [20:0]  ingress;
 (* DONT_TOUCH = "TRUE" *)     wire    [20:0]  egress;

    generate
    for (i=0; i<21; i=i+1)
    begin : garo
        if (i==2 || i==3 || i==7 || i==16 || i==17 || i==19)
        begin
            garo_inv_xor    U(
                .inv_in(ingress[i]),
                .feedback_in(ro_out),
                .out(egress[i])
            );
        end
        else
        begin
            garo_inv_xor    U(
                .inv_in(ingress[i]),
                .feedback_in(1'b0),
                .out(egress[i])
            );
        end
		  
		  if(i<20)
		  			assign ingress[i] = egress[i+1];
		  else
		            assign ingress[i] = ro_out;
    end
    endgenerate

    assign ro_out = ro_enable ? egress[0] : 1'b0;

endmodule



