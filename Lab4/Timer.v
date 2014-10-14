`timescale 1ns / 1ps
module Timer(
	input reset,
	input clock,
	input one_hz_enable,
	input start_timer,
	input [3:0] timer_values, 
	output reg timer_expired,
	output reg [3:0] timer_length,
    );

    reg[3:0] offset_timer_length; 
    //since the timer needs to be synchronous, we need to store the previous value of the timer length to make it work out timing-wise 

    initial begin
    	timer_expired = 0;
    	timer_length = 0;
    	offset_timer_legnth = 0;
    end

    //THIS HAS TO BE SYNCHRONOUS
    always @(posedge clock) begin
    	offset_timer_length <= timer_length;
    	//store the timer length

    	if (reset) begin
    		timer_expired <= 0;
    		timer_length <= 0;
    	end
    	else if (timer_expired == 1) begin
    		timer_expired <= 0;
    	end
    	else if (start_timer == 1) begin
    		timer_length <= timer_values;
    	end
    	else if (one_hz_enable == 1 && timer_length >0) begin
    		timer_length <= timer_length - 1;
    	end
    	else if (timer == 0 && ~offset_timer_length == 0) begin
    		timer_expired == 1;
    	end
    end
endmodule
