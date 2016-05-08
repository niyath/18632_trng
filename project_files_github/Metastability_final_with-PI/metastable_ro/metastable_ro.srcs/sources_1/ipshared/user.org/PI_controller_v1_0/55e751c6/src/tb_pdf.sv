`timescale 1ps/1ps

module tb_pdf();

    logic clk;
    logic clk2;
    logic rstn;
    logic data_in;
    logic clk_in;
    logic [4:0]	 clk_coarse_delay_ctrl ;
	logic [4:0] clk_fine_delay_ctrl;
	logic [4:0] data_coarse_delay_ctrl;
	logic [4:0] data_fine_delay_ctrl;
    logic [4:0] delay_update;
    wire  [4:0] delay_code;
 //   wire    delay_update;
    wire    locked;

    PI_controller dut(
        clk,
        rstn,
        data_in,
        clk_in,
     //   delay_code,
        delay_update,
        locked,
        clk_coarse_delay_ctrl ,
        clk_fine_delay_ctrl,
        data_coarse_delay_ctrl,
        data_fine_delay_ctrl
        
    );


    initial
    begin
        $dumpfile("test.vcd");
        $dumpvars(0,dut);
    end


    initial
    begin
        clk = 0;
        forever #500 clk = ~clk;
    end

    initial
    begin
        rstn = 0;
        @(posedge clk);
        @(posedge clk);
        rstn = 1;
        #1000000
        $finish;
    end



    always @(*)
    begin
        clk_in <= #(400+$urandom_range(10,1))  clk;
        data_in <= #(delay_code + 500 ) clk;
    end



endmodule
