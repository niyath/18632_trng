`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:36:28 04/09/2016
// Design Name:   galois_ro
// Module Name:   /home/akashyap/hw_sec/trng/garo_tb.v
// Project Name:  trng
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: galois_ro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module figaro_tb;

	// Inputs
	reg ro_enable;
	

	// Outputs
	wire ro_out;

		// Outputs
	wire fibonacci_ro_out;
	reg  enable;


    reg clk_p;
    wire clk_n ;
    
    initial begin
    
    clk_p =0;
    forever #5 clk_p= ~clk_p;
    end
    
    wire sampled_output;
   
       assign clk_n =~clk_p;
    
    figaro_top dut (.diff_clk_p(clk_p),.diff_clk_n(clk_n),.enable, .sampled_output);
        
        
	
	
	initial begin
		// Initialize Inputs
		
	   enable=0;
           
     	// Wait 100 ns for global reset to finish
		#200;
     
	   enable=1;
		// Add stimulus here

	end
      
endmodule

