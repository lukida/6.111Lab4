`timescale 1ns / 1ps

//FIX THE FSM///



module FSM(
	input reset,
	input clock,
    input passengerdoor,
    input driverdoor,
    input ignition,
    input timer_expired,
	output reg [1:0]timer_interval,
	output reg [3:0]state,
	output reg siren,
	output reg start_timer
    );
	 
	 ////List of States////
	 parameter armed = 0;
	 parameter wait1 = 1; //t_arm_delay
	 parameter siren_state = 2;
	 parameter disarm = 3;
	 parameter timer = 4;
	 parameter timer_expired = 5;
     parameter unknown = 6;
	 
	 ////Timer Interval Parameters ////
    parameter [1:0] T_ALARM_ON = 2'b11;
    parameter [1:0] T_PASSENGER_DELAY = 2'b10;
    parameter [1:0] T_DRIVER_DELAY = 2'b01;
    parameter [1:0] T_ARM_DELAY = 2'b00;


	 //we need to offset driver and passenger to take into account the previous values for these like we did 
	 reg offset_driverdoor;
	 reg offset_passengerdoor;

	 initial begin
	 	state = armed;
	 	siren = 0;
	 	start_timer = 0;
	 	timer_interval = 4;
	 	//internal variables//
	 	offset_driver_door = 0;
	 	offset_passenger_door = 0;
	 end





	 wire [5:0]command = {passengerdoor, driverdoor, ignition, hidden, brakepedal, timer_status};
	 
	 always @ (posedge clock) begin  
	   offset_passengerdoor <= passengerdoor;
	   offset_driverdoor <= driverdoor;

		casex (command) 
			'bxx1xxx:  begin
				$display("case1");
				state <= disarm;
			end
			'bxx0xxx: begin
				$display("case2");
				case(state) 
					disarm: state <= wait1; //with driver time wait
				endcase
			end
			'b1x0xxx: begin //passenger door open, ignition off
				$display("case3");
				case (state) 
					disarm: state <= wait1; //wait time is passenger time
				endcase
			end
			'bx0xxxx:  begin //driver door open, nothing else matters
				$display("case4");
				case (state)
					wait1: state <= timer;
				endcase 
			end
			'bxxxxx1: begin
				$display("case5");
				case (state) 
					wait1: state <= siren_state;
					siren_state: state <= armed;
				endcase				
			end 
			default: begin
				$display("main case statement");
				state <= unknown;
			end
		endcase
	 end

endmodule
	