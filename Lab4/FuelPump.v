`timescale 1ns / 1ps

module FuelPump(
    input clock,
    input reset,
    input ignition,
    input hidden,
    input brakepedal,
    output reg fuelpump,
	);
	 
	 parameter ignition_off = 0;
	 parameter ignition_on = 1;
	 parameter power_on = 2;
	 
	 reg [1:0] fuelpump_state;
	 
	 initial begin
		fuelpump_state = 0;
	 	fuelpump = 0;
	 end
	 
	 always @(*) begin
		case (ignition) 
			0: fuelpump_state = ignition_off;
			1: fuelpump_state = ignition_on;
		endcase
		
		if (hidden == 1 && brakepedal == 1 && fuelpump_state == ignition_on) begin
			fuelpump_state = power_on; 
		end
		
		//output conditions
		if (fuelpump_state == power_on) begin
			fuelpump = 1;
		end
		else begin
			fuelpump = 0;
		end
	 end
endmodule
