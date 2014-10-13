`timescale 1ns / 1ps

module FSM(
	 input clock,
    input passengerdoor,
    input driverdoor,
    input ignition,
    input hidden,
    input brakepedal,
	 input timer_status,
	 input reset,
	 output reg [3:0]state
    );
	 
	 //List of States
	 parameter armed = 0;
	 parameter wait1 = 1; //t_arm_delay
	 parameter siren_state = 2;
	 parameter disarm = 3;
	 parameter timer = 4;
	 parameter timer_expired = 5;
    parameter unknown = 6;
	 
	 wire [5:0]command = {passengerdoor, driverdoor, ignition, hidden, brakepedal, timer_status};

	 initial begin
	 	state = armed;
	 end
	 
	 always @ (posedge clock) begin  
	   $display(command);
		casex (command) 
			'bxx1xxx:  begin
				$display("case1");
				state <= disarm;
			end
			'bxx0xxx: begin
				$display("case2");
				case(state) 
					armed: $display("armed and in case2");
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
	 
	 always @(*) begin
		if (reset == 1) begin
			state = armed;
		end
	 end
	 
endmodule
	