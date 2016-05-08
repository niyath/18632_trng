`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2016 05:11:38 PM
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


module tb( );

   parameter COARSE_DELAY_LENGTH = 32;
    parameter FINE_DELAY_LENGTH = 32;
    logic input_data;
    logic registered_data;
    logic [FINE_DELAY_LENGTH-1:0] clk_fine_delay_control_bits;
    logic [COARSE_DELAY_LENGTH-1:0] clk_coarse_delay_control_bits;
    logic [FINE_DELAY_LENGTH-1:0] data_fine_delay_control_bits;
     logic [COARSE_DELAY_LENGTH-1:0] data_coarse_delay_control_bits;
     logic coarse_data_out;
    
    
    delay_top d1(.*);
    
    initial begin
        clk_fine_delay_control_bits =4;
        data_coarse_delay_control_bits =4;
        data_fine_delay_control_bits =4;
        clk_coarse_delay_control_bits =4;
        
        input_data=0;
        forever #5 input_data= ~input_data;
    end
   
endmodule
