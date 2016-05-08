/*

Author : Abhijith Kashyap
Company : CMU

Module : bram_control

Description : Generate control signals and data packing to BRAM

*/



module bram_control (
        clk,
        rst,
        
        trng_bit_in,
        
        bram_full,

        bram_rst,
        bram_clk,
        bram_din,
        bram_dout,
        bram_en,
        bram_we,
        bram_addr,
    );

    parameter DW = 32; //Data Width
    parameter AW = 32; //Address Width
    parameter BRAM_DEPTH = 8192;
    

    input   clk;
    input   rst;

    //Input from TRNG
    input   trng_bit_in;

    //Unused BRAM output
    input   [DW-1:0]    bram_dout;
    //Used BRAM interface
    output  bram_rst;
    output  bram_clk;
    output  [DW-1:0]    bram_din;
    output  bram_en;
    output  [3:0]       bram_we;
    output  [AW-1:0]    bram_addr;


    //Output signals
    output  bram_full;


    //Pass through signals
    assign bram_clk = clk;
    assign bram_rst = rst;
    assign bram_en = 1'b1;


    reg     [AW-1:0]    addr,addr_reg;
    reg     [3:0]       write_en;
    
    reg     [DW-1:0]    shift_reg_data;
    reg     [4:0]       shift_count;
    


    //Shift reg and counter
    always @(posedge clk)
    begin
        if (rst)
        begin
            shift_count <= '1;
            shift_reg_data <= '0;
        end
        else
        begin
            shift_count <= shift_count - 1;
            shift_reg_data <= {trng_bit_in, shift_reg_data[DW-1:1]};
        end
    end

    
     always @(posedge clk)
       begin
           if (rst)
                addr_reg <=0;
            else 
                addr_reg <= addr;
       end

    always @(posedge clk)
    begin
        if (rst)
        begin
            addr <= '0;
            write_en <= 4'b0;
        end
        else
        begin
            if (shift_count==0 && addr<BRAM_DEPTH*4)
            begin
                write_en <= 4'b1111;
                addr <= addr + 4;
            end
            else
                write_en <= '0;
        end
    end

    assign bram_addr = addr_reg ;
    assign bram_we = write_en;
    assign bram_din = shift_reg_data ;

    assign bram_full = (addr==BRAM_DEPTH*4);


endmodule




    

