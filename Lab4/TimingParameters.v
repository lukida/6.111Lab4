`timescale 1ns / 1ps
module TimingParameters(
	 input clock,
    input passengerdoor,
    input driverdoor,
    input ignition,
    input hidden,
    input brakepedal,
	 input timer_status,
    output fuelpump,
    output status,
    output siren,
	 output state
	 );

	reg [1:0] memory;
	reg reset;
	
	initial begin
	memory = 'b1111;
	end
	
	parameter arming_delay = 0;
	parameter countdown_driver_door = 1;
	parameter countdown_passenger_door = 2;
	parameter siren_on_time = 3;
	
	//TODO: wire the switches
	always @(*) begin
		//choose which value to set to memory
		case (Time_Parameter_Selector) begin
		arming_delay: T_ARM_DELAY = memory;
		countdown_driver_door: T_DRIVER_DELAY = memory;
		countdown_passenger_door: T_PASSENGER_DELAY = memory;
		siren_on_time: T_ALARM_ON = memory;
		endcase
		memory = Time_Value;
		//reset is in the FSM
	end

endmodule
