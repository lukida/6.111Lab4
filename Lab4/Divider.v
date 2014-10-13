`timescale 1ns / 1ps

module Divider(
	input clock,
	input start_timer,
	output reg one_hz_enable
    );

	reg [24:0] clock_counter;
	
	always @(posedge clock) begin
		clock_counter <= clock_counter + 1;
	end
	
	always @(*) begin
	
		if (Start_Timer == 1) begin
			clock_counter = 0;
		end
		
		if (clouck_counter == 27000000) begin
			one_hz_enable = 1;
			clock_counter = 0;
		end
	
	end

endmodule
