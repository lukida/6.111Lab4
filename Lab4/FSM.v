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
    output fuelpump,
    output status,
    output siren,
	 output reg [3:0]state
    );
	 
	 //List of States
	 parameter armed = 0;
	 parameter wait1 = 1;
	 parameter siren_state = 2;
	 parameter disarm = 3;
	 parameter timer = 4;
	 parameter timer_expired = 5;
    parameter unknown = 6;
	 
	 wire [5:0]command = {passengerdoor, driverdoor, ignition, hidden, brakepedal, timer_expired};

	 initial begin
	 	state = armed;
	 end
	 
	 always @ (posedge clock) begin
	  $display ("command is: ");
	  $display(command);
	  $display("state is:");
	  $display(state);
		casez (command) 
			'bzz1zzz:  state <= disarm;
			'bzz0zzz: begin
				case(state) 
					disarm: state <= wait1; //with driver time wait
					default: state <= unknown;
				endcase
			end
			'b1z0zzz: begin //passenger door open, ignition off
				case (state) 
					disarm: state <= wait1; //wait time is passenger time
					default: state <= unknown;
				endcase
			end
			'bz0zzzz:  begin //driver door open, nothing else matters
				case (state) 
					wait1: state <= timer;
					default: state<= unknown;
				endcase 
			end
			'bzzzzz1: begin
				case (state) 
					wait1: state <= siren;
					siren_state: state <= armed;
					default: state <= unknown;
				endcase				
			end 
			default: begin
			$display("ended up in main default case");
			state <= unknown;
			end
		endcase
	 end
	 
	 always @(*) begin
		if (reset == 1) begin
			state = armed;
		end
	 end
	 
	 assign test_state = state;
	 
endmodule
	