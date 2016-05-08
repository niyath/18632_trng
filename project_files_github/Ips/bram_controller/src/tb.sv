module tb(

    );
     parameter DW = 32; //Data Width
    parameter AW = 32; //Address Width
    parameter BRAM_DEPTH = 32;
  //  parameter DW =32 ;
       logic     clk;
       logic   rst;
   
       //Input from TRNG
       logic   trng_bit_in;
   
       //Unused BRAM logic
       logic   [DW-1:0]    bram_dout;
       //Used BRAM interface
       logic  bram_rst;
       logic  bram_clk;
       logic  [DW-1:0]    bram_din;
       logic  bram_en;
       logic  [3:0]       bram_we;
       logic  [AW-1:0]    bram_addr;
       logic bram_full;
     bram_control #(.DW(DW),.AW(AW),.BRAM_DEPTH(BRAM_DEPTH)) dut(
		 
		.clk,
        .rst,
        
        .trng_bit_in,
        
        .bram_full,

        .bram_rst,
        .bram_clk,
        .bram_din,
        .bram_dout,
        .bram_en,
        .bram_we,
        .bram_addr
	     );

	   initial begin 

		   clk =0;
		   forever
		   #5 clk =~clk;
	   end

	   initial 
	   begin
		   rst =1;
		   #50 rst =0 ;
		   # 1000
		   $finish;
	   end

	   always @(negedge clk)
	   begin
		   trng_bit_in <= $random;
	   end

endmodule
