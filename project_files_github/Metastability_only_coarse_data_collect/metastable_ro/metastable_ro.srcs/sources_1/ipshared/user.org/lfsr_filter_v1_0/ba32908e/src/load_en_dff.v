`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CMU
// Engineer: Abhijith Kashyap
// 
// Create Date:    23:17:19 04/03/2016 
// Design Name:    
// Module Name:    load_en_dff 
// Project Name:    trng
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module load_en_dff(
    input clk,
    input rstn,
    input load,
    input en,
    input load_d,
    input d,
    output q
    );

    reg q_reg;

    always @(posedge clk or negedge rstn)
    begin
        if (rstn == 0)
            q_reg <= 0;
        else 
        begin
            if (load == 1)
                q_reg <= load_d;
            else
            begin
                if (en == 1)
                    q_reg <= d;
            end
        end
    end

    assign q = q_reg;


endmodule
