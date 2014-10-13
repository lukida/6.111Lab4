`timescale 1ns / 1ps

module FSMTest5;

	// Inputs
	reg clock;
	reg passengerdoor;
	reg driverdoor;
	reg ignition;
	reg hidden;
	reg brakepedal;
	reg timer_status;
	reg reset;

	// Outputs
	wire fuelpump;
	wire status;
	wire siren;
	wire [3:0] state;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clock(clock), 
		.passengerdoor(passengerdoor), 
		.driverdoor(driverdoor), 
		.ignition(ignition), 
		.hidden(hidden), 
		.brakepedal(brakepedal), 
		.timer_status(timer_status), 
		.reset(reset), 
		.fuelpump(fuelpump), 
		.status(status), 
		.siren(siren), 
		.state(state)
	);
	
	always begin
		#5 clock = ~clock;
	end

	initial begin
		// Initialize Inputs
		clock = 0;
		passengerdoor = 0;
		driverdoor = 0;
		ignition = 0;
		hidden = 0;
		brakepedal = 0;
		timer_status = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ignition = 1; //if the ignition is on we should be in the disarmed state
		//which is state = 3
		
	end
      
endmodule

