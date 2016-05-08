/*


    Author : Abhijith Kashyap
    Company : CMU

    Design name : trng_control

    Description : Control logic for TRNG + LFSR

*/



module trng_control(
        clk,
        rstn,

        trng_bit_in,
        lfsr_load_data,
        lfsr_load_en,
        shifter_load_data
);
    
    parameter   LFSR_WIDTH = 128;
    parameter   SHIFTER_WIDTH = 16;
    

    input clk;
    input rstn;

    input trng_bit_in;

    input   [SHIFTER_WIDTH-1:0] shifter_load_data;

    output  [LFSR_WIDTH-1:0]    lfsr_load_data;
    output lfsr_load_en;

    reg     [LFSR_WIDTH-1:0]    shift_reg;
    reg     [SHIFTER_WIDTH-1:0]    shift_counter;
    
    reg     [1:0]   von_n_corrector;
    reg     von_n_count;
    wire    von_n_enable;


    always @(posedge clk)
    begin
        if (~rstn)
        begin
            von_n_corrector <= '0;
            von_n_count <= 0;
        end
        else
        begin
            von_n_corrector <= {trng_bit_in,von_n_corrector[1]};
            von_n_count <= ~von_n_count;
        end
    end


    assign von_n_enable = von_n_count & (^von_n_corrector) ;


    always @(posedge clk)
    begin
        if (~rstn)
        begin
            shift_counter <= shifter_load_data;
            shift_reg <= '1;
        end
        else
        begin
            if (von_n_enable)
            begin
                if (shift_counter == 0)
                    shift_counter <= shifter_load_data;
                else
                    shift_counter <= shift_counter - 1;

                shift_reg <= {(von_n_corrector[1] & ~von_n_corrector[0]),
                    shift_reg[LFSR_WIDTH-1:1]};
            end
        end
    end

    assign lfsr_load_en = (shift_counter == 0);
    assign lfsr_load_data = shift_reg;

endmodule
