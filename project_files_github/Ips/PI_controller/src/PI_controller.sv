`timescale 1ns/1ps

module PI_controller(
    clk,
    rstn,
    data_in,
//    clk_in,

   	clk_coarse_delay_ctrl ,
	data_coarse_delay_ctrl,
    delay_update,
    locked
);

parameter DL_LENGTH =64;
parameter DL_CODE_WIDTH = 6; //max 2^DL_CODE_WIDTH delay elements
parameter PD_SR_WIDTH = 8; //hysterisis register. should never be '1 or '0 when
                           //flop is in metastability
parameter PD_COUNT_W = 4;
parameter AVG_WIDTH = 5; //average for 2^AVG_WIDTH cycles

    input clk;
    input rstn;

    input data_in;
  //  input clk_in;

 (* dont_touch = "yes" *)    wire  [DL_CODE_WIDTH-1:0]     delay_code;
    output  delay_update;
    output  locked;
	output  [DL_CODE_WIDTH-1:0] 	clk_coarse_delay_ctrl ;
	output  [DL_CODE_WIDTH-1:0] 	data_coarse_delay_ctrl;

    
 (* dont_touch = "yes" *)    reg     pd_out;
 (* dont_touch = "yes" *)    reg     [PD_SR_WIDTH-1:0]   pd_shift_reg;
 (* dont_touch = "yes" *)    reg     [DL_CODE_WIDTH-1:0] delay_code_reg;
  (* dont_touch = "yes" *)    reg    [DL_CODE_WIDTH-1:0] delay_code_reg_data;
 	

   reg     [DL_CODE_WIDTH+AVG_WIDTH-1:0] delay_code_avg;
//  reg     [AVG_WIDTH-1:0]   avging_counter;
 (* dont_touch = "yes" *)    reg  signed    [DL_CODE_WIDTH-1:0] final_code_reg,final_code_reg_data;
  (* dont_touch = "yes" *)   reg     delay_update_reg;
  (* dont_touch = "yes" *)   reg     [3:0]   lock_reg;
 (* dont_touch = "yes" *)    reg     [PD_COUNT_W-1:0] pd_count_ones;
    int     idx;
	
	 (* dont_touch = "yes" *) reg flag_180_phase;	


    //Accumulates the pd_out signals
    always @(negedge clk)
    begin
        if (rstn==0)
            pd_shift_reg <= '0;
        else
            pd_shift_reg <= {data_in,pd_shift_reg[PD_SR_WIDTH-1:1]};
    end


    
    //Whenever not in metastability, increment or decrement code register
    //data_in early means increase code
    //clk_in early means decrease code
    always @(negedge clk) 
    begin
        if (rstn==0) begin
            delay_code_reg <= '0;
			delay_code_reg_data <='0;
			flag_180_phase <=0;
		end
        else begin
            if (((pd_count_ones < $floor(PD_SR_WIDTH/3))&& ~flag_180_phase) || (flag_180_phase && (pd_count_ones > (PD_SR_WIDTH -$floor(PD_SR_WIDTH/3)) ) ))
			begin
				if(delay_code_reg < DL_LENGTH-1)
			                delay_code_reg <= delay_code_reg + 1;
				else begin
						delay_code_reg <=0;	
						flag_180_phase <=1;
				end
			end	
            else if (((pd_count_ones > (PD_SR_WIDTH -$floor(PD_SR_WIDTH/3)))&& ~flag_180_phase) ||  (flag_180_phase && (pd_count_ones < $floor(PD_SR_WIDTH/3)) ))
            begin
                 if(delay_code_reg_data < DL_LENGTH-1)
			                delay_code_reg_data <= delay_code_reg_data + 1;
				else begin
						delay_code_reg_data <=0;	
						flag_180_phase <=1;
				end
			end
		end		
					
        
    end



   always @(*)
   begin
       pd_count_ones = '0;
       for(idx=0; idx < PD_SR_WIDTH; idx=idx+1)
           pd_count_ones = pd_count_ones + pd_shift_reg[idx];
   end


    //look at current code 
    //if that is more than 10 DL steps off from the average in the prev window
    //update the final counter

    always @(negedge clk)
    begin
        if (rstn==0)
        begin
            final_code_reg <= '0;
			final_code_reg_data <='0;
            delay_update_reg <= '0;
        end
        else
        begin
            if ($signed(final_code_reg - delay_code_reg) > 10 || 
                $signed(final_code_reg - delay_code_reg) < -10 ||
				$signed(final_code_reg_data - delay_code_reg_data) > 10 || 
                $signed(final_code_reg_data - delay_code_reg_data) < -10)	 
            begin
                $display("FC %d, DC %d",final_code_reg,delay_code_reg);
                final_code_reg <= delay_code_reg;
				final_code_reg_data <= delay_code_reg_data;
                delay_update_reg <= 1;
            end
            else
                delay_update_reg <= 0;

        end
    end

    //if no updates in the prev 4 windows, put out a lock signal
    always @(negedge clk)
    begin
        if (rstn==0)
            lock_reg <= '0;
        else
        begin
         //   if (avging_counter=='1) // -what
                lock_reg <= {delay_update_reg,lock_reg[3:1]};
        end
    end
	

	assign clk_coarse_delay_ctrl  =  delay_code_reg ;
	assign data_coarse_delay_ctrl = delay_code_reg_data ;
	
 	assign clk_fine_delay_ctrl =0;
	assign data_fine_delay_ctrl=0;

    assign delay_code = final_code_reg;
    assign delay_update = delay_update_reg;
    assign locked = ~|lock_reg;


endmodule


        

