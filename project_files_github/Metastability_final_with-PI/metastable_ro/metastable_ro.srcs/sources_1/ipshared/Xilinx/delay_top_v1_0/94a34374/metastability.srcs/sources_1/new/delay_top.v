`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2016 03:58:43 PM
// Design Name: 
// Module Name: coarse_delay_element
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

module delay_top(input_data, clk_fine_delay_control_bits,data_fine_delay_control_bits , clk_coarse_delay_control_bits,data_coarse_delay_control_bits,registered_data,registered_negedge_data);
    parameter COARSE_DELAY_LENGTH = 32;
    parameter FINE_DELAY_LENGTH = 32;
    parameter FINE_DELAY_ON =0 ; 
    input input_data;
    output registered_data;
    output registered_negedge_data;
    input [FINE_DELAY_LENGTH-1:0] clk_fine_delay_control_bits;
    input [COARSE_DELAY_LENGTH-1:0] clk_coarse_delay_control_bits;
    input [FINE_DELAY_LENGTH-1:0] data_fine_delay_control_bits;
    input [COARSE_DELAY_LENGTH-1:0] data_coarse_delay_control_bits;

(* dont_touch = "yes" *)	wire [FINE_DELAY_LENGTH-1:0] clk_fine_delay_control_bits_w;
(* dont_touch = "yes" *)    wire [COARSE_DELAY_LENGTH-1:0] clk_coarse_delay_control_bits_w;
  (* dont_touch = "yes" *)  wire [FINE_DELAY_LENGTH-1:0] data_fine_delay_control_bits_w;
 (* dont_touch = "yes" *)   wire [COARSE_DELAY_LENGTH-1:0] data_coarse_delay_control_bits_w;
 	
	assign clk_fine_delay_control_bits_w = (1 << (clk_fine_delay_control_bits)) -1;
	assign clk_coarse_delay_control_bits_w = (1 << (clk_coarse_delay_control_bits)) -1;
	assign data_coarse_delay_control_bits_w = (1 << (data_coarse_delay_control_bits)) -1;
	assign data_fine_delay_control_bits_w = (1 << (data_fine_delay_control_bits)) -1;

//     (* dont_touch = "yes" *)   wire input_data_buf;
     
//   LUT1 #(
//     .INIT(2'b10) // Specify LUT Contents
//     ) LUT1_input_buf_anchor (
//     .O(input_data_buf), // LUT general output
//     .I0(input_data));  

 (* dont_touch = "yes" *)   wire coarse_data_out;
 (* dont_touch = "yes" *)   wire coarse_clk_out;
    
 (* dont_touch = "yes" *)   wire fine_data_out;
 (* dont_touch = "yes" *)   wire fine_clk_out;

 (* dont_touch = "yes" *)   coarse_delay_element#(.COARSE_DELAY_LENGTH(COARSE_DELAY_LENGTH)) coarse_delay_inst(
        .inp_data(input_data),
        .clk_delay_control_bits(clk_coarse_delay_control_bits_w),
	    .data_delay_control_bits(data_coarse_delay_control_bits_w),
        .delayed_clk(coarse_clk_out),
        .delayed_data(coarse_data_out));

(* dont_touch = "yes" *)    reg registered_out,registered_negedge_out;

	generate 
		if( FINE_DELAY_ON ==1 ) 
		begin
            fine_delay_element#(.FINE_DELAY_LENGTH(FINE_DELAY_LENGTH)) fine_delay_inst(
            .inp_data(coarse_data_out),
            .clk_data(coarse_clk_out),
            .clk_delay_control_bits(clk_fine_delay_control_bits_w),
            .data_delay_control_bits(data_fine_delay_control_bits_w),
            .delayed_clk(fine_clk_out),
            .delayed_data(fine_data_out));

            always@(posedge fine_clk_out)
    	    begin
        	   registered_out <= fine_data_out;
   		    end
   		    always@(negedge fine_clk_out)
            begin
              registered_negedge_out <= fine_data_out;
            end
	    end
 	    else begin
		  always@(posedge coarse_clk_out)
    	  begin
        	registered_out <= coarse_data_out;
        	
   		  end
   		   always@(negedge coarse_clk_out)
           begin
              registered_negedge_out <= coarse_data_out;
           end
   		end
	endgenerate 
    assign registered_negedge_data = registered_negedge_out;
    assign registered_data= registered_out;
endmodule


(* dont_touch = "yes" *)module coarse_delay_element( inp_data,clk_delay_control_bits,data_delay_control_bits,delayed_clk,delayed_data);

        parameter COARSE_DELAY_LENGTH = 32;
		input inp_data;
		input [COARSE_DELAY_LENGTH -1 :0]clk_delay_control_bits;
		input [COARSE_DELAY_LENGTH -1 :0]data_delay_control_bits;
		output delayed_clk;
		output delayed_data;
        genvar i;
        
// (* dont_touch = "yes" *) 
wire [COARSE_DELAY_LENGTH:0] delay_data;
        assign delay_data[COARSE_DELAY_LENGTH]= inp_data;
        assign delayed_data= delay_data[0];
        
        generate 
            for(i=COARSE_DELAY_LENGTH-1; i>=0;i =i-1)
            begin
                lut_coarse_delay_element lut_coarse_delay_inst_data(data_delay_control_bits[i],delay_data[i+1],delay_data[i]);
            end
        endgenerate
        
        
 //(* dont_touch = "yes" *)  
 wire [COARSE_DELAY_LENGTH:0] delay_clk;
        assign delay_clk[COARSE_DELAY_LENGTH]= inp_data;
        
        assign delayed_clk= delay_clk[0];
        
        
        generate 
            for(i=COARSE_DELAY_LENGTH-1; i>=0;i =i-1)
            begin
                lut_coarse_delay_element lut_coarse_delay_inst_clk(clk_delay_control_bits[i],delay_clk[i+1],delay_clk[i]);
            end
        endgenerate


endmodule 

(* dont_touch = "yes" *)module fine_delay_element(inp_data,clk_data,clk_delay_control_bits, data_delay_control_bits, delayed_clk,delayed_data);

        parameter FINE_DELAY_LENGTH = 32;
		input inp_data;
		input clk_data;
		input [FINE_DELAY_LENGTH -1 :0]clk_delay_control_bits;
		input [FINE_DELAY_LENGTH -1 :0]data_delay_control_bits;
		output delayed_clk;
		output delayed_data;

        genvar i;
        
 (* dont_touch = "yes" *)       wire [FINE_DELAY_LENGTH:0] delay_data;
        assign delay_data[FINE_DELAY_LENGTH]= inp_data;
        assign delayed_data= delay_data[0];
        
        generate 
            for(i=FINE_DELAY_LENGTH-1; i>=0;i =i-1)
            begin
            (* dont_touch = "yes" *)    lut_fine_delay_element lut_fine_delay_inst_data(data_delay_control_bits[i],delay_data[i+1],delay_data[i]);
            end
        endgenerate
        
        
(* dont_touch = "yes" *)        wire [FINE_DELAY_LENGTH:0] delay_clk;
        assign delay_clk[FINE_DELAY_LENGTH]= clk_data;
        
        assign delayed_clk= delay_clk[0];
        
        
        generate 
            for(i=FINE_DELAY_LENGTH-1; i>=0;i =i-1)
            begin
            (* dont_touch = "yes" *)    lut_fine_delay_element lut_fine_delay_inst_clk(clk_delay_control_bits[i],delay_clk[i+1],delay_clk[i]);
            end
        endgenerate
        

endmodule 


(* dont_touch = "yes" *)module lut_coarse_delay_element(input delay_control_bit ,input data, output inv_data  );

LUT6 #(
.INIT(64'h5555555555555555) // Specify LUT Contents
) LUT6_inst (
.O(inv_data), // LUT general output
.I0(data), // LUT input // - 
.I1(delay_control_bit), // LUT input
.I2(delay_control_bit), // LUT input
.I3(delay_control_bit), // LUT input
.I4(delay_control_bit), // LUT input
.I5(delay_control_bit) // LUT input
);

endmodule




(* dont_touch = "yes" *)module lut_fine_delay_element(input delay_control_bit ,input data, output inv_data  );

LUT6 #(
.INIT(64'h5555555555555555) // Specify LUT Contents
) LUT6_inst (
.O(inv_data), // LUT general output
.I0(data), // LUT input // - 
.I1(delay_control_bit), // LUT input
.I2(1'b0), // LUT input
.I3(1'b0), // LUT input
.I4(1'b0), // LUT input
.I5(1'b0) // LUT input
);

endmodule
