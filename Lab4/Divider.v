`timescale 1ns / 1ps

module Divider(
	input clock,
	input reset,
	output reg one_hz_enable
    );

	reg [24:0] clock_counter;
	
	initial begin
		clock_counter = 0;
		one_hz_enable = 0;
	end
	
	
	always @(posedge clock) begin
		if (reset) begin
			clock_counter <= 0;
			one_hz_enable <= 0;
		end
		else if (clock_counter = 27000000) begin
			clock_counter <= 0;
			one_hz_enable <= 1;
		end
		else 
			clock_counter <= clock_counter + 1;
			one_hz_enable <= 0;
	end
endmodule
