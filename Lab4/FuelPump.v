`timescale 1ns / 1ps

module FuelPump(
    input clock,
    input passengerdoor,
    input driverdoor,
    input ignition,
    input hidden,
    input brakepedal,
	 input timer_status,
    output reg fuelpump,
    output status,
    output siren
	 );
	 
	 parameter ignition_off = 0;
	 parameter ignition_on = 1;
	 parameter power_on = 2;
	 
	 reg [1:0] fuelpump_state;
	 
	 initial begin
	 fuelpump_state = 0;
	 end
	 
	 always @(*) begin
		case () begin
		ignition == 0: fuelpump_state = ignition_off;
		ignition == 1: fuelpump_state = ignition_on;
		(hidden == 1 && breakpedal == 1 && fuelpump_state == ignition_on): fuelpump_state = power_on; 
		end
		if (fuelpump_state == power_on) begin
			fuelpump = 1;
		end
		else begin
			fuelpump = 0;
		end
	 end
endmodule