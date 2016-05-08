`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2016 05:22:13 PM
// Design Name: 
// Module Name: tb
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


module tb();
    
    
      logic clk;
      logic rstn;
      logic [127:0] p_load;
      logic load;
      logic en;
      logic  s_out;
     

	  lfsr_filter dut(.*);


	  initial begin
		clk =0;

		forever
		#5 clk =~clk;
	end

	  initial begin
		en  =0;
	    rstn =0;
		
		#50 rstn =1;
		en=1;
	end


	initial begin 
        load =0;
		#100 
		load =1;
		p_load = 128'h aaaa5555;

		#10 load =0;
        
	end

	initial begin
		#100000
		$finish;
	end


endmodule
