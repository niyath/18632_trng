`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2016 01:26:16 PM
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


module tb(

    );
    
    
   
           logic clk;
           logic rstn;
    
            logic  trng_bit_in;
            logic [127:0] lfsr_load_data;
            logic lfsr_load_en;
            logic [15:0] shifter_load_data;
            trng_control dut (.*);
            initial begin 
            
            rstn=0;
            #100 rstn =1 ;
            end
            
            
            initial begin 
                        shifter_load_data = 15;
                        clk=0;
                        forever #5 clk =~clk;
            end
            
            always @(posedge clk)
            begin
                trng_bit_in <= $random;
            end           
    
endmodule
