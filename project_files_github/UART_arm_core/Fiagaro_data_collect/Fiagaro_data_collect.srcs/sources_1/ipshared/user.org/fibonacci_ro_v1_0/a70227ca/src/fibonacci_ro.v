`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2016 07:32:09 PM
// Design Name: 
// Module Name: fibonacci_ro
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps


//1 + x2 + x4 + x5 + x12 + x13 + x15 + x16 + x18 + x20
//

//module fibonacci_ro (enable, w1, w2, w3);
// (* dont_touch = "yes" *)    input enable;
// (* dont_touch = "yes" *)   output w1, w2, w3;
// (* dont_touch = "yes" *)   wire w4;

//    and (w4, enable, w3);
//    not #2(w2, w1);
//    not #2(w3, w2);
//    not #2(w1, w4);
//endmodule




module fibonacci_ro(input enable, 
(* dont_touch = "yes" *)    output fibonacci_ro_out);

//  parameter FIBONACCI_POLYNOMIAL = 3'b001; 
	//parameter FIBONACCI_POLYNOMIAL = 21'b010110000001101101010;

	localparam integer XOR_POS[0:8] ={2,4,5,12,13,15,16,18,20}; 
//    localparam [7:0] XOR_POS[0:7] ={2,4,5,12,13,15,16,18};
	localparam XOR_LENGTH = 8;
	localparam LENGTH =20;

//(* dont_touch = "yes" *)	output  fibonacci_ro_out;
(* dont_touch = "yes" *)	wire [0:LENGTH]  fib_osc;
//(* dont_touch = "yes" *)
	wire temp_xor [0:XOR_LENGTH];
	wire[0:LENGTH-2] fib_polynomial;

//	assign fib_polynomial = FIBONACCI_POLYNOMIAL;

	
	assign temp_xor[XOR_LENGTH] = fib_osc[LENGTH];
	


	assign fib_osc[0] = temp_xor[0] & enable;
	assign fibonacci_ro_out = fib_osc[LENGTH];


	genvar i;

	generate 
		for (i=0;i<LENGTH;i=i+1)
		begin
			fibonacci_ro_inv#(.INVERTER_SIZE(5)) inst( fib_osc[i], fib_osc[i+1]);
		end
	endgenerate


wire[5:0] somma;

assign somma = XOR_POS[XOR_LENGTH -1];

genvar prev;


//	parameter integer PARAM_ARRAY[8:0] ={2,4,5,12,13,15,16,18}; 
	generate 
		for (i=XOR_LENGTH-1;i>=0; i= i-1)
		begin
			xor(temp_xor[i],temp_xor[i+1],fib_osc[XOR_POS[i]]);
		end
	endgenerate 


endmodule 


module fibonacci_ro_inv( input I , output not_I);

	parameter INVERTER_SIZE =5 ;

	genvar i ;


(* dont_touch = "yes" *)	wire [INVERTER_SIZE:0] temp_inv ;


	assign temp_inv[0] =I;
	assign not_I = temp_inv[INVERTER_SIZE];


	generate
		for (i= 0; i<INVERTER_SIZE ; i=i+1)
		begin 
			not(temp_inv[i+1],temp_inv[i]);
		end

	endgenerate
	


endmodule
